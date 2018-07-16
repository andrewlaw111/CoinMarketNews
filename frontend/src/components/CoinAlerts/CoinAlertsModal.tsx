import React from "react";

import {
    Animated,
    Dimensions,
    KeyboardAvoidingView,
    PanResponder,
    PanResponderInstance,
    Platform,
    Text,
    TextInput,
    TouchableOpacity,
    View,
} from "react-native";

import axios from "axios";
import { Button, Icon, Segment } from "native-base";
import Config from "react-native-config";
import { isIphoneX } from "react-native-iphone-x-helper";
import OneSignal from "react-native-onesignal";

import { IAlerts, ICoinPrice, ISettings, IUser } from "../../models";

import { connect } from "react-redux";
import { addAlerts } from "../../redux/actions/alerts";
import { changeSettings } from "../../redux/actions/settings";
import { IRootState } from "../../redux/store";
import style from "../../styles/CoinAlertsModalStyles";

interface ICoinAlertsModalProps {
    appSettings: ISettings;
    coinPrice: ICoinPrice;
    darkMode: boolean;
    alerts: IAlerts[];
    user: IUser;
    addAlerts: (alert: IAlerts, token: string) => void;
    changeSettings: (settings: ISettings) => void;
}

interface ICoinAlertsModalState {
    alertAmountCrypto: string;
    alertAmountFiat: string;
    fiatCurrency: boolean;
    modalOpen: boolean;
    pan: any;
}

class PureCoinAlertsModal extends React.Component<ICoinAlertsModalProps, ICoinAlertsModalState> {
    public panResponder: PanResponderInstance;
    public smallDevice = Dimensions.get("window").width < 350;

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
            onMoveShouldSetPanResponder: () => true,
            onMoveShouldSetPanResponderCapture: () => true,
            onStartShouldSetPanResponder: () => true,
            onStartShouldSetPanResponderCapture: () => true,

            onPanResponderGrant: () => {
                this.state.pan.setOffset({ x: this.state.pan.x._value, y: this.state.pan.y._value });
                this.state.pan.setValue({ x: 0, y: 0 });
            },
            onPanResponderMove: (e, gestureState) => {
                Animated.event([null, { dx: this.state.pan.x, dy: this.state.pan.y }])(e, gestureState);
            },
            onPanResponderRelease: () => {
                this.state.pan.flattenOffset();
                if (this.state.modalOpen) {
                    if (this.state.pan.y._value < 5 && this.state.pan.y._value > -5) {
                        this.closeModal();
                    } else if (this.state.pan.y._value > -50) {
                        this.openModal();
                    } else {
                        this.closeModal();
                    }
                } else {
                    if (this.state.pan.y._value < 5 && this.state.pan.y._value > -5) {
                        this.openModal();
                    } else if (this.state.pan.y._value < -90) {
                        this.openModal();
                    } else {
                        this.closeModal();
                    }
                }
            },
            onPanResponderTerminationRequest: () => false,
            onShouldBlockNativeResponder: () => {
                return true;
            },
        });

    }
    public renderForm = () => {
        return (
            <View style={style(this.props.darkMode).modalFormComponentsWrapper}>
                <Segment style={style(this.props.darkMode).segment}>
                    <Button
                        style={(Platform.OS === "android") ?
                            [
                                style(this.props.darkMode).segmentButton,
                                { backgroundColor: (this.state.fiatCurrency) ? "#3f78ba" : null },
                            ] : null
                        }
                        first={true}
                        onPress={this.changeCurrency.bind(this, "fiat")}
                        active={(this.state.fiatCurrency) ? true : false}
                    >
                        <Text
                            style={(this.state.fiatCurrency) ? (
                                style(this.props.darkMode).textSegmentButtonActive
                            ) : (style(this.props.darkMode).textSegmentButton)}
                        >
                            {this.props.appSettings.fiatCurrency}
                        </Text>
                    </Button>
                    <Button
                        style={(Platform.OS === "android") ?
                            [
                                style(this.props.darkMode).segmentButton,
                                { backgroundColor: (this.state.fiatCurrency) ? null : "#3f78ba" },
                            ] : null}
                        last={true}
                        onPress={this.changeCurrency.bind(this, "crypto")}
                        active={(this.state.fiatCurrency) ? false : true}
                    >
                        <Text
                            style={(this.state.fiatCurrency) ? (
                                style(this.props.darkMode).textSegmentButton
                            ) : (
                                    style(this.props.darkMode).textSegmentButtonActive
                                )}
                        >
                            {this.props.appSettings.cryptoCurrency}
                        </Text>
                    </Button>
                </Segment>
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
        );
    }
    public render() {
        const { pan } = this.state;
        const [, translateY] = [pan.x, pan.y];

        return (
            <View
                style={{ flex: 1, flexDirection: "column", justifyContent: "flex-end" }}
            >
                { // tslint:disable-next-line:jsx-no-multiline-js
                    (this.state.modalOpen) ? (
                        <View style={{ bottom: -20, height: Dimensions.get("window").height }} />
                    ) : null}
                { // tslint:disable-next-line:jsx-no-multiline-js
                    (Platform.OS === "android") ? (
                        <Animated.View
                            style={[
                                style(this.props.darkMode).modalForm,
                                {
                                    transform: [{ translateX: 0 }, { translateY }],
                                },
                            ]}
                        >
                            <Animated.View
                                style={style(this.props.darkMode).alertArrow} {...this.panResponder.panHandlers}
                            >
                                {(!this.state.modalOpen) ?
                                    (
                                        <Icon type="Ionicons" name="ios-arrow-up" />
                                    ) : (
                                        <Icon type="Ionicons" name="ios-arrow-down" />
                                    )
                                }
                            </Animated.View>
                            <Animated.View
                                style={style(this.props.darkMode).modalHeading} {...this.panResponder.panHandlers}
                            >
                                <Text style={style(this.props.darkMode).text}>
                                    Add a Price Alert for {this.props.coinPrice.name}
                                </Text>
                            </Animated.View>

                            {this.renderForm()}

                        </Animated.View>
                    ) : (
                            <Animated.View
                                style={[
                                    style(this.props.darkMode).modalForm,
                                    {
                                        transform: [{ translateX: 0 }, { translateY }],
                                    },
                                ]}
                            >

                                <TouchableOpacity
                                    style={style(this.props.darkMode).alertArrow}
                                    onPress={this.handleIOSPress}
                                >
                                    {(!this.state.modalOpen) ?
                                        (
                                            <Icon type="Ionicons" name="ios-arrow-up" />
                                        ) : (
                                            <Icon type="Ionicons" name="ios-arrow-down" />
                                        )
                                    }
                                </TouchableOpacity>
                                <TouchableOpacity
                                    style={style(this.props.darkMode).modalHeading}
                                    onPress={this.handleIOSPress}
                                >
                                    <Text
                                        style={style(this.props.darkMode).text}
                                    >
                                        Add a Price Alert for {this.props.coinPrice.name}
                                    </Text>
                                </TouchableOpacity>

                                {this.renderForm()}

                            </Animated.View>
                        )}
            </View>
        );
    }
    private changeCurrency = (currency: string) => {
        if (currency === "fiat") {
            this.setState({
                fiatCurrency: true,
            });
        } else {
            this.setState({
                fiatCurrency: false,
            });
        }
    }
    private changeAlertAmount = (amount: string) => {
        if (/^\d*\.?\d*$/.test(amount)) {
            if (this.state.fiatCurrency) {
                this.setState({
                    alertAmountFiat: amount,
                });
            } else {
                this.setState({
                    alertAmountCrypto: amount,
                });
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
    private closeModal = () => {
        Animated.timing(
            this.state.pan.y,
            {
                toValue: 0,
            },
        ).start(() => {
            this.setState({
                alertAmountCrypto: this.props.coinPrice.price_crypto.price.toString(),
                alertAmountFiat: this.props.coinPrice.price_fiat.price.toString(),
                modalOpen: false,
            });
        });
    }
    private handleAdd = () => {
        let alert: IAlerts;
        let upper: boolean;
        if (this.state.fiatCurrency) {
            upper = (parseFloat(this.state.alertAmountFiat) >= this.props.coinPrice.price_fiat.price) ? true : false;
            alert = {
                active: true,
                coinmarketcap_id: this.props.coinPrice.coinmarketcap_id,
                currency_symbol: this.props.appSettings.fiatCurrency,
                price_point: parseFloat(this.state.alertAmountFiat),
                upper,
            };
        } else {
            upper = (
                (parseFloat(this.state.alertAmountCrypto) >= this.props.coinPrice.price_crypto.price) ? true : false
            );
            alert = {
                active: true,
                coinmarketcap_id: this.props.coinPrice.coinmarketcap_id,
                currency_symbol: this.props.appSettings.cryptoCurrency,
                price_point: parseFloat(this.state.alertAmountCrypto),
                upper,
            };
        }
        this.props.addAlerts(alert, this.props.user.token);
        this.closeModal();

        const settings = { ...this.props.appSettings };
        settings.pushNotifications = true;
        this.props.changeSettings(settings);
        OneSignal.sendTag("user_id", this.props.user.id.toString());
        axios
            .patch(
                `${Config.API_SERVER}/user`,
                {
                    data: {
                        notifications: settings.pushNotifications,
                    },
                },
                {
                    headers: {
                        token: this.props.user.token,
                    },
                },
        );
    }
    private openModal = () => {
        Animated.timing(
            this.state.pan.y, {
                toValue: -320,
            },
        ).start(() => {
            this.setState({
                modalOpen: true,
            });
        });
    }
    private onFocus = () => {
        if (Platform.OS === "ios") {
            Animated.timing(
                this.state.pan.y,
                {
                    toValue: (isIphoneX()) ?
                        (
                            -Dimensions.get("window").height + 245
                        ) : (
                            (this.smallDevice) ?
                                (
                                    -Dimensions.get("window").height + 155
                                ) : (
                                    -Dimensions.get("window").height + 220
                                )
                        ),
                },
            ).start(() => {
                this.setState({
                    modalOpen: true,
                });
            });
        }
    }
    private onBlur = () => {
        if (Platform.OS === "ios") {
            Animated.timing(
                this.state.pan.y, {
                    toValue: -320,
                },
            ).start(() => {
                this.setState({
                    modalOpen: true,
                });
            });
        }
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        addAlerts: (alert: IAlerts, token: string) => dispatch(addAlerts(alert, token)),
        changeSettings: (settings: ISettings) => dispatch(changeSettings(settings)),
    };
};

const mapStateToProps = (state: IRootState) => {
    return {
        alerts: state.alerts.priceAlerts,
        user: state.user.user,
    };
};

const CoinAlertsModal = connect(mapStateToProps, mapDispatchToProps)(PureCoinAlertsModal);
export default CoinAlertsModal;
