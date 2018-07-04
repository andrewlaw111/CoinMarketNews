import React, { RefObject } from "react";
import Config from "react-native-config";
import { isIphoneX } from "react-native-iphone-x-helper";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Container, Tab, Tabs, StyleProvider } from "native-base";
import { Platform, SafeAreaView, ScrollView, RefreshControl, View, FlatList, } from "react-native";

import CoinOptions from "./CoinsOptions";
import { ICoinPrice, IUser, ISettings } from "../models";
import { IRootState } from "../redux/store";

import { styles } from "./styles/CoinsStyles";
import getSettingID from "./functions/CoinsSettings";

import getTheme from "../../native-base-theme/components";
import commonColour from "../../native-base-theme/variables/commonColor";


import CoinList from "./CoinList";
import sortCoins, { cacheSorts } from "./functions/CoinsSort";
import { getCoins } from "../redux/actions/coins";

interface ICoinsListProps {
    appSettings: ISettings;
    coins: ICoinPrice[];
    user: IUser;
    navigator: Navigator;
}

export interface ICoinsListState {
    coins: ICoinPrice[];
    favouriteTab: boolean;
    setting: string,
    refreshing: boolean;
}

class PureCoins extends React.Component<ICoinsListProps, ICoinsListState> {
    public favouriteRef: RefObject<FlatList<ICoinPrice>>;
    public marketRef: RefObject<FlatList<ICoinPrice>>;

    public static navigatorStyle = {
        navBarHidden: true,
        statusBarBlur: true,
    };

    public constructor(props: ICoinsListProps) {
        super(props);
        this.props.navigator.setOnNavigatorEvent(this.onNavigatorEvent.bind(this));
        this.favouriteRef = React.createRef<FlatList<ICoinPrice>>();
        this.marketRef = React.createRef<FlatList<ICoinPrice>>();

        this.state = {
            coins: this.props.coins.slice(),
            favouriteTab: true,
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
            <Tabs
                initialPage={0}
                onChangeTab={this.changeTab}
            >
                <Tab
                    heading="Favourites"
                    activeTabStyle={{ backgroundColor: backgroundColour }}
                    activeTextStyle={{ color: textColour }}
                    tabStyle={{ backgroundColor: backgroundColour }}
                    textStyle={{ color: textColour }}
                >
                    <CoinOptions appSettings={this.props.appSettings} handleOptionsPress={this.handleOptionsPress} settings={this.state.setting} />
                    <CoinList addMissingFavourites={this.addMissingFavourites} coins={this.state.coins} favouriteTab={true} navigator={this.props.navigator} setting={this.state.setting} user={this.props.user} setRef={this.favouriteRef} />
                </Tab>
                <Tab
                    heading="Market"
                    activeTabStyle={{ backgroundColor: backgroundColour }}
                    activeTextStyle={{ color: textColour, }}
                    tabStyle={{ backgroundColor: backgroundColour }}
                    textStyle={{ color: textColour }}
                >
                    <CoinOptions appSettings={this.props.appSettings} handleOptionsPress={this.handleOptionsPress} settings={this.state.setting} />
                    <CoinList addMissingFavourites={this.addMissingFavourites} coins={this.state.coins} favouriteTab={false} navigator={this.props.navigator} setting={this.state.setting} user={this.props.user} setRef={this.marketRef} />
                </Tab>
            </Tabs>
        )
    }
    public render() {
        console.log(this.props.coins)

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
    private changeTab = () => {
        this.setState({
            favouriteTab: !this.state.favouriteTab
        })
    }
    private handleOptionsPress = (options: string) => {
        const setting: string = getSettingID(options, this.state.setting);
        const coins = sortCoins(setting, this.state.coins.slice());
        this.setState({
            coins,
            setting,
        })

    }
    private addMissingFavourites = (favourites: ICoinPrice[]) => {
        let coins = this.state.coins.concat(favourites);
        cacheSorts(coins);
        coins = sortCoins(this.state.setting, coins);
        this.setState({
            coins
        })
    }
    private onNavigatorEvent = (event: any) => {
        // if (event.id === 'bottomTabSelected') {

        // }
        if (event.id === 'bottomTabReselected') {

            if (typeof this.favouriteRef !== "undefined" && this.state.coins.length > 0 && this.state.favouriteTab) {
                this.favouriteRef.current.scrollToIndex({ index: 0, viewOffset: 0, viewPosition: 0, animated: true });
            }
            else if (typeof this.marketRef !== "undefined" && this.props.coins.length > 0) {
                this.marketRef.current.scrollToIndex({ index: 0, viewOffset: 0, viewPosition: 0, animated: true });
            }
        }
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