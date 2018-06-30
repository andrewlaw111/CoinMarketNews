import React from 'react';
import { Modal, Text, TouchableHighlight, View, TextInput, StyleSheet, KeyboardAvoidingView, PanResponder, PanResponderInstance, Animated } from 'react-native';
import { ICoinPrice, ISettings, IAlerts, IUser } from '../models';
import { Segment, Button, Icon } from 'native-base';
import { IRootState } from '../redux/store';
import { addAlerts, removeAlerts, editAlert } from '../redux/actions/alerts';
import { connect } from 'react-redux';

interface ICoinAlertsModalProps {
    appSettings: ISettings;
    coinPrice: ICoinPrice;
    darkMode: boolean;
    alerts: IAlerts[];
    user: IUser;
    addAlerts: (alert: IAlerts, token: string) => void;
}

interface ICoinAlertsModalState {
    alertAmountCrypto: string;
    alertAmountFiat: string;
    fiatCurrency: boolean;
    modalBottom: number;
}

class PureCoinAlertsModal extends React.Component<ICoinAlertsModalProps, ICoinAlertsModalState> {
    private panResponder: PanResponderInstance;
    private gestureStart: number;

    constructor(props: ICoinAlertsModalProps) {
        super(props);
        this.state = {
            alertAmountCrypto: this.props.coinPrice.price_crypto.price.toString(),
            alertAmountFiat: this.props.coinPrice.price_fiat.price.toString(),
            fiatCurrency: true,
            modalBottom: -400.
        };
        this.panResponder = PanResponder.create({
            // Ask to be the responder:
            onStartShouldSetPanResponder: (evt, gestureState) => true,
            onStartShouldSetPanResponderCapture: (evt, gestureState) => true,
            onMoveShouldSetPanResponder: (evt, gestureState) => true,
            onMoveShouldSetPanResponderCapture: (evt, gestureState) => true,

            onPanResponderGrant: (evt, gestureState) => {
                // The gesture has started. Show visual feedback so the user knows
                // what is happening!

                // gestureState.d{x,y} will be set to zero now
                this.gestureStart = this.state.modalBottom;
            },
            onPanResponderMove: (evt, gestureState) => {
                const modalBottom = this.gestureStart - gestureState.dy;
                if (modalBottom > -400 && modalBottom < -50) {
                    this.setState({
                        modalBottom
                    });
                } else {
                    return
                }
                // The most recent move distance is gestureState.move{X,Y}

                // The accumulated gesture distance since becoming responder is
                // gestureState.d{x,y}
            },
            onPanResponderTerminationRequest: (evt, gestureState) => true,
            onPanResponderRelease: (evt, gestureState) => {
                if (this.gestureStart === -400) {
                    //STart from bottom
                    if (this.state.modalBottom > -340) {
                        this.setState({
                            modalBottom: -50
                        })
                    } else {
                        this.setState({
                            modalBottom: -400
                        })
                    }
                } else {
                    //Start from top
                    if (this.state.modalBottom > -90) {
                        this.setState({
                            modalBottom: -50
                        })
                    } else {
                        this.setState({
                            modalBottom: -400
                        })
                    }
                }
                // The user has released all touches while this view is the
                // responder. This typically means a gesture has succeeded
            },
            onPanResponderTerminate: (evt, gestureState) => {
                // Another component has become the responder, so this gesture
                // should be cancelled
            },
            onShouldBlockNativeResponder: (evt, gestureState) => {
                // Returns whether this component should block native components from becoming the JS
                // responder. Returns true by default. Is currently only supported on android.
                return true;
            },
        });

    }

    public render() {

        return (
            <View style={{ marginTop: 22 }}>
                <View
                    style={{ flex: 1, flexDirection: "column", justifyContent: "flex-end", }}
                >
                    <Animated.View style={[style(this.props.darkMode).modalForm, { bottom: this.state.modalBottom, }]}>
                        <View style={{ top: -40, flexDirection: "row", justifyContent: "center" }} {...this.panResponder.panHandlers}>
                            {(this.state.modalBottom < -250) ? <Icon type="Ionicons" name="ios-arrow-up" /> : <Icon type="Ionicons" name="ios-arrow-down" />}
                        </View>
                        <View style={style(this.props.darkMode).modalHeading}>
                            <Text style={style(this.props.darkMode).text}>Add a Price Alert for {this.props.coinPrice.name}</Text>
                        </View>

                        <View style={style(this.props.darkMode).modalFormComponentsWrapper}>
                            <Segment style={style(this.props.darkMode).segment}>
                                <Button first={true} onPress={this.changeCurrency.bind(this, "fiat")} active={(this.state.fiatCurrency) ? true : false}>
                                    <Text style={style(this.props.darkMode).text}>{this.props.appSettings.fiatCurrency}</Text>
                                </Button>
                                <Button last={true} onPress={this.changeCurrency.bind(this, "crypto")} active={(this.state.fiatCurrency) ? false : true}>
                                    <Text style={style(this.props.darkMode).text}>{this.props.appSettings.cryptoCurrency}</Text>
                                </Button>
                            </Segment>

                            {/* <View style={style(this.props.darkMode).modalForm}> */}
                            <KeyboardAvoidingView style={{ flexDirection: "row" }} >
                                <TextInput
                                    keyboardType="numeric"
                                    style={style(this.props.darkMode).textInput}
                                    onChangeText={this.changeAlertAmount}
                                    onFocus={this.shiftUp}
                                    returnKeyType="done"
                                    underlineColorAndroid="transparent"
                                    value={(this.state.fiatCurrency) ? this.state.alertAmountFiat : this.state.alertAmountCrypto}
                                />
                            </KeyboardAvoidingView>
                            <View style={style(this.props.darkMode).buttonsView}>
                                <Button style={style(this.props.darkMode).buttons} onPress={this.handleAdd}>
                                    <Text style={style(this.props.darkMode).text}>Add Alert</Text>
                                </Button>
                                <Button onPress={this.closeModal} style={style(this.props.darkMode).buttons}>
                                    <Text style={style(this.props.darkMode).text}>Close</Text>
                                </Button>
                            </View>
                        </View>

                    </Animated.View>
                </View>

            </View >
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
        this.setState({
            alertAmountCrypto: this.props.coinPrice.price_crypto.price.toString(),
            alertAmountFiat: this.props.coinPrice.price_fiat.price.toString(),
            modalBottom: -400,
        })
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
        this.props.addAlerts(alert, this.props.user.token)
        this.closeModal()
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        addAlerts: (alert: IAlerts, token: string) => dispatch(addAlerts(alert, token)),
    };
};

const mapStateToProps = (state: IRootState) => {
    return {
        alerts: state.alerts.priceAlerts,
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
        height: 500,
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