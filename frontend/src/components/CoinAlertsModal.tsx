import React from 'react';
import { Text, View, TextInput, StyleSheet, KeyboardAvoidingView, PanResponder, PanResponderInstance, Animated, Dimensions, Platform, TouchableOpacity } from 'react-native';
import { ICoinPrice, ISettings, IAlerts, IUser } from '../models';
import { Segment, Button, Icon } from 'native-base';
import { IRootState } from '../redux/store';
import { addAlerts, removeAlerts, editAlert } from '../redux/actions/alerts';
import { connect } from 'react-redux';
import { lightItemsBorder, darkItemsBorder } from './styles/colours';

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
    modalOpen: boolean;
    pan: any;
}

class PureCoinAlertsModal extends React.Component<ICoinAlertsModalProps, ICoinAlertsModalState> {
    private panResponder: PanResponderInstance;

    constructor(props: ICoinAlertsModalProps) {
        super(props);
        this.state = {
            alertAmountCrypto: this.props.coinPrice.price_crypto.price.toString(),
            alertAmountFiat: this.props.coinPrice.price_fiat.price.toString(),
            fiatCurrency: true,
            modalOpen: false,
            pan: new Animated.ValueXY(),
        };
        this.panResponder = PanResponder.create({
            // Ask to be the responder:
            onStartShouldSetPanResponder: (evt, gestureState) => true,
            onStartShouldSetPanResponderCapture: (evt, gestureState) => true,
            onMoveShouldSetPanResponder: (evt, gestureState) => true,
            onMoveShouldSetPanResponderCapture: (evt, gestureState) => true,

            onPanResponderGrant: (evt, gestureState) => {
                this.state.pan.setOffset({ x: this.state.pan.x._value, y: this.state.pan.y._value });
                this.state.pan.setValue({ x: 0, y: 0 });
            },
            onPanResponderMove: (e, gestureState) => {
                Animated.event([null, { dx: this.state.pan.x, dy: this.state.pan.y }])(e, gestureState)
            },
            onPanResponderTerminationRequest: (evt, gestureState) => false,
            onPanResponderRelease: (evt, gestureState) => {
                this.state.pan.flattenOffset();
                if (this.state.modalOpen) {
                    if (this.state.pan.y._value < 5 && this.state.pan.y._value > -5) {
                        this.closeModal()
                    }
                    else if (this.state.pan.y._value > -50) {
                        this.openModal()
                    } else {
                        this.closeModal()
                    }
                } else {
                    if (this.state.pan.y._value < 5 && this.state.pan.y._value > -5) {
                        this.openModal()
                    } else if (this.state.pan.y._value < -90) {
                        this.openModal()
                    } else {
                        this.closeModal()
                    }

                }
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
    public renderForm = () => {
        return (
            <View style={style(this.props.darkMode).modalFormComponentsWrapper}>
                <Segment style={style(this.props.darkMode).segment}>
                    <Button
                        style={(Platform.OS === "android") ? [style(this.props.darkMode).segmentButton, { backgroundColor: (this.state.fiatCurrency) ? "#3f78ba" : null }] : null}
                        first={true}
                        onPress={this.changeCurrency.bind(this, "fiat")}
                        active={(this.state.fiatCurrency) ? true : false}
                    >
                        <Text style={(this.state.fiatCurrency) ? style(this.props.darkMode).textSegmentButtonActive : style(this.props.darkMode).textSegmentButton}>
                            {this.props.appSettings.fiatCurrency}
                        </Text>
                    </Button>
                    <Button
                        style={(Platform.OS === "android") ? [style(this.props.darkMode).segmentButton, { backgroundColor: (this.state.fiatCurrency) ? null : "#3f78ba" }] : null}
                        last={true}
                        onPress={this.changeCurrency.bind(this, "crypto")}
                        active={(this.state.fiatCurrency) ? false : true}
                    >
                        <Text style={(this.state.fiatCurrency) ? style(this.props.darkMode).textSegmentButton : style(this.props.darkMode).textSegmentButtonActive}>
                            {this.props.appSettings.cryptoCurrency}
                        </Text>
                    </Button>
                </Segment>

                {/* <View style={style(this.props.darkMode).modalForm}> */}
                <KeyboardAvoidingView style={{ flexDirection: "row" }} >
                    <TextInput
                        keyboardType="numeric"
                        style={style(this.props.darkMode).textInput}
                        onFocus={this.onFocus}
                        onBlur={this.onBlur}
                        onChangeText={this.changeAlertAmount}
                        returnKeyType="done"
                        underlineColorAndroid="transparent"
                        value={(this.state.fiatCurrency) ? this.state.alertAmountFiat : this.state.alertAmountCrypto}
                    />
                </KeyboardAvoidingView>
                <View style={style(this.props.darkMode).buttonsView}>
                    <Button style={style(this.props.darkMode).buttons} onPress={this.handleAdd}>
                        <Text style={style(this.props.darkMode).textButton}>Add Alert</Text>
                    </Button>
                    <Button style={style(this.props.darkMode).buttons} onPress={this.closeModal}>
                        <Text style={style(this.props.darkMode).textButton}>Close</Text>
                    </Button>
                </View>
            </View>
        )
    }
    public render() {
        let { pan } = this.state;
        // Calculate the x and y transform from the pan value
        let [translateX, translateY] = [pan.x, pan.y];

        return (
            <View
                style={{ flex: 1, flexDirection: "column", justifyContent: "flex-end", }}
            >
                { // tslint:disable-next-line:jsx-no-multiline-js
                    (this.state.modalOpen) ? (
                        <View style={{ bottom: -20, height: Dimensions.get("window").height, }} />
                    ) : null}
                { // tslint:disable-next-line:jsx-no-multiline-js
                    (Platform.OS === "android") ? (
                        <Animated.View style={[style(this.props.darkMode).modalForm, { transform: [{ translateX: 0 }, { translateY: translateY }] }]}>
                            <Animated.View style={style(this.props.darkMode).alertArrow} {...this.panResponder.panHandlers}>
                                {(!this.state.modalOpen) ? <Icon type="Ionicons" name="ios-arrow-up" /> : <Icon type="Ionicons" name="ios-arrow-down" />}
                            </Animated.View>
                            <Animated.View style={style(this.props.darkMode).modalHeading} {...this.panResponder.panHandlers}>
                                <Text style={style(this.props.darkMode).text}>Add a Price Alert for {this.props.coinPrice.name}</Text>
                            </Animated.View>

                            {this.renderForm()}

                        </Animated.View>
                    ) : (
                            <Animated.View style={[style(this.props.darkMode).modalForm, { transform: [{ translateX: 0 }, { translateY: translateY }] }]}>
                                <Animated.View style={style(this.props.darkMode).alertArrow} >
                                    <TouchableOpacity onPress={this.handleIOSPress}>
                                        {(!this.state.modalOpen) ? <Icon type="Ionicons" name="ios-arrow-up" /> : <Icon type="Ionicons" name="ios-arrow-down" />}
                                    </TouchableOpacity>
                                </Animated.View>
                                <Animated.View style={style(this.props.darkMode).modalHeading}>
                                    <Text style={style(this.props.darkMode).text}>Add a Price Alert for {this.props.coinPrice.name}</Text>
                                </Animated.View>

                                {this.renderForm()}

                            </Animated.View>
                        )}
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
    private handleIOSPress = () => {
        if (this.state.modalOpen) {
            this.closeModal();
        } else {
            this.openModal();
        }
    }
    private openModal = () => {
        Animated.timing(
            // Animate value over time
            this.state.pan.y, // The value to drive
            {
                toValue: -320, // Animate to final value of 1
            }
        ).start(() => {
            this.setState({
                modalOpen: true,
            })
        }); // Start the animation
    }
    public closeModal = () => {
        Animated.timing(
            // Animate value over time
            this.state.pan.y, // The value to drive
            {
                toValue: 0, // Animate to final value of 1
            }
        ).start(() => {
            this.setState({
                alertAmountCrypto: this.props.coinPrice.price_crypto.price.toString(),
                alertAmountFiat: this.props.coinPrice.price_fiat.price.toString(),
                modalOpen: false,
            })
        }); // Start the animation
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
    public onFocus = () => {
        if (Platform.OS === "ios") {
            Animated.timing(
                // Animate value over time
                this.state.pan.y, // The value to drive
                {
                    toValue: -620, // Animate to final value of 1
                }
            ).start(() => {
                this.setState({
                    modalOpen: true,
                })
            }); // Start the animation
        }
    }
    public onBlur = () => {
        if (Platform.OS === "ios") {
            Animated.timing(
                // Animate value over time
                this.state.pan.y, // The value to drive
                {
                    toValue: -320, // Animate to final value of 1
                }
            ).start(() => {
                this.setState({
                    modalOpen: true,
                })
            }); // Start the animation
        }
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
    alertArrow: {
        height: 40,
        flexDirection: "row",
        justifyContent: "center",
        backgroundColor: "transparent",
    },
    buttons: {
        backgroundColor: ((Platform.OS === "android") ? "#3f78ba" : "#007aff"),
        borderColor: (darkMode) ? "#F8F8F8" : "#454951",
        // borderWidth: 2,
        borderRadius: 5,
        marginTop: 10,
        marginBottom: 10,
        flexDirection: "row",
        alignItems: "center",
        justifyContent: "center",
        width: 200
    },
    activeButtonTextAndroid: {
        color: "#F8F8F8",
    },
    buttonsView: {
        alignItems: "center",
    },
    modalForm: {
        height: Dimensions.get("window").height + 150,
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        bottom: -Dimensions.get("window").height - 50,
        paddingBottom: Dimensions.get("window").height - 250,
        elevation: 20,
        borderWidth: 1,
        borderColor: (darkMode) ? darkItemsBorder : lightItemsBorder,
        borderRadius: 10,
        marginLeft: 5,
        marginRight: 5,
        shadowColor: "#000",
        shadowOffset: { width: 15, height: 15 },
        shadowOpacity: 0.1,
        shadowRadius: 10,
    },
    modalFormComponentsWrapper: {
        flex: 0.8,
        paddingLeft: 20,
        paddingRight: 20,
        alignItems: "center",
        justifyContent: "space-between",
    },
    modalHeading: {
        flex: 0.2,
        flexDirection: "row",
        justifyContent: 'center',
        backgroundColor: "transparent",
        // backgroundColor: "green",
    },
    segment: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8"
    },
    segmentButton: {
        borderColor: (darkMode) ? darkItemsBorder : lightItemsBorder,
    },
    text: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    textButton: {
        color: (Platform.OS === "ios") ? (darkMode) ? "#F8F8F8" : "#000" : (darkMode) ? "#F8F8F8" : "#fff",
    },
    textSegmentButton: {
        color: (darkMode) ? "#007aff" : "#000",
    },
    textSegmentButtonActive: {
        color: "#F8F8F8",
    },
    textInput: {
        height: 40,
        backgroundColor: "#F8F8F8",
        borderColor: 'gray',
        borderRadius: 5,
        borderWidth: 1,
        flex: 1,
        paddingLeft: 4,
    }
})