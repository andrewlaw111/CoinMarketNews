import React from 'react';
import { Modal, Text, TouchableHighlight, View, TextInput, StyleSheet } from 'react-native';
import { ICoinPrice, ISettings } from '../models';
import { Segment, Button } from 'native-base';

interface ICoinAlertsModalProps {
    appSettings: ISettings;
    coinPrice: ICoinPrice;
    darkMode: boolean;
    modalVisible: boolean, closeModal: () => void;
}

interface ICoinAlertsModalState {
    alertAmountCrypto: string;
    alertAmountFiat: string;
    fiatCurrency: boolean
}

class CoinAlertsModal extends React.Component<ICoinAlertsModalProps, ICoinAlertsModalState> {
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
                                <View style={style(this.props.darkMode).modalView}>
                                    <Segment>
                                        <Button first={true} onPress={this.changeCurrency.bind(this, "fiat")}>
                                            <Text style={style(this.props.darkMode).text}>{this.props.appSettings.fiatCurrency}</Text>
                                        </Button>
                                        <Button last={true} onPress={this.changeCurrency.bind(this, "crypto")}>
                                            <Text style={style(this.props.darkMode).text}>{this.props.appSettings.cryptoCurrency}</Text>
                                        </Button>
                                    </Segment>
                                </View>

                                {/* <View style={style(this.props.darkMode).modalForm}> */}
                                <TextInput
                                    keyboardType="numeric"
                                    style={{ height: 40, borderColor: 'gray', borderWidth: 1 }}
                                    onChangeText={this.changeAlertAmount}
                                    returnKeyType="done"
                                    underlineColorAndroid="transparent"
                                    value={(this.state.fiatCurrency) ? this.state.alertAmountFiat : this.state.alertAmountCrypto}
                                />
                                <View style={style(this.props.darkMode).buttonsView}>
                                    <Button style={style(this.props.darkMode).buttons} onPress={this.handleAdd}>
                                        <Text style={style(this.props.darkMode).text}>Add Alert</Text>
                                    </Button>
                                    <Button onPress={this.closeModal}>
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
    public closeModal = () => {
        return this.props.closeModal()
    }
    public handleAdd = () => {
        return this.props.closeModal()
    }
}

export default CoinAlertsModal

const style = (darkMode: boolean) => StyleSheet.create({
    buttons: {
        borderColor: (darkMode) ? "#F8F8F8" : "#454951"
    },
    buttonsView: {
        width: 200
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
        width: 300,
        alignItems: "center",
        justifyContent: "space-between",
    },
    modalHeading: {
        flex: 0.2
    },
    modalView: {
        flexDirection: "row",
        justifyContent: "center",
        flex: 1,
    },
    text: {
        color: (darkMode) ? "#F8F8F8" : "#000"
    }
})