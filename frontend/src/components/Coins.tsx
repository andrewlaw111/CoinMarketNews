import React from "react";
import Config from "react-native-config";
import { isIphoneX } from "react-native-iphone-x-helper";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Container, Tab, Tabs, StyleProvider } from "native-base";
import { Platform, SafeAreaView, ScrollView, RefreshControl, View, } from "react-native";

import CoinOptions from "./CoinsOptions";
import { ICoinPrice, IUser, ISettings } from "../models";
import { IRootState } from "../redux/store";

import { styles } from "./styles/CoinsStyles";
import getSettingID from "./functions/CoinsSettings";

import getTheme from "../../native-base-theme/components";
import commonColour from "../../native-base-theme/variables/commonColor";


import CoinList from "./CoinList";
import sortCoins from "./functions/CoinsSort";
import { getCoins } from "../redux/actions/coins";

interface ICoinsListProps {
    appSettings: ISettings;
    coins: ICoinPrice[];
    user: IUser;
    navigator: Navigator;
}

export interface ICoinsListState {
    coins: ICoinPrice[];
    setting: string,
    refreshing: boolean;
}

class PureCoins extends React.Component<ICoinsListProps, ICoinsListState> {
    public static navigatorStyle = {
        navBarHidden: true,
        statusBarBlur: true,
    };

    public scroller_favourite: ScrollView | undefined;
    public scroller_market: ScrollView | undefined;

    public constructor(props: ICoinsListProps) {
        super(props);
        this.props.navigator.setOnNavigatorEvent(this.onNavigatorEvent.bind(this));
        this.state = {
            coins: this.props.coins.slice(),
            setting: "000",
            refreshing: false
        };
    }
    public componentWillReceiveProps(nextProps: ICoinsListProps) {

        this.setState({
            coins: nextProps.coins
        })
    }
    public renderTabs() {
        let backgroundColour: string;
        let textColour: string;
        if (this.props.appSettings.darkMode) {
            backgroundColour = "#343a44";
            textColour = "#F8F8F8"
        } else {
            backgroundColour = "#F8F8F8";
            textColour = "#000"
        }
        return (
            <Tabs initialPage={0} >
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
        )
    }
    public render() {

        return (
            <StyleProvider style={getTheme(commonColour)}>
                <SafeAreaView style={styles(this.props.appSettings.darkMode).safeAreaView}>
                    <View style={styles(this.props.appSettings.darkMode).coinListComponent}>
                        {this.renderTabs()}
                    </View>
                </SafeAreaView>
            </StyleProvider >
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

    private onRefresh = () => {
        this.setState({
            refreshing: true
        });
        getCoins(this.props.appSettings).then(() => {
            this.setState({
                refreshing: false
            });
        });
    }
    public onNavigatorEvent(event: any) {
        if (event.id === 'bottomTabSelected') {

        }
        if (event.id === 'bottomTabReselected') {
            if (this.scroller_favourite !== undefined) {
                this.scroller_favourite.scrollTo({ x: 0, y: 0, animated: true });
            }
            if (this.scroller_market !== undefined) {
                this.scroller_market.scrollTo({ x: 0, y: 0, animated: true });
            }
        }
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