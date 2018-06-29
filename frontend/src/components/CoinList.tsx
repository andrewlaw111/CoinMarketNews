import React from "react";
import Config from "react-native-config";
import FastImage from "react-native-fast-image";
import { connect } from "react-redux";

import { Icon, Text, Thumbnail, StyleProvider, Spinner } from "native-base";
import { FlatList, TouchableOpacity, View, RefreshControl, Platform } from "react-native";

import { ICoinPrice, IUser, ISettings } from "../models";
import { addCoinFavourite, removeCoinFavourite } from "../redux/actions/favourites";
import { IRootState } from "../redux/store";

import { styles } from "./styles/CoinsStyles";
import displayCoinOptions from "./functions/CoinsRenderSettings";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';
import IonIcons from "react-native-vector-icons/Ionicons";

import { getCoins } from "../redux/actions/coins";
import { Navigator } from "react-native-navigation";

interface ICoinListProps {
    coins: ICoinPrice[];
    favouriteTab: boolean;
    favourites: number[];
    appSettings: ISettings;
    setting: string,
    user: IUser,
    navigator: Navigator;
    addCoinFavourite: (coinID: number, token: string) => void;
    removeCoinFavourite: (coinID: number, token: string) => void;
}

export interface ICoinListState {
    cryptoCurrencyName: string;
    fiatCurrencyName: string;
    refreshing: boolean;
}
class PureCoinList extends React.PureComponent<ICoinListProps, ICoinListState> {
    public currencySymbols: { [key: string]: string } = {
        USD: "$",
        EUR: "€",
        CAD: "$",
        GBP: "£",
        HKD: "$",
        // BTC: "&#xf15a",
        // ETH: "&#xf42e",
    }
    public constructor(props: ICoinListProps) {
        super(props);
        this.state = {
            refreshing: false,
            cryptoCurrencyName: "BTC",
            fiatCurrencyName: "USD",
        };
    }

    public renderCoinList = (info: { item: ICoinPrice, index: number }) => {
        let heartColour: string;
        if (this.props.favourites.indexOf(info.item.id) > -1) {
            heartColour = "orange";
        } else {
            heartColour = "grey";
        }
        if (info.item.price_crypto.percent_change_1h === null || info.item.price_crypto.percent_change_24h === null || info.item.price_crypto.percent_change_7d === null || info.item.price_fiat.percent_change_1h === null || info.item.price_fiat.percent_change_24h === null || info.item.price_fiat.percent_change_7d === null ) {
            return
        };
        const percentageChange = displayCoinOptions[this.props.setting[1]][this.props.setting[2]].percentageChange(info.item);
        const coinPrice = displayCoinOptions[this.props.setting[1]][this.props.setting[2]].coinPrice(info.item);

        const coinCurrency = (this.props.setting[1] === '1') ?
            (
                // <Text style={{ fontFamily: "Font Awesome 5 Brands" }}>{this.currencySymbols[this.props.appSettings.cryptoCurrency]}</Text>
                (this.props.appSettings.cryptoCurrency === "BTC") ? <Text style={{ fontFamily: "Font Awesome 5 Brands" }}>&#xf15a; </Text> : <Text style={{ fontFamily: "Font Awesome 5 Brands" }}>&#xf42e; </Text>
            ) : (
                <Text style={styles(this.props.appSettings.darkMode).coinPrice}>{this.currencySymbols[this.props.appSettings.fiatCurrency]}</Text>
            );
        // BTC : &#xf15a; / ETH : &#xf42e;
        const priceColour = (parseFloat(percentageChange) > 0) ? "green" : (parseFloat(percentageChange) === 0) ? "grey" : "red";
        return (
            <View style={styles(this.props.appSettings.darkMode).listItem}>
                <TouchableOpacity onPress={this.handlePress.bind(this, info)} delayPressIn={0}>
                    <View style={styles(this.props.appSettings.darkMode).listCoin} >

                        <View style={styles(this.props.appSettings.darkMode).listCoinLeft}>
                            <Text style={styles(this.props.appSettings.darkMode).coinText}>{info.item.rank}</Text>
                            <View style={{ backgroundColor: "#fff", borderRadius: 50, overflow: "hidden", }}>
                                <Thumbnail
                                    style={styles(this.props.appSettings.darkMode).coinThumbnail}
                                    source={{ uri: `${Config.API_SERVER}/icon/${info.item.symbol.toLocaleLowerCase()}.png` }}
                                />
                            </View>
                        </View>

                        <View style={styles(this.props.appSettings.darkMode).listCoinBody}>
                            <View style={styles(this.props.appSettings.darkMode).listCoinName}>
                                <Text style={styles(this.props.appSettings.darkMode).coinName}>{info.item.name}</Text>
                                <Text style={styles(this.props.appSettings.darkMode).coinSymbol}>{info.item.symbol}</Text>
                            </View>
                            <View style={styles(this.props.appSettings.darkMode).listCoinName}>
                                {coinCurrency}
                                <Text note={true} style={styles(this.props.appSettings.darkMode).coinPrice}>{coinPrice} </Text>
                            </View>
                        </View>

                        <View style={styles(this.props.appSettings.darkMode).listCoinRight}>
                            <View style={{ alignItems: "flex-end" }}>
                                <Text note={true} style={{ color: priceColour, fontSize: 18 }}>{percentageChange}%</Text>
                            </View>
                            <TouchableOpacity
                                style={{ alignItems: "flex-end", height: 70, justifyContent: "center", paddingRight: 10, right: -10, width: 50 }}
                                onPress={this.handlePressHeart.bind(this, info.item.id, this.props.user.token)}
                            >
                                <Icon
                                    type="Ionicons"
                                    name="ios-star"
                                    style={{ color: heartColour }}
                                />
                            </TouchableOpacity>
                        </View>
                    </View>
                </TouchableOpacity>
            </View>
        );
    }

    public render() {
        const favouriteCoins = this.props.coins.filter((coin: ICoinPrice) => this.props.favourites.indexOf(coin.id) > -1)

        return (
            <StyleProvider style={getTheme(commonColour)}>
                <View style={styles(this.props.appSettings.darkMode).coinListComponent}>
                    {/* tslint:disable-next-line:jsx-no-multiline-js */}
                    {(this.props.coins.length > 0) ? (
                        /* tslint:disable-next-line:jsx-no-multiline-js */
                        (this.props.favouriteTab) ? (
                            (favouriteCoins.length > 0) ? (
                                <FlatList
                                    data={favouriteCoins}
                                    extraData={this.props.favourites}
                                    renderItem={this.renderCoinList}
                                    keyExtractor={this.keyExtractor}
                                    style={styles(this.props.appSettings.darkMode).coinList}
                                    getItemLayout={this.getItemLayout}
                                    refreshControl={<RefreshControl refreshing={this.state.refreshing} onRefresh={this.onRefresh} />}
                                />
                            ) : (
                                    <View style={styles(this.props.appSettings.darkMode).coinListComponent}>
                                        <Text style={styles(this.props.appSettings.darkMode).NoFavourites}>
                                            You have no favourite coins! Click on the ❤️ to add some favourites!
                                            </Text>
                                    </View>
                                )
                        ) : (
                                <FlatList
                                    data={this.props.coins}
                                    extraData={this.props.favourites}
                                    initialNumToRender={15}
                                    renderItem={this.renderCoinList}
                                    keyExtractor={this.keyExtractor}
                                    style={styles(this.props.appSettings.darkMode).coinList}
                                    getItemLayout={this.getItemLayout}
                                    refreshControl={<RefreshControl refreshing={this.state.refreshing} onRefresh={this.onRefresh} />}
                                />
                            )
                    ) : (
                            <View style={styles(this.props.appSettings.darkMode).coinListComponent}>
                                <Spinner />
                            </View>
                        )
                    }
                </View>
            </StyleProvider>
        );

    }

    private handlePress = (info: { item: ICoinPrice, index: number }) => {
        const favourite = (this.props.favourites.indexOf(info.item.id) > -1) ? true : false;
        Promise.all([
            IonIcons.getImageSource("ios-arrow-back", 20, "#FFF"),
            IonIcons.getImageSource("ios-star", 24, "grey"),
        ]).then((sources) => {
            this.props.navigator.showModal({
                navigatorButtons: {
                    leftButtons: [{
                        buttonColor: (this.props.appSettings.darkMode) ? "#F8F8F8" : (Platform.OS === "ios") ? "#   2874F0" : "#333",
                        buttonFontSize: 18,
                        buttonFontWeight: "600",
                        id: "back",
                        showAsAction: "ifRoom",
                        title: "back",
                        icon: (Platform.OS === "ios") ? sources[0] : null,
                    }],
                    rightButtons: [{
                        buttonColor: (favourite) ? "gold" : "grey",
                        buttonFontSize: 18,
                        buttonFontWeight: "600",
                        id: "like",
                        showAsAction: "ifRoom",
                        icon: sources[1],
                    }],

                },
                navigatorStyle: {},
                passProps: { appSettings: this.props.appSettings, coinID: info.item.id, coinPrice: info.item, favourite },
                screen: "CoinMarketNews.CoinsPage",
                title: info.item.name,
            });
        }).catch((err) => {
            console.error(err)
        })
    }

    private handlePressHeart = (coinID: number, token: string) => {
        if (this.props.favourites.indexOf(coinID) === -1) {
            return this.props.addCoinFavourite(coinID, token);
        } else {
            return this.props.removeCoinFavourite(coinID, token);
        }
    }
    private getItemLayout = (data: any, index: number) => ({ length: 70, offset: 70 * index, index });
    private keyExtractor = (item: ICoinPrice) => item.id.toString();

    private onRefresh = () => {
        this.setState({
            refreshing: true
        });
        getCoins().then(() => {
            this.setState({
                refreshing: false
            });
        });
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        addCoinFavourite: (coinID: number, token: string) => dispatch(addCoinFavourite(coinID, token)),
        removeCoinFavourite: (coinID: number, token: string) => dispatch(removeCoinFavourite(coinID, token)),
    };
};

const mapStateToProps = (state: IRootState) => {
    return {
        favourites: state.favourites.favourites,
        appSettings: state.settings.settings,
    };
};

const CoinList = connect(mapStateToProps, mapDispatchToProps)(PureCoinList);
export default CoinList;