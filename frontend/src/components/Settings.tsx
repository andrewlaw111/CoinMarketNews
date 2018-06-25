import React from "react";

import { Card, CardItem, Content, Icon, Text, StyleProvider, Button } from "native-base";
import { Image, View, StyleSheet, TouchableOpacity, Switch, Picker } from "react-native";


import { connect } from "react-redux";
import { IRootState } from "../redux/store";
import { changeSettings } from "../redux/actions/settings";
import { ISettings, ICoinPrice, IUser } from "../models";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

interface ISettingsProps {
    coins: ICoinPrice[];
    appSettings: ISettings;
    user: IUser;
    changeSettings: (settings: ISettings) => void;
}

class PureSettings extends React.Component<ISettingsProps>{
    public static navigatorStyle = {
        navBarTitleTextCentered: true,
        statusBarBlur: true,
        statusBarColor: "blue",
    };
    public colorMode: string;
    public styles: typeof styles;

    public constructor(props: ISettingsProps) {
        super(props);
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
                                <Picker
                                    selectedValue={"BTC"}
                                    style={{ height: 50, width: 100 }}
                                // onValueChange={(itemValue, itemIndex) => this.setState({ language: itemValue })}
                                >
                                    <Picker.Item label="Java" value="java" />
                                    <Picker.Item label="JavaScript" value="js" />
                                </Picker>
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
                                <Picker
                                    selectedValue={"USD"}
                                    style={{ height: 50, width: 100 }}
                                // onValueChange={(itemValue, itemIndex) => this.setState({ language: itemValue })}
                                >
                                    <Picker.Item label="Java" value="java" />
                                    <Picker.Item label="JavaScript" value="js" />
                                </Picker>
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
                                    <Switch value={true} />
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
                                    <Switch value={this.props.appSettings.darkMode} onValueChange={this.handleDarkModeValueChange} />
                                </View>
                            </CardItem>
                        </TouchableOpacity>
                    </Card>
                    <Card style={this.styles.Card}>
                        <TouchableOpacity>
                            <CardItem style={this.styles.CardItem}>
                                <View style={this.styles.CardLeft}>
                                    <Icon type="FontAwesome" name="user" style={this.styles.CardLeftIcon} />
                                    <Text style={this.styles.settingsText}>Account</Text>
                                </View>
                            </CardItem>
                        </TouchableOpacity>
                    </Card>
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
    private handleDarkModeValueChange = () => {
        const settings = { ...this.props.appSettings };
        settings.darkMode = !settings.darkMode;
        this.props.changeSettings(settings)
    }
    private handlePress = () => console.error(this.props.appSettings.darkMode)
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

const styles = StyleSheet.create({
    Card: {
        margin: 10,
    },
    CardItem: {
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
        marginRight: 15,
    },
    CoinIcon: {
        marginRight: 20,
        left: -4,
    },
    Settings: {
    },
    settingsText: {
        
    }
    // CardLeftText: {
    //     flex: 0.8,
    // },
    // CardRight: {
    //     // flex: 0.1,
    // }
})

const darkStyles = StyleSheet.create({
    Card: {
        borderColor: "#41444c",
        backgroundColor: "#454951",
        margin: 10,
    },
    CardItem: {
        backgroundColor: "#454951",
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
        color: "#F8F8F8",
        marginRight: 15,
    },
    CoinIcon: {
        marginRight: 20,
        left: -4,
    },
    Settings: {
        backgroundColor: "#2f343f",
    },
    settingsText: {
        color: "#F8F8F8"
    }
})