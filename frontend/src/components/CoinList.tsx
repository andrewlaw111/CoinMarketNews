import React from "react";
import Config from "react-native-config";
import FastImage from "react-native-fast-image";
import { connect } from "react-redux";

import { Container, Content, Icon, Spinner, Tab, Tabs, Text, Thumbnail, StyleProvider } from "native-base";
import { FlatList, Platform, TouchableOpacity, View } from "react-native";

import CoinOptions from "./CoinsOptions";
import { ICoinPrice, IUser, ISettings } from "../models";
import { addCoinFavourite, removeCoinFavourite } from "../redux/actions/favourites";
import { IRootState } from "../redux/store";

import { coinsStyles, darkCoinsStyles } from "./styles/CoinsStyles"
import getSettingID from "./functions/CoinsSettings";
import sortCoins from "./functions/CoinsSort";
import displayCoinOptions from "./functions/CoinsRenderSettings";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';
import { loadSettings } from "../redux/actions/settings";


interface ICoinListProps {
    coins: ICoinPrice[];
    favouriteTab: boolean;
    favourites: number[];
    appSettings: ISettings;
    setting: string,
    user: IUser,
    handlePress: (info: { item: ICoinPrice, index: number }) => void;
    addCoinFavourite: (coinID: number, token: string) => void;
    removeCoinFavourite: (coinID: number, token: string) => void;
}

export interface ICoinListState {
    cryptoCurrencyName: string;
    fiatCurrencyName: string;
}

class PureCoinList extends React.PureComponent<ICoinListProps, ICoinListState> {
    public darkMode: boolean;
    public styles: typeof coinsStyles;

    public constructor(props: ICoinListProps) {
        super(props);
        this.state = {
            // coinsToRender: [],
            cryptoCurrencyName: "BTC",
            fiatCurrencyName: "USD",
        };
    }

    public renderCoinList = (info: { item: ICoinPrice, index: number }) => {
        let heartColour: string;
        if (this.props.favourites.indexOf(info.item.id) > -1) {
            heartColour = "red";
            console.log("red");
        } else {
            heartColour = "grey";
        }

        const percentageChange = displayCoinOptions[this.props.setting[1]][this.props.setting[2]].percentageChange(info.item);
        const coinPrice = displayCoinOptions[this.props.setting[1]][this.props.setting[2]].coinPrice(info.item);

        const priceColour = (parseFloat(percentageChange) > 0) ? "green" : (parseFloat(percentageChange) === 0) ? "grey" : "red";
        return (
            <View style={this.styles.listItem}>
                <TouchableOpacity onPress={this.handlePress.bind(this, info)} delayPressIn={0}>
                    <View style={this.styles.listCoin} >

                        <View style={this.styles.listCoinLeft}>
                            <Text style={this.styles.coinText}>{info.item.rank}. </Text>
                            <View style={{ backgroundColor: "#fff", borderRadius: 50, overflow: "hidden", }}>
                                <Thumbnail
                                    style={this.styles.coinThumbnail}
                                    source={{ uri: `${Config.API_SERVER}/icon/${info.item.symbol.toLocaleLowerCase()}.png` }}
                                />
                            </View>
                        </View>

                        <View style={this.styles.listCoinBody}>
                            <View style={this.styles.listCoinName}>
                                <Text style={this.styles.coinName}>{info.item.name}</Text>
                                <Text style={this.styles.coinSymbol}>{info.item.symbol}</Text>
                                <Text style={{ fontFamily: "Font Awesome 5 Brands" }}>&#xf15a; &#xf42e;</Text>
                            </View>
                            <Text note={true} style={this.styles.coinPrice}>{coinPrice}</Text>
                        </View>

                        <View style={this.styles.listCoinRight}>
                            <View style={{ alignItems: "flex-end" }}>
                                <Text note={true} style={{ color: priceColour, fontSize: 18 }}>{percentageChange}%</Text>
                            </View>
                            <TouchableOpacity
                                style={{ alignItems: "flex-end", height: 70, justifyContent: "center", paddingRight: 10, right: -10, width: 50 }}
                                onPress={this.handlePressHeart.bind(this, info.item.id, this.props.user.token)}
                            >
                                <Icon
                                    type="FontAwesome"
                                    name="heart"
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
        this.styles = (this.props.appSettings.darkMode) ? darkCoinsStyles : coinsStyles;
        const favouriteCoins = this.props.coins.filter((coin: ICoinPrice) => this.props.favourites.indexOf(coin.id) > -1)
        return (
            <StyleProvider style={getTheme(commonColour)}>
                <View>
                    {/* tslint:disable-next-line:jsx-no-multiline-js */}
                    {(this.props.favouriteTab) ? (
                        (this.props.favourites.length > 0) ? (
                            <FlatList
                                data={favouriteCoins}
                                extraData={this.props.favourites}
                                renderItem={this.renderCoinList}
                                keyExtractor={this.keyExtractor}
                                style={this.styles.coinList}
                                // tslint:disable-next-line:jsx-no-lambda
                                getItemLayout={(data, index) => ({ length: 70, offset: 70 * index, index })}
                            />
                        ) : (
                                <View style={this.styles.coinListComponent}>
                                    <Text style={this.styles.coinText}>
                                        You have no favourite coins! Click on the ❤️ to add some favourites!
                                            </Text>
                                </View>
                            )
                    ) : (
                            <FlatList
                                data={this.props.coins}
                                extraData={this.props.favourites}
                                renderItem={this.renderCoinList}
                                keyExtractor={this.keyExtractor}
                                style={this.styles.coinList}
                                // tslint:disable-next-line:jsx-no-lambda
                                getItemLayout={(data, index) => ({ length: 70, offset: 70 * index, index })}
                            />
                        )
                    }
                </View>
            </StyleProvider>
        );

    }

    private handlePress = (info: { item: ICoinPrice, index: number }) => {
        this.props.handlePress(info);
    }

    private handlePressHeart = (coinID: number, token: string) => {
        if (this.props.favourites.indexOf(coinID) === -1) {
            return this.props.addCoinFavourite(coinID, token);
        } else {
            return this.props.removeCoinFavourite(coinID, token);
        }
    }
    private keyExtractor = (item: ICoinPrice) => item.id.toString();
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