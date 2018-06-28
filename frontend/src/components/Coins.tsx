import React from "react";
import Config from "react-native-config";
import { isIphoneX } from "react-native-iphone-x-helper";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Container, Tab, Tabs, StyleProvider } from "native-base";
import { Platform, SafeAreaView, } from "react-native";

import CoinOptions from "./CoinsOptions";
import { ICoinPrice, IUser, ISettings } from "../models";
import { IRootState } from "../redux/store";

import { styles } from "./styles/CoinsStyles";
import getSettingID from "./functions/CoinsSettings";

import getTheme from "../../native-base-theme/components";
import commonColour from "../../native-base-theme/variables/commonColor";


import CoinList from "./CoinList";
import sortCoins from "./functions/CoinsSort";

interface ICoinsListProps {
    appSettings: ISettings;
    coins: ICoinPrice[];
    user: IUser;
    navigator: Navigator;
}

export interface ICoinsListState {
    coins: ICoinPrice[];
    setting: string,
}

class PureCoins extends React.Component<ICoinsListProps, ICoinsListState> {
    public static navigatorStyle = {
        navBarHidden: true,
        statusBarBlur: true,
    };

    public constructor(props: ICoinsListProps) {
        super(props);
        this.state = {
            coins: this.props.coins.slice(),
            setting: "000",
        };
    }
    public componentWillReceiveProps(nextProps: ICoinsListProps) {

        this.setState({
            coins: nextProps.coins
        })
    }

    public render() {
        let iosTabs = {};
        let backgroundColour: string;
        let textColour: string;
        if (this.props.appSettings.darkMode) {
            backgroundColour = "#343a44";
            textColour = "#F8F8F8"
        } else {
            backgroundColour = "#F8F8F8";
            textColour = "#000"
        }

        if (Platform.OS === "ios") {
            if (isIphoneX()) {
                iosTabs = { paddingTop: 38, backgroundColor: backgroundColour };
            } else {
                iosTabs = { paddingTop: 14, backgroundColor: backgroundColour };
            }
        }

        return (
            <StyleProvider style={getTheme(commonColour)}>
                <SafeAreaView style={{ flex: 1, backgroundColor: '#fff' }}>
                    <Container style={styles(this.props.appSettings.darkMode).coinListComponent}>
                        <Tabs style={iosTabs} initialPage={0}>
                            <Tab
                                heading="Favourites"
                                activeTabStyle={{ backgroundColor: backgroundColour }}
                                activeTextStyle={{ color: textColour }}
                                tabStyle={{ backgroundColor: backgroundColour }}
                                textStyle={{ color: textColour }}
                            >
                                <CoinOptions appSettings={this.props.appSettings} handleOptionsPress={this.handleOptionsPress} settings={this.state.setting} />
                                <CoinList coins={this.state.coins} favouriteTab={true} navigator={this.props.navigator} setting={this.state.setting} user={this.props.user} />
                            </Tab>
                            <Tab
                                heading="Market"
                                activeTabStyle={{ backgroundColor: backgroundColour }}
                                activeTextStyle={{ color: textColour, }}
                                tabStyle={{ backgroundColor: backgroundColour }}
                                textStyle={{ color: textColour }}
                            >
                                <CoinOptions appSettings={this.props.appSettings} handleOptionsPress={this.handleOptionsPress} settings={this.state.setting} />
                                <CoinList coins={this.state.coins} favouriteTab={false} navigator={this.props.navigator} setting={this.state.setting} user={this.props.user} />
                            </Tab>
                        </Tabs>
                    </Container >
                </SafeAreaView>
            </StyleProvider>
        );
    }

    private handleOptionsPress = (options: string) => {
        const setting: string = getSettingID(options, this.state.setting);
        const coins = sortCoins(setting, this.state.coins.slice());
        this.setState({
            coins,
            setting,
        })

    }

}

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        appSettings: state.settings.settings,
        user: state.user.user,
    };
};

const Coins = connect(mapStateToProps)(PureCoins);
export default Coins;