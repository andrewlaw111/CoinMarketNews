import React from 'react';
import { Modal, Text, TouchableHighlight, View, TextInput, StyleSheet } from 'react-native';
import { ICoinPrice, ISettings, IAlerts, IUser } from '../models';
import { Segment, Button } from 'native-base';
import { IRootState } from '../redux/store';
import { addAlerts, removeAlerts, editAlert } from '../redux/actions/alerts';
import { connect } from 'react-redux';

interface ICoinAlertsModalProps {
    appSettings: ISettings;
    coinPrice: ICoinPrice;
    darkMode: boolean;
    modalVisible: boolean, closeModal: () => void;
    alerts: IAlerts[];
    user: IUser;
    addAlerts: (alert: IAlerts, token: string) => void;
}

interface ICoinAlertsModalState {
    alertAmountCrypto: string;
    alertAmountFiat: string;
    fiatCurrency: boolean
}

class PureCoinAlertsModal extends React.Component<ICoinAlertsModalProps, ICoinAlertsModalState> {
    constructor(props: ICoinAlertsModalProps) {
        super(props);
        this.state = {
            alertAmountCrypto: this.props.coinPrice.price_crypto.price.toString(),
            alertAmountFiat: this.props.coinPrice.price_fiat.price.toString(),
            fiatCurrency: true,
        };
    }

    public render() {
        return (
            <View style={{ marginTop: 22 }}>
                <Modal
                    animationType="slide"
                    transparent={true}
                    visible={this.props.modalVisible}
                    onRequestClose={this.closeModal}
                >
                    <View
                        style={{ flex: 1, flexDirection: "column", justifyContent: "flex-end", }}
                    >
                        <View style={style(this.props.darkMode).modalForm}>
                            <View style={style(this.props.darkMode).modalHeading}>
                                <Text style={style(this.props.darkMode).text}>Add a Price Alert for {this.props.coinPrice.name}</Text>
                            </View>

                            <View style={style(this.props.darkMode).modalFormComponentsWrapper}>
                                <Segment style={style(this.props.darkMode).segment}>
                                    <Button first={true} onPress={this.changeCurrency.bind(this, "fiat")}>
                                        <Text style={style(this.props.darkMode).text}>{this.props.appSettings.fiatCurrency}</Text>
                                    </Button>
                                    <Button last={true} onPress={this.changeCurrency.bind(this, "crypto")}>
                                        <Text style={style(this.props.darkMode).text}>{this.props.appSettings.cryptoCurrency}</Text>
                                    </Button>
                                </Segment>

                                {/* <View style={style(this.props.darkMode).modalForm}> */}
                                <View style={{ flexDirection: "row" }} >
                                    <TextInput
                                        keyboardType="numeric"
                                        style={style(this.props.darkMode).textInput}
                                        onChangeText={this.changeAlertAmount}
                                        returnKeyType="done"
                                        underlineColorAndroid="transparent"
                                        value={(this.state.fiatCurrency) ? this.state.alertAmountFiat : this.state.alertAmountCrypto}
                                    />
                                </View>
                                <View style={style(this.props.darkMode).buttonsView}>
                                    <Button style={style(this.props.darkMode).buttons} onPress={this.handleAdd}>
                                        <Text style={style(this.props.darkMode).text}>Add Alert</Text>
                                    </Button>
                                    <Button onPress={this.closeModal} style={style(this.props.darkMode).buttons}>
                                        <Text style={style(this.props.darkMode).text}>Close</Text>
                                    </Button>
                                </View>
                            </View>

                        </View>
                    </View>
                </Modal>

            </View>
        );
    }
    private changeCurrency = (currency: string) => {
        if (currency === "fiat") {
            this.setState({
                fiatCurrency: true
            })
        } else {
            this.setState({
                fiatCurrency: false
            })
        }
    }
    private changeAlertAmount = (amount: string) => {
        if (/^\d*\.?\d*$/.test(amount)) {
            if (this.state.fiatCurrency) {
                this.setState({
                    alertAmountFiat: amount,
                })
            } else {
                this.setState({
                    alertAmountCrypto: amount,
                })
            }
        }
    }
    public closeModal = () => {
        return this.props.closeModal()
    }
    public handleAdd = () => {
        let alert: IAlerts;
        let upper: boolean;
        if (this.state.fiatCurrency) {
            upper = (parseFloat(this.state.alertAmountFiat) >= this.props.coinPrice.price_fiat.price) ? true : false;
            alert = {
                coinmarketcap_id: this.props.coinPrice.coinmarketcap_id,
                currency_symbol: this.props.appSettings.fiatCurrency,
                price_point: parseFloat(this.state.alertAmountFiat),
                active: true,
                upper,
            }
        } else {
            upper = (parseFloat(this.state.alertAmountCrypto) >= this.props.coinPrice.price_crypto.price) ? true : false;
            alert = {
                coinmarketcap_id: this.props.coinPrice.coinmarketcap_id,
                currency_symbol: this.props.appSettings.cryptoCurrency,
                price_point: parseFloat(this.state.alertAmountCrypto),
                active: true,
                upper,
            }
        }
        this.props.closeModal()
        return this.props.addAlerts(alert, this.props.user.token)
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        addAlerts: (alert: IAlerts, token: string) => dispatch(addAlerts(alert, token)),
    };
};

const mapStateToProps = (state: IRootState) => {
    return {
        alerts: state.alerts.alerts,
        user: state.user.user,
    };
};

const CoinAlertsModal = connect(mapStateToProps, mapDispatchToProps)(PureCoinAlertsModal);
export default CoinAlertsModal

const style = (darkMode: boolean) => StyleSheet.create({
    buttons: {
        backgroundColor: "#2874F0",
        borderColor: (darkMode) ? "#F8F8F8" : "#454951",
        borderWidth: 2,
        borderRadius: 5,
        marginTop: 10,
        marginBottom: 10,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
        width: 200
    },
    buttonsView: {
        alignItems: "center",
    },
    modalForm: {
        flex: 0.55,
        marginTop: 22,
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        padding: 40,
        elevation: 8,
    },
    modalFormComponentsWrapper: {
        flex: 0.8,
        alignItems: "center",
        justifyContent: "space-between",
    },
    modalHeading: {
        flex: 0.2,
        flexDirection: "row",
        justifyContent: 'center'
    },
    segment: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8"
    },
    text: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    textInput: {
        height: 40,
        backgroundColor: "#F8F8F8",
        borderColor: 'gray',
        borderRadius: 5,
        borderWidth: 1,
        flex: 1
    }
})