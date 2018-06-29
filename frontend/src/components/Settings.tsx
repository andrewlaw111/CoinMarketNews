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

    public styles: typeof styles;

    public renderCryptoPicker() {
        const options = ["BTC", "ETH"]
        const IOSPicker = () => ActionSheetIOS.showActionSheetWithOptions({
            options: options,
        },
            (buttonIndex) => {
                this.handleCryptoCurrencyValueChange(options[buttonIndex], buttonIndex);
            });
        if (Platform.OS === "ios") {
            return (
                <Button onPress={IOSPicker}>
                    <Text>
                        {this.props.appSettings.cryptoCurrency}
                    </Text>
                </Button>

            )
        }
        else {
            return (
                <Picker
                    selectedValue={this.props.appSettings.cryptoCurrency}
                    style={this.styles.picker}
                    onValueChange={this.handleCryptoCurrencyValueChange}
                >
                    {options.map((option: string, index: number) => <Picker.Item key={index} label={option} value={option} />)}
                </Picker>
            )
        }
    }
    public renderFiatPicker() {
        const options = ["USD", "EUR", "CAD", "GBP", "HKD"]
        const IOSPicker = () => ActionSheetIOS.showActionSheetWithOptions({
            options: options,
        },
            (buttonIndex) => {
                this.handleFiatCurrencyValueChange(options[buttonIndex], buttonIndex);
            });
        if (Platform.OS === "ios") {
            return (
                <Button onPress={IOSPicker}>
                    <Text>
                        {this.props.appSettings.fiatCurrency}
                    </Text>
                </Button>
            )
        }
        else {
            return (
                <Picker
                    selectedValue={this.props.appSettings.fiatCurrency}
                    style={this.styles.picker}
                    onValueChange={this.handleFiatCurrencyValueChange}
                >
                    {options.map((option: string, index: number) => <Picker.Item key={index} label={option} value={option} />)}
                </Picker>
            )
        }
    }

    public render() {
        this.styles = (this.props.appSettings.darkMode) ? darkStyles : styles;
        return (
            <StyleProvider style={getTheme(commonColour)}>
                <Content style={this.styles.Settings}>
                    <Card style={this.styles.Card}>
                        <TouchableOpacity>
                            <CardItem style={this.styles.CardItem}>
                                <View style={this.styles.CardLeft}>
                                    <Icon type="FontAwesome" name="dollar" style={this.styles.CardLeftIcon} />
                                    <Text style={this.styles.settingsText}>Preferred  Fiat Currency</Text>
                                </View>
                                {this.renderFiatPicker()}

                            </CardItem>
                        </TouchableOpacity>
                    </Card>
                    <Card style={this.styles.Card}>
                        <TouchableOpacity>
                            <CardItem style={this.styles.CardItem}>
                                <View style={this.styles.CardLeft}>
                                    <Image source={require("../coin.png")} style={this.styles.CoinIcon} />
                                    <Text style={this.styles.settingsText}>Preferred Crypto Currency</Text>
                                </View>
                                {this.renderCryptoPicker()}
                            </CardItem>
                        </TouchableOpacity>
                    </Card>
                    <Card style={this.styles.Card}>
                        <TouchableOpacity>
                            <CardItem style={this.styles.CardItem}>
                                <View style={this.styles.CardLeft}>
                                    <Icon type="FontAwesome" name="bell" style={this.styles.CardLeftIcon} />
                                    <Text style={this.styles.settingsText}>Push notifications</Text>
                                </View>
                                <View >
                                    {/* tslint:disable-next-line:jsx-no-multiline-js*/}
                                    {(Platform.OS === "ios") ?
                                        (
                                            <Switch value={this.props.appSettings.pushNotifications} onValueChange={this.handleNotificationChange.bind(this, this.props.user.token)} />
                                        ) : (
                                            <Switch onTintColor="#3f78ba" thumbTintColor="#2d5a8e" value={this.props.appSettings.pushNotifications} onValueChange={this.handleNotificationChange.bind(this, this.props.user.token)} />
                                        )}
                                </View>
                            </CardItem>
                        </TouchableOpacity>
                    </Card>
                    <Card style={this.styles.Card}>
                        <TouchableOpacity>
                            <CardItem style={this.styles.CardItem}>
                                <View style={this.styles.CardLeft}>
                                    <Icon type="FontAwesome" name="moon-o" style={this.styles.CardLeftIcon} />
                                    <Text style={this.styles.settingsText}>Dark Mode</Text>
                                </View>
                                <View >
                                    {/* tslint:disable-next-line:jsx-no-multiline-js*/}
                                    {(Platform.OS === "ios") ?
                                        (
                                            <Switch value={this.props.appSettings.darkMode} onValueChange={this.handleDarkModeValueChange} />
                                        ) : (
                                            <Switch onTintColor="#3f78ba" thumbTintColor="#2d5a8e" value={this.props.appSettings.darkMode} onValueChange={this.handleDarkModeValueChange} />
                                        )}
                                </View>
                            </CardItem>
                        </TouchableOpacity>
                    </Card>
                    {/*tslint:disable-next-line:jsx-no-multiline-js*/}
                    {/* <Card style={this.styles.Card}>
                        <TouchableOpacity>
                            <CardItem style={this.styles.CardItem}>
                                <View style={this.styles.CardLeft}>
                                    <Icon type="FontAwesome" name="user" style={this.styles.CardLeftIcon} />
                                    <Text style={this.styles.settingsText}>Account</Text>
                                </View>
                            </CardItem>
                        </TouchableOpacity>
                    </Card> */}
                    <Card style={this.styles.Card}>
                        <TouchableOpacity>
                            <CardItem style={this.styles.CardItem}>
                                <View style={this.styles.CardLeft}>
                                    <Icon type="FontAwesome" name="info" style={this.styles.CardLeftIcon} />
                                    <Text style={this.styles.settingsText}>About</Text>
                                </View>
                            </CardItem>
                        </TouchableOpacity>
                    </Card>
                </Content>
            </StyleProvider>
        );
    }
    private handleCryptoCurrencyValueChange = (itemValue: string, itemIndex: number) => {
        const settings = { ...this.props.appSettings };
        settings.cryptoCurrency = itemValue;
        this.props.changeSettings(settings);
        getCoins(settings);
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
            // FontAwesomeIcon.getImageSource("star", 20, "#3db9f7"),
            FontAwesomeIcon.getImageSource("newspaper-o", 20, "#3db9f7"),
            FontAwesomeIcon.getImageSource("cog", 20, "#3db9f7"),
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
                    },
                    animationType: "fade"
                })
                this.props.changeSettings(settings)
            }).catch((err) => {
                console.log("error", err);
            });
    }
    private handleFiatCurrencyValueChange = (itemValue: string, itemIndex: number) => {
        const settings = { ...this.props.appSettings };
        settings.fiatCurrency = itemValue;
        this.props.changeSettings(settings)
        getCoins(settings);
    }
    private handleNotificationChange = (token: string) => {
        const settings = { ...this.props.appSettings };
        settings.pushNotifications = !settings.pushNotifications;
        if (settings.pushNotifications === true) {
            OneSignal.init("155944be-3bde-4703-82f1-2545b31dc1ed");
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

const styleTemplate = (darkMode: boolean) => StyleSheet.create({
    Card: {
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        margin: 10,
    },
    CardItem: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        minHeight: 70,
        flex: 1,
        flexDirection: "row",
        justifyContent: "space-between",
    },
    CardLeft: {
        // flex: 0.9,
        flexDirection: "row",
        justifyContent: "flex-start"
    },
    CardLeftIcon: {
        color: (darkMode) ? "#F8F8F8" : "#000",
        marginRight: 15,
    },
    CoinIcon: {
        marginRight: 20,
        left: -4,
    },
    picker: {
        color: (darkMode) ? "#F8F8F8" : "#000",
        height: 50,
        width: 100
    },
    Settings: {
        paddingTop: 10,
        paddingBottom: 20,
        backgroundColor: (darkMode) ? "#2f343f" : "#F8F8F8",
    },
    settingsText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    }
})

const styles = styleTemplate(false);
const darkStyles = styleTemplate(true);