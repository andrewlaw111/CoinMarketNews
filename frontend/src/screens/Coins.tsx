import React, { RefObject } from "react";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { StyleProvider, Tab, Tabs } from "native-base";
import { FlatList, SafeAreaView, View } from "react-native";

import CoinOptions from "../components/CoinList/CoinsOptions";
import { ICoinPrice, ISettings, IUser } from "../models";
import { IRootState } from "../redux/store";

import getSettingID from "../components/functions/CoinsSettings";

import getTheme from "../../native-base-theme/components";
import commonColour from "../../native-base-theme/variables/commonColor";
import { styles } from "../styles/CoinsStyles";

import CoinList from "../components/CoinList/CoinList";
import sortCoins, { cacheSorts } from "../components/functions/CoinsSort";

interface ICoinsListProps {
    appSettings: ISettings;
    coins: ICoinPrice[];
    user: IUser;
    navigator: Navigator;
}

export interface ICoinsListState {
    coins: ICoinPrice[];
    favouriteTab: boolean;
    setting: string;
    refreshing: boolean;
}

class PureCoins extends React.Component<ICoinsListProps, ICoinsListState> {
    public static navigatorStyle = {
        navBarHidden: true,
        statusBarBlur: true,
    };
    public favouriteRef: RefObject<FlatList<ICoinPrice>>;
    public marketRef: RefObject<FlatList<ICoinPrice>>;

    constructor(props: ICoinsListProps) {
        super(props);
        this.props.navigator.setOnNavigatorEvent(this.onNavigatorEvent.bind(this));
        this.favouriteRef = React.createRef<FlatList<ICoinPrice>>();
        this.marketRef = React.createRef<FlatList<ICoinPrice>>();

        this.state = {
            coins: this.props.coins.slice(),
            favouriteTab: true,
            refreshing: false,
            setting: "000",
        };
    }
    public componentWillReceiveProps(nextProps: ICoinsListProps) {
        this.setState({
            coins: nextProps.coins,
        });
    }
    public renderTabs() {
        let backgroundColour: string;
        let textColour: string;
        if (this.props.appSettings.darkMode) {
            backgroundColour = "#343a44";
            textColour = "#F8F8F8";
        } else {
            backgroundColour = "#F8F8F8";
            textColour = "#000";
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
                    <CoinOptions
                        appSettings={this.props.appSettings}
                        handleOptionsPress={this.handleOptionsPress}
                        settings={this.state.setting}
                    />
                    <CoinList
                        addMissingFavourites={this.addMissingFavourites}
                        coins={this.state.coins}
                        favouriteTab={true}
                        navigator={this.props.navigator}
                        setRef={this.favouriteRef}
                        setting={this.state.setting}
                        sortCoins={this.sortCoins}
                        user={this.props.user}
                    />
                </Tab>
                <Tab
                    heading="Market"
                    activeTabStyle={{ backgroundColor: backgroundColour }}
                    activeTextStyle={{ color: textColour }}
                    tabStyle={{ backgroundColor: backgroundColour }}
                    textStyle={{ color: textColour }}
                >
                    <CoinOptions
                        appSettings={this.props.appSettings}
                        handleOptionsPress={this.handleOptionsPress}
                        settings={this.state.setting}
                    />
                    <CoinList
                        addMissingFavourites={this.addMissingFavourites}
                        coins={this.state.coins}
                        favouriteTab={false}
                        navigator={this.props.navigator}
                        setting={this.state.setting}
                        setRef={this.marketRef}
                        sortCoins={this.sortCoins}
                        user={this.props.user}
                    />
                </Tab>
            </Tabs>
        );
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
    private changeTab = () => {
        this.setState({
            favouriteTab: !this.state.favouriteTab,
        });
    }
    private handleOptionsPress = (options: string) => {
        const setting: string = getSettingID(options, this.state.setting);
        const coins = sortCoins(setting, this.state.coins.slice());
        this.setState({
            coins,
            setting,
        });

    }
    private addMissingFavourites = (favourites: ICoinPrice[]) => {
        let coins = this.state.coins.concat(favourites);
        cacheSorts(coins);
        coins = sortCoins(this.state.setting, coins);
        this.setState({
            coins,
        });
    }
    private onNavigatorEvent = (event: any) => {
        if (event.id === "bottomTabReselected") {

            if (typeof this.favouriteRef !== "undefined" && this.state.coins.length > 0 && this.state.favouriteTab) {
                this.favouriteRef.current.scrollToIndex({ index: 0, viewOffset: 0, viewPosition: 0, animated: true });
            } else if (typeof this.marketRef !== "undefined" && this.props.coins.length > 0) {
                this.marketRef.current.scrollToIndex({ index: 0, viewOffset: 0, viewPosition: 0, animated: true });
            }
        }
    }
    private sortCoins = () => {
        const coins = sortCoins(this.state.setting, this.state.coins.slice());
        this.setState({
            coins,
        });
    }
}

const mapStateToProps = (state: IRootState) => {
    return {
        appSettings: state.settings.settings,
        coins: state.coins.coins,
        user: state.user.user,
    };
};

const Coins = connect(mapStateToProps)(PureCoins);
export default Coins;
