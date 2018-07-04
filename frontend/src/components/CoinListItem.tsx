import React from "react";

import { connect } from "react-redux";
import { ICoinPrice, ISettings, IUser } from "../models";
import { View, TouchableOpacity, Platform, Dimensions } from "react-native";
import { styles } from "./styles/CoinsStyles";
import displayCoinOptions from "./functions/CoinsRenderSettings";
import IonIcons from "react-native-vector-icons/Ionicons";
import { Icon, Text, } from "native-base";
import FastImage from "react-native-fast-image";
import Config from "react-native-config";
import { addCoinFavourite, removeCoinFavourite } from "../redux/actions/favourites";
import { IRootState } from "../redux/store";
import { Navigator } from "react-native-navigation";
import axios from "axios";

interface ICoinListProps {
    appSettings: ISettings;
    favourite: boolean;
    item: ICoinPrice;
    navigator: Navigator;
    setting: string,
    user: IUser,
    addCoinFavourite: (coinID: number, token: string) => void;
    removeCoinFavourite: (coinID: number, token: string) => void;
}

export interface ICoinListState {
    cryptoCurrencyName: string;
    fiatCurrencyName: string;
}
class PureCoinListItem extends React.PureComponent<ICoinListProps, ICoinListState> {
    public heartColour: string;
    public small_device = Dimensions.get("window").width < 350;

    public currencySymbols: { [key: string]: string } = {
        USD: "$",
        EUR: "€",
        CAD: "$",
        GBP: "£",
        HKD: "$",
        // BTC: "&#xf15a",
        // ETH: "&#xf42e",
    }
    public cryptoCurrency = (this.props.appSettings.cryptoCurrency === "BTC") ?
        (
            <Text style={{ fontFamily: "Font Awesome 5 Brands", color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E", }}>&#xf15a; </Text>
        ) : (
            < Text style={{ fontFamily: "Font Awesome 5 Brands", color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E", }} >&#xf42e; </Text >
        );

    public fiatCurrency = <Text style={styles(this.props.appSettings.darkMode).coinPrice} >{this.currencySymbols[this.props.appSettings.fiatCurrency]} </Text>;

    public percentageChange = displayCoinOptions[this.props.setting[1]][this.props.setting[2]].percentageChange(this.props.item);
    public coinPrice = displayCoinOptions[this.props.setting[1]][this.props.setting[2]].coinPrice(this.props.item);
    public priceColour = (parseFloat(this.percentageChange) > 0) ? "green" : (parseFloat(this.percentageChange) === 0) ? "grey" : "red";

    public componentWillReceiveProps(nextProps: ICoinListProps) {
        this.cryptoCurrency = (nextProps.appSettings.cryptoCurrency === "BTC") ?
            (
                <Text style={{ fontFamily: "Font Awesome 5 Brands", color: (nextProps.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E", }}>&#xf15a; </Text>
            ) : (
                < Text style={{ fontFamily: "Font Awesome 5 Brands", color: (nextProps.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E", }} >&#xf42e; </Text >
            );

        this.fiatCurrency = <Text style={styles(nextProps.appSettings.darkMode).coinPrice} >{this.currencySymbols[nextProps.appSettings.fiatCurrency]} </Text>;
        this.percentageChange = displayCoinOptions[nextProps.setting[1]][nextProps.setting[2]].percentageChange(nextProps.item);
        this.coinPrice = displayCoinOptions[nextProps.setting[1]][nextProps.setting[2]].coinPrice(nextProps.item);
        this.priceColour = (parseFloat(this.percentageChange) > 0) ? "green" : (parseFloat(this.percentageChange) === 0) ? "grey" : "red";
        if (nextProps.favourite) {
            this.heartColour = "orange";
        } else {
            this.heartColour = "grey";
        }
    }
    constructor(props: ICoinListProps) {
        super(props);
        this.state = {
            cryptoCurrencyName: "BTC",
            fiatCurrencyName: "USD",
        }
        if (this.props.favourite) {
            this.heartColour = "orange";
        } else {
            this.heartColour = "grey";
        }
    }

    public renderItemIcon() {
        return (
            <View style={styles(this.props.appSettings.darkMode).listCoinLeft}>
                <Text style={styles(this.props.appSettings.darkMode).coinText}>{this.props.item.rank}</Text>
                <FastImage
                    style={styles(this.props.appSettings.darkMode).coinThumbnail}
                    source={{ uri: `${Config.API_SERVER}/icon/${this.props.item.symbol.toLocaleLowerCase()}.png` }}
                    resizeMode={FastImage.resizeMode.contain}
                />
            </View>
        )
    }

    public renderItemLeft() {
        return (
            <View style={styles(this.props.appSettings.darkMode).listCoinBody}>
                <View style={[styles(this.props.appSettings.darkMode).listCoinName, { justifyContent: "space-between" }]}>
                    <Text style={[styles(this.props.appSettings.darkMode).coinName]}>{this.props.item.name}</Text>
                    <Text style={[styles(this.props.appSettings.darkMode).coinSymbol]}>{this.props.item.symbol}</Text>
                </View>
                <View style={styles(this.props.appSettings.darkMode).listCoinName}>
                    {(this.props.setting[1] === '1') ? this.cryptoCurrency : this.fiatCurrency}
                    <Text note={true} style={styles(this.props.appSettings.darkMode).coinPrice}>{this.coinPrice} </Text>
                </View>
            </View>
        )
    }
    public renderItemRight() {
        return (
            <View style={styles(this.props.appSettings.darkMode).listCoinRight}>
                <View style={{ alignItems: "flex-end", paddingRight: (this.small_device) ? 5 : 10 }}>
                    <Text note={true} style={{ color: this.priceColour, fontSize: 18 }}>{this.percentageChange}%</Text>
                </View>
                <TouchableOpacity
                    style={{ alignItems: "flex-end", height: 70, justifyContent: "center" }}
                    onPress={this.handlePressHeart.bind(this, this.props.item.id, this.props.user.token)}
                >
                    <Icon
                        type="Ionicons"
                        name="ios-star"
                        style={{ color: this.heartColour }}
                    />
                </TouchableOpacity>
            </View>
        )
    }
    public render() {
        return (
            <View style={styles(this.props.appSettings.darkMode).listItem}>
                <TouchableOpacity onPress={this.handlePress.bind(this, this.props.item)}>
                    <View style={styles(this.props.appSettings.darkMode).listCoin} >
                        {this.renderItemIcon()}
                        {this.renderItemLeft()}
                        {this.renderItemRight()}

                    </View>
                </TouchableOpacity>
            </View>)
    }
    private handlePress = (item: ICoinPrice) => {
        Promise.all([
            IonIcons.getImageSource("ios-arrow-back", 20, "#FFF"),
            IonIcons.getImageSource("ios-star", 24, "orange"),
            IonIcons.getImageSource("ios-star", 24, "grey"),
        ]).then((sources) => {
            this.props.navigator.showModal({
                navigatorButtons: {
                    leftButtons: [{
                        buttonColor: (this.props.appSettings.darkMode) ? "#F8F8F8" : "#333",
                        buttonFontSize: 18,
                        buttonFontWeight: "600",
                        id: "back",
                        showAsAction: "ifRoom",
                        title: "back",
                        icon: (Platform.OS === "ios") ? sources[0] : null,
                    }],
                    rightButtons: [{
                        buttonFontSize: 18,
                        disableIconTint: true,
                        buttonFontWeight: "600",
                        id: "like",
                        showAsAction: "ifRoom",
                        icon: (this.props.favourite) ? sources[1] : sources[2],
                    }],

                },
                navigatorStyle: {
                },
                passProps: { appSettings: this.props.appSettings, coinID: item.id, coinPrice: item, favourite: this.props.favourite },
                screen: "CoinMarketNews.CoinsPage",
                title: item.name,
            });

        }).catch((err) => {
            console.error(err)
        })
    }
    private handlePressHeart = (coinID: number, token: string) => {
        if (!this.props.favourite) {
            return this.props.addCoinFavourite(coinID, token);
        } else {
            return this.props.removeCoinFavourite(coinID, token);
        }
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
        appSettings: state.settings.settings,
        user: state.user.user,
    };
};

const CoinListItem = connect(mapStateToProps, mapDispatchToProps)(PureCoinListItem);
export default CoinListItem;