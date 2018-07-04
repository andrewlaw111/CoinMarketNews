import React from "react";

import { Card, CardItem, Content, Icon, Text, StyleProvider, Button } from "native-base";
import { Image, View, StyleSheet, TouchableOpacity, Switch, Picker, Platform, ActionSheetIOS, StatusBar } from "react-native";


import { connect } from "react-redux";
import { IRootState } from "../redux/store";
import { changeSettings } from "../redux/actions/settings";
import { ISettings, ICoinPrice, IUser } from "../models";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';
import FontAwesomeIcon from "react-native-vector-icons/FontAwesome";

import Config from "react-native-config";
import axios from "axios";
import { Navigator, Navigation } from "react-native-navigation";

import OneSignal from "react-native-onesignal";
import { getCoins } from "../redux/actions/coins";
import styles from "./styles/SettingsStyles";

interface ISettingsProps {
    coins: ICoinPrice[];
    appSettings: ISettings;
    navigator: Navigator;
    user: IUser;
    changeSettings: (settings: ISettings) => void;
}

class PureSettings extends React.Component<ISettingsProps>{
    public static navigatorStyle = {
        navBarTitleTextCentered: true,
        statusBarBlur: true,
    };

    // componentDidMount() {
    //     OneSignal.addEventListener("received", this.onOpened);
    // }

    // onOpened = (notification: any) => {
    //     console.log(notification.notification.isAppInFocus)
    //     if (notification.notification.isAppInFocus === true && !notification.action.ActionID) {    // user clicked cancel
    //         alert('cancel');    // to not show URL
    //     }
    // }

    public renderCryptoPicker() {
        const options = ["BTC", "ETH", "Cancel"]
        const IOSPicker = () => ActionSheetIOS.showActionSheetWithOptions({
            options: options,
            cancelButtonIndex: 2,
        },
            (buttonIndex) => {
                this.handleCryptoCurrencyValueChange(options[buttonIndex], buttonIndex);
            });
        if (Platform.OS === "ios") {
            return (
                <TouchableOpacity onPress={IOSPicker} style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end' }}>
                    <Text style={{ color: "#0076FF" }}>
                        {this.props.appSettings.cryptoCurrency}
                    </Text>
                    <Icon style={{ fontSize: 24, marginLeft: 6, marginTop: 2 }} name="ios-arrow-down-outline" />
                </TouchableOpacity>

            )
        }
        else {
            return (
                <Picker
                    selectedValue={this.props.appSettings.cryptoCurrency}
                    style={styles(this.props.appSettings.darkMode).picker}
                    onValueChange={this.handleCryptoCurrencyValueChange}
                >
                    {options.map((option: string, index: number) => <Picker.Item key={index} label={option} value={option} />)}
                </Picker>
            )
        }
    }
    public renderFiatPicker() {
        const options = ["USD", "EUR", "CAD", "GBP", "HKD", "Cancel"]
        const IOSPicker = () => ActionSheetIOS.showActionSheetWithOptions({
            options: options,
            cancelButtonIndex: 5,
        },
            (buttonIndex) => {
                this.handleFiatCurrencyValueChange(options[buttonIndex], buttonIndex);
            });
        if (Platform.OS === "ios") {
            return (
                <TouchableOpacity onPress={IOSPicker} style={{ flex: 1, flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-end' }}>
                    <Text style={{ color: "#0076FF" }}>
                        {this.props.appSettings.fiatCurrency}
                    </Text>
                    <Icon style={{ fontSize: 24, marginLeft: 6, marginTop: 2 }} name="ios-arrow-down-outline" />
                </TouchableOpacity>
            )
        }
        else {
            return (
                <Picker
                    selectedValue={this.props.appSettings.fiatCurrency}
                    style={styles(this.props.appSettings.darkMode).picker}
                    onValueChange={this.handleFiatCurrencyValueChange}
                >
                    {options.map((option: string, index: number) => <Picker.Item key={index} label={option} value={option} />)}
                </Picker>
            )
        }
    }

    public render() {

        return (
            <StyleProvider style={getTheme(commonColour)}>
                <Content style={styles(this.props.appSettings.darkMode).Settings}>

                    <View style={styles(this.props.appSettings.darkMode).settingsItem}>
                        <View style={styles(this.props.appSettings.darkMode).SettingsIconWrapper}>
                            <Icon type="FontAwesome" name="dollar" style={styles(this.props.appSettings.darkMode).SettingsIcon} />
                        </View>
                        <View style={styles(this.props.appSettings.darkMode).settingsRight}>
                            <Text style={styles(this.props.appSettings.darkMode).settingsText}>Preferred  Fiat Currency</Text>

                            {this.renderFiatPicker()}
                        </View>

                    </View>

                    <View style={styles(this.props.appSettings.darkMode).settingsItem}>
                        <View style={styles(this.props.appSettings.darkMode).SettingsIconWrapper}>
                            <Image source={require("../coin.png")} style={styles(this.props.appSettings.darkMode).CoinIcon} />
                        </View>
                        <View style={styles(this.props.appSettings.darkMode).settingsRight}>
                            <Text style={styles(this.props.appSettings.darkMode).settingsText}>Preferred Crypto Currency</Text>

                            {this.renderCryptoPicker()}
                        </View>
                    </View>

                    <View style={styles(this.props.appSettings.darkMode).settingsItem}>
                        <View style={styles(this.props.appSettings.darkMode).SettingsIconWrapper}>
                            <Icon type="FontAwesome" name="bell" style={styles(this.props.appSettings.darkMode).SettingsIcon} />
                        </View>
                        <View style={styles(this.props.appSettings.darkMode).settingsRight}>
                            <Text style={styles(this.props.appSettings.darkMode).settingsText}>Push notifications</Text>
                            <View >
                                {/* tslint:disable-next-line:jsx-no-multiline-js*/}
                                {(Platform.OS === "ios") ?
                                    (
                                        <Switch value={this.props.appSettings.pushNotifications} onValueChange={this.handleNotificationChange.bind(this, this.props.user.token)} />
                                    ) : (
                                        <Switch onTintColor="#3f78ba" thumbTintColor="#2d5a8e" value={this.props.appSettings.pushNotifications} onValueChange={this.handleNotificationChange.bind(this, this.props.user.token)} />
                                    )}
                            </View>
                        </View>
                    </View>

                    <View style={styles(this.props.appSettings.darkMode).settingsItem}>
                        <View style={styles(this.props.appSettings.darkMode).SettingsIconWrapper}>
                            <Icon type="FontAwesome" name="moon-o" style={styles(this.props.appSettings.darkMode).SettingsIcon} />
                        </View>
                        <View style={styles(this.props.appSettings.darkMode).settingsRight}>
                            <Text style={styles(this.props.appSettings.darkMode).settingsText}>Dark Mode</Text>
                            <View >
                                {/* tslint:disable-next-line:jsx-no-multiline-js*/}
                                {(Platform.OS === "ios") ?
                                    (
                                        <Switch value={this.props.appSettings.darkMode} onValueChange={this.handleDarkModeValueChange} />
                                    ) : (
                                        <Switch onTintColor="#3f78ba" thumbTintColor="#2d5a8e" value={this.props.appSettings.darkMode} onValueChange={this.handleDarkModeValueChange} />
                                    )}
                            </View>
                        </View>
                    </View>
                    {/*tslint:disable-next-line:jsx-no-multiline-js*/}
                    {/* <Card style={styles(this.props.appSettings.darkMode).Card}>
                        <TouchableOpacity  style={styles(this.props.appSettings.darkMode).settingsItem}>
                                <View style={styles(this.props.appSettings.darkMode).CardLeft}>
                                    <View>
                                    <Icon type="FontAwesome" name="user" style={styles</View>(this.props.appSettings.darkMode).SettingsIcon} />

                                    <Text style={styles(this.props.appSettings.darkMode).settingsText}>Account</Text>
                                </View>
                        </TouchableOpacity>
                    </Card> */}
                    <TouchableOpacity style={[styles(this.props.appSettings.darkMode).settingsItem, { justifyContent: "flex-start", height: 50, }]}>
                        <View style={styles(this.props.appSettings.darkMode).SettingsIconWrapper}>
                            <Icon type="FontAwesome" name="info" style={styles(this.props.appSettings.darkMode).SettingsIcon} />
                        </View>
                        <Text style={styles(this.props.appSettings.darkMode).settingsText}>CoinMarketNews v1.0</Text>

                    </TouchableOpacity>
                </Content>
            </StyleProvider>
        );
    }
    private handleCryptoCurrencyValueChange = (itemValue: string, itemIndex: number) => {
        if (itemIndex === 2) {
            return
        } else {
            const settings = { ...this.props.appSettings };
            settings.cryptoCurrency = itemValue;
            this.props.changeSettings(settings);
            getCoins(settings);
        }
    }
    private handleDarkModeValueChange = () => {
        const settings = { ...this.props.appSettings };
        settings.darkMode = !settings.darkMode;

        let colours: { backgroundColor: string, navBarTextColor: string, screenBackgroundColor: string, statusBarTextColorScheme: string }
        let tabBarColours: { tabBarButtonColor: string, tabBarSelectedButtonColor: string, tabBarBackgroundColor: string };
        if (settings.darkMode) {
            colours = {
                backgroundColor: "#343a44",
                navBarTextColor: "#FFF",
                screenBackgroundColor: "#454951",
                statusBarTextColorScheme: "light",
            }
            tabBarColours = {
                tabBarButtonColor: "#FFF",
                tabBarSelectedButtonColor: "#2874F0",
                tabBarBackgroundColor: "#343a44"
            }
        } else {
            colours = {
                backgroundColor: "#F8F8F8",
                navBarTextColor: "#000",
                screenBackgroundColor: "#F8F8F8",
                statusBarTextColorScheme: "dark",
            }
            tabBarColours = {
                tabBarButtonColor: "#343a44",
                tabBarSelectedButtonColor: "#2874F0",
                tabBarBackgroundColor: "#F8F8F8"
            }
        }
        Promise.all([
            FontAwesomeIcon.getImageSource("newspaper-o", 26, "#3db9f7"),
            FontAwesomeIcon.getImageSource("cog", 30, "#3db9f7"),
        ])
            .then((sources) => {
                // start the app
                Navigation.startTabBasedApp({
                    tabs: [
                        {
                            icon: require("../coin.png"),
                            label: "Coins",
                            screen: "CoinMarketNews.Coins", // this is a registered name for a screen
                            selectedIcon: require("../coin.png"), // iOS only
                        },
                        {
                            icon: sources[0],
                            label: "News",
                            screen: "CoinMarketNews.News",
                            selectedIcon: sources[0], // iOS only
                            title: "Coin Market News",
                        },
                        {
                            icon: sources[1],
                            label: "Settings",
                            screen: "CoinMarketNews.Settings",
                            selectedIcon: sources[1], // iOS only
                            title: "Settings",
                        },
                    ],
                    tabsStyle: {
                        tabBarButtonColor: tabBarColours.tabBarButtonColor,
                        tabBarSelectedButtonColor: tabBarColours.tabBarSelectedButtonColor,
                        tabBarBackgroundColor: tabBarColours.tabBarBackgroundColor,
                        initialTabIndex: 2,
                        navBarTextColor: colours.navBarTextColor,
                        navBarBackgroundColor: colours.backgroundColor,
                        screenBackgroundColor: colours.screenBackgroundColor,
                        statusBarTextColorScheme: colours.statusBarTextColorScheme,
                    },
                    appStyle: { // optional, add this if s if you want to style the tab bar beyond the defaults
                        tabBarButtonColor: tabBarColours.tabBarButtonColor,
                        tabBarSelectedButtonColor: tabBarColours.tabBarSelectedButtonColor,
                        tabBarBackgroundColor: tabBarColours.tabBarBackgroundColor,
                        initialTabIndex: 2,
                        navBarBackgroundColor: colours.backgroundColor,
                        navBarTextColor: colours.navBarTextColor,
                        screenBackgroundColor: colours.screenBackgroundColor,
                        statusBarColor: colours.backgroundColor,
                        statusBarTextColorScheme: colours.statusBarTextColorScheme,
                        keepStyleAcrossPush: false,
                    },
                    animationType: "fade"
                })
                this.props.changeSettings(settings)
            }).catch((err) => {
                console.log("error", err);
            });
    }
    private handleFiatCurrencyValueChange = (itemValue: string, itemIndex: number) => {
        if (itemIndex === 5) {
            return
        } else {
            const settings = { ...this.props.appSettings };
            settings.fiatCurrency = itemValue;
            this.props.changeSettings(settings)
            getCoins(settings);
        }
    }
    private handleNotificationChange = (token: string) => {
        const settings = { ...this.props.appSettings };
        settings.pushNotifications = !settings.pushNotifications;
        if (settings.pushNotifications === true) {
            OneSignal.sendTag("user_id", this.props.user.id.toString());
        }
        this.props.changeSettings(settings)
        axios
            .patch(
                `${Config.API_SERVER}/user`,
                {
                    data: {
                        notifications: settings.pushNotifications
                    }
                },
                {
                    headers: {
                        token
                    }
                }
            )
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        changeSettings: (settings: ISettings) => dispatch(changeSettings(settings)),
    };
};

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        appSettings: state.settings.settings,
        user: state.user.user,
    };
};

const Settings = connect(mapStateToProps, mapDispatchToProps)(PureSettings);
export default Settings;