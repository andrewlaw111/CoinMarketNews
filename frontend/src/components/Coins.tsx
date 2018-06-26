import React from "react";
import Config from "react-native-config";
import { isIphoneX } from "react-native-iphone-x-helper";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Container, Tab, Tabs, StyleProvider } from "native-base";
import { Platform, } from "react-native";

import CoinOptions from "./CoinsOptions";
import { ICoinPrice, IUser, ISettings } from "../models";
import { IRootState } from "../redux/store";

import { coinsStyles, darkCoinsStyles } from "./styles/CoinsStyles"
import getSettingID from "./functions/CoinsSettings";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';
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
        statusBarColor: "blue",
    };
    public styles: typeof coinsStyles;

    public constructor(props: ICoinsListProps) {
        super(props);
        this.state = {
            coins: this.props.coins.slice(),
            setting: "000",
        };
    }
    public componentWillMount() {
        this.styles = (this.props.appSettings.darkMode) ? darkCoinsStyles : coinsStyles;
    }
    public componentWillReceiveProps(nextProps: ICoinsListProps) {
        this.styles = (this.props.appSettings.darkMode) ? darkCoinsStyles : coinsStyles;

        this.setState({
            coins: nextProps.coins
        })
    }

    public render() {
        let iOSStyle = {};
        if (Platform.OS === "ios") {
            if (isIphoneX()) {
                iOSStyle = { paddingTop: 38, backgroundColor: "#F8F8F8" };
            } else {
                iOSStyle = { paddingTop: 14, backgroundColor: "#F8F8F8" };
            }
        }

        return (
            <StyleProvider style={getTheme(commonColour)}>
                <Container style={this.styles.coinListComponent}>
                    <Tabs style={iOSStyle} initialPage={0}>
                        <Tab heading="Favourites">
                            <CoinOptions appSettings={this.props.appSettings} handleOptionsPress={this.handleOptionsPress} settings={this.state.setting} />
                            <CoinList coins={this.state.coins} favouriteTab={true} handlePress={this.handlePress} setting={this.state.setting} user={this.props.user} />
                        </Tab>
                        <Tab heading="Market">
                            <CoinOptions appSettings={this.props.appSettings} handleOptionsPress={this.handleOptionsPress} settings={this.state.setting} />
                            <CoinList coins={this.state.coins} favouriteTab={false} handlePress={this.handlePress} setting={this.state.setting} user={this.props.user} />
                        </Tab>
                    </Tabs>
                </Container >
            </StyleProvider>
        );
    }

    private handlePress = (info: { item: ICoinPrice, index: number }) => {
        this.props.navigator.push({
            animated: true,
            animationType: "fade",
            backButtonHidden: false, // hide the back button altogether (optional)
            navigatorButtons: {
                rightButtons: [{
                    buttonColor: "blue",
                    buttonFontSize: 14,
                    buttonFontWeight: "600",
                    id: "edit",
                    showAsAction: "ifRoom",
                    testID: "e2e_rules", // optional, used to locate this view in end-to-end tests
                    title: "Edit", // for a textual button, provide the button title (label)
                }],
            },
            navigatorStyle: {},
            passProps: { appSettings: this.props.appSettings, coinID: info.item.id, coinPrice: info.item },
            screen: "CoinMarketNews.CoinsPage",
            title: info.item.name,
            titleImage: `http://${Config.API_SERVER}/icon/${info.item.symbol.toLocaleLowerCase()}.png`,
        });
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