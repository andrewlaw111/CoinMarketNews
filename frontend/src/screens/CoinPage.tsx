import axios from "axios";
import React from "react";
import Config from "react-native-config";
import IonIcons from "react-native-vector-icons/Ionicons";
import { connect } from "react-redux";

import { Container, Spinner, StyleProvider, Tab, Tabs } from "native-base";
import { AsyncStorage, StyleSheet, View } from "react-native";

import getTheme from "../../native-base-theme/components";
import commonColour from "../../native-base-theme/variables/commonColor";

import { ICoin, ICoinPrice, ISettings, IUser } from "../models";
import { IRootState } from "../redux/store";

import { Navigator, NavigatorEvent } from "react-native-navigation";
import { addCoinFavourite, removeCoinFavourite } from "../redux/actions/favourites";
import CoinAlerts from "./CoinAlerts";
import CoinInfo from "./CoinInfo";
import CoinNews from "./CoinNews";
import CoinPrice from "./CoinPrice";

interface ICoinsPageProps {
    appSettings: ISettings;
    coinID: number;
    coinPrice: ICoinPrice;
    coins: ICoinPrice[];
    favourite: boolean;
    favourites: number[];
    user: IUser;
    navigator: Navigator;
    addCoinFavourite: (coinID: number, token: string) => void;
    removeCoinFavourite: (coinID: number, token: string) => void;
}
interface ICoinsPageState {
    coin?: ICoin;
    favourite: boolean;
    priceWidget: string;
}

class PureCoinsList extends React.Component<ICoinsPageProps, ICoinsPageState> {
    public styles: typeof styles;

    constructor(props: ICoinsPageProps) {
        super(props);
        this.state = {
            coin: undefined,
            favourite: this.props.favourite,
            priceWidget: "",
        };
        this.getCoin();
        this.props.navigator.setOnNavigatorEvent(this.onNavigatorEvent.bind(this));
    }

    public onNavigatorEvent(event: NavigatorEvent) {
        if (event.type === "NavBarButtonPress") {
            if (event.id === "like") {
                Promise.all([
                    IonIcons.getImageSource("ios-star", 24, "orange"),
                    IonIcons.getImageSource("ios-star", 24, "grey"),
                ]).then((sources) => {
                    this.props.navigator.setButtons({
                        rightButtons: [{
                            buttonFontSize: 18,
                            buttonFontWeight: "600",
                            disableIconTint: true,
                            icon: (this.state.favourite) ? sources[0] : sources[1],
                            id: "like",
                            showAsAction: "ifRoom",
                        }],
                    });
                });

                if (!this.state.favourite) {
                    this.setState({
                        favourite: true,
                    });
                    return this.props.addCoinFavourite(this.props.coinID, this.props.user.token);
                } else {
                    this.setState({
                        favourite: false,
                    });
                    return this.props.removeCoinFavourite(this.props.coinID, this.props.user.token);
                }
            } else if (event.id === "back") {
                this.props.navigator.dismissModal({
                    animationType: "slide-down",
                });
            }
        }
    }

    public renderNoConnection() {
        return (
            <View style={styles(this.props.appSettings.darkMode).pageBackground}>
                <Spinner />
            </View>
        );
    }
    public render() {
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
            <StyleProvider style={getTheme(commonColour)}>
                <Container style={styles(this.props.appSettings.darkMode).pageBackground}>
                    <Tabs springTension={2} initialPage={0} >
                        <Tab
                            heading="Info"
                            activeTabStyle={{ backgroundColor: backgroundColour }}
                            activeTextStyle={{ color: textColour }}
                            tabStyle={{ backgroundColor: backgroundColour }}
                            textStyle={{ color: textColour }}
                        >
                            {
                                (typeof this.state.coin === "undefined") ?
                                    this.renderNoConnection() :
                                    <CoinInfo coin={this.state.coin} darkMode={this.props.appSettings.darkMode} />
                            }
                        </Tab>
                        <Tab
                            heading="News"
                            activeTabStyle={{ backgroundColor: backgroundColour }}
                            activeTextStyle={{ color: textColour }}
                            tabStyle={{ backgroundColor: backgroundColour }}
                            textStyle={{ color: textColour }}
                        >
                            {
                                (typeof this.state.coin === "undefined") ?
                                    this.renderNoConnection() :
                                    <CoinNews
                                        appSettings={this.props.appSettings}
                                        coin={this.state.coin}
                                        coins={this.props.coins}
                                        favourites={this.props.favourites}
                                        darkMode={this.props.appSettings.darkMode}
                                        navigator={this.props.navigator}
                                    />
                            }
                        </Tab>
                        <Tab
                            heading="Price"
                            activeTabStyle={{ backgroundColor: backgroundColour }}
                            activeTextStyle={{ color: textColour }}
                            tabStyle={{ backgroundColor: backgroundColour }}
                            textStyle={{ color: textColour }}
                        >
                            {
                                (typeof this.state.coin === "undefined") ?
                                    this.renderNoConnection() :
                                    <CoinPrice
                                        coin={this.state.coin}
                                        coinPrice={this.props.coinPrice}
                                        darkMode={this.props.appSettings.darkMode}
                                        priceWidget={this.state.priceWidget}
                                    />
                            }
                        </Tab>
                        <Tab
                            heading="Alerts"
                            activeTabStyle={{ backgroundColor: backgroundColour }}
                            activeTextStyle={{ color: textColour }}
                            tabStyle={{ backgroundColor: backgroundColour }}
                            textStyle={{ color: textColour }}
                        >
                            {
                                (typeof this.state.coin === "undefined") ?
                                    this.renderNoConnection() :
                                    <CoinAlerts
                                        appSettings={this.props.appSettings}
                                        coin={this.state.coin}
                                        coinPrice={this.props.coinPrice}
                                        darkMode={this.props.appSettings.darkMode}
                                        navigator={this.props.navigator}
                                    />
                            }
                        </Tab>
                    </Tabs>
                </Container>
            </StyleProvider>
        );
    }
    private getCoin = async () => {
        const coin: string = await AsyncStorage.getItem(`@CoinMarketNews:coin${this.props.coinID}`);
        if (coin !== null) {
            const storedCoin = JSON.parse(coin);
            // tslint:disable-next-line:max-line-length
            const priceWidget = "https://s.tradingview.com/widgetembed/?frameElementId=tradingview_fd207&symbol=BTCUSD&interval=D&symboledit=0&saveimage=0&toolbarbg=f1f3f6&studies=%5B%5D&theme=Dark&style=1&timezone=Etc%2FUTC&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_medium=widget&utm_campaign=chart&utm_term=BTCUSD".replace(/BTC/, storedCoin.symbol);

            this.setState({
                coin: storedCoin,
                priceWidget,
            });
        } else {
            axios
                .get<ICoin>(`${Config.API_SERVER}/coin/${this.props.coinID}`)
                .then((response) => {

                    // tslint:disable-next-line:max-line-length
                    const priceWidget = "https://s.tradingview.com/widgetembed/?frameElementId=tradingview_fd207&symbol=BTCUSD&interval=D&symboledit=0&saveimage=0&toolbarbg=f1f3f6&studies=%5B%5D&theme=Dark&style=1&timezone=Etc%2FUTC&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_medium=widget&utm_campaign=chart&utm_term=BTCUSD".replace(/BTC/, response.data.symbol);

                    AsyncStorage.setItem(`@CoinMarketNews:coin${this.props.coinID}`, JSON.stringify(response.data));

                    this.setState({
                        coin: response.data,
                        priceWidget,
                    });
                }).catch(() => {
                    return;
                });
        }
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        addCoinFavourite: (coinID: number, token: string) => dispatch(addCoinFavourite(coinID)),
        removeCoinFavourite: (coinID: number, token: string) => dispatch(removeCoinFavourite(coinID)),
    };
};

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        favourites: state.favourites.favourites,
        user: state.user.user,
    };
};

const CoinsList = connect(mapStateToProps, mapDispatchToProps)(PureCoinsList);
export default CoinsList;

const styles = (darkMode: boolean) => StyleSheet.create({
    pageBackground: {
        backgroundColor: (darkMode) ? "#2f343f" : null,
        flex: 1,
    },
});