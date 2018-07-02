import React from "react";
import Config from "react-native-config";
import { connect } from "react-redux";

import { Icon, Text, StyleProvider, Spinner } from "native-base";
import { FlatList, TouchableOpacity, View, RefreshControl, Platform, TextInput, NativeSyntheticEvent, NativeScrollEvent, Animated } from "react-native";

import { ICoinPrice, IUser, ISettings } from "../models";
import { addCoinFavourite, removeCoinFavourite } from "../redux/actions/favourites";
import { IRootState } from "../redux/store";

import { styles } from "./styles/CoinsStyles";
import displayCoinOptions from "./functions/CoinsRenderSettings";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { getCoins } from "../redux/actions/coins";
import { Navigator } from "react-native-navigation";
import CoinListItem from "./CoinListItem";

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
    numberOfCoins: number
    refreshing: boolean;
    searchBarVisible: boolean;
    scrollY: Animated.Value;
}
class PureCoinList extends React.Component<ICoinListProps, ICoinListState> {
    public cryptoCurrency = <Text style={styles(this.props.appSettings.darkMode).coinPrice}>&#xf15a; </Text>;
    public fiatCurrency = <Text style={styles(this.props.appSettings.darkMode).coinPrice}>$ </Text>;

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
            numberOfCoins: 100,
            searchBarVisible: false,
            scrollY: new Animated.Value(0),
        };
    }
    public componentWillReceiveProps() {
        this.cryptoCurrency = (this.props.appSettings.cryptoCurrency === "BTC") ?
            (
                <Text style={{ fontFamily: "Font Awesome 5 Brands", color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E", }}>&#xf15a; </Text>
            ) : (
                < Text style={{ fontFamily: "Font Awesome 5 Brands", color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E", }} >&#xf42e; </Text >
            );

        this.fiatCurrency = <Text style={styles(this.props.appSettings.darkMode).coinPrice} >{this.currencySymbols[this.props.appSettings.fiatCurrency]} </Text>;

    }
    public renderCoinList = (info: { item: ICoinPrice, index: number }) => {
        const favourite = this.props.favourites.indexOf(info.item.id) > -1;
        if (info.item.price_crypto.percent_change_1h === null || info.item.price_crypto.percent_change_24h === null || info.item.price_crypto.percent_change_7d === null || info.item.price_fiat.percent_change_1h === null || info.item.price_fiat.percent_change_24h === null || info.item.price_fiat.percent_change_7d === null) {
            return null
        };
        return (
            <CoinListItem key={info.item.id} item={info.item} cryptoCurrency={this.cryptoCurrency} fiatCurrency={this.fiatCurrency} favourite={favourite} navigator={this.props.navigator} setting={this.props.setting} />
        )
    }
    public renderSearchBar() {
        return (

            <TextInput
                style={{ borderRadius: 3, height: 40, borderColor: 'gray', borderWidth: 1 }}
                // onChangeText={(text) => this.setState({ text })}
                placeholder="Search"
            // value={this.state.text}
            />
        )
    }
    public render() {
        const favouriteCoins = this.props.coins.filter((coin: ICoinPrice) => this.props.favourites.indexOf(coin.id) > -1);
        const spinner = () => {
            return (
                <View style={styles(this.props.appSettings.darkMode).coinListComponent}>
                    <Spinner />
                </View>
            )
        }
        const noFavourites = () => {
            if (this.props.coins.length > 0) {
                return (
                    <View style={styles(this.props.appSettings.darkMode).coinListComponent}>
                        <Text style={styles(this.props.appSettings.darkMode).NoFavourites}>
                            You have no favourite coins! Click on the ⭐️ to add some favourites!
                        </Text>
                    </View>
                )
            } else {
                return spinner()
            }
        }
        return (
            <StyleProvider style={getTheme(commonColour)}>
                <View style={styles(this.props.appSettings.darkMode).coinListComponent}>
                    {/* tslint:disable-next-line:jsx-no-multiline-js */}
                    {
                        (this.props.favouriteTab) ? (
                            <FlatList
                                data={favouriteCoins}
                                extraData={this.props.favourites}
                                renderItem={this.renderCoinList}
                                keyExtractor={this.keyExtractor}
                                style={styles(this.props.appSettings.darkMode).coinList}
                                getItemLayout={this.getItemLayout}
                                refreshControl={(Platform.OS === "ios") ? <RefreshControl refreshing={this.state.refreshing} onRefresh={this.onRefresh} /> : null}
                                ListEmptyComponent={noFavourites()}
                            />
                        ) : (
                                <FlatList
                                    data={this.props.coins}
                                    extraData={this.props.favourites}
                                    initialNumToRender={15}
                                    renderItem={this.renderCoinList}
                                    keyExtractor={this.keyExtractor}
                                    style={styles(this.props.appSettings.darkMode).coinList}
                                    getItemLayout={this.getItemLayout}
                                    refreshControl={(Platform.OS === "ios") ? <RefreshControl refreshing={this.state.refreshing} onRefresh={this.onRefresh} /> : null}
                                    ListHeaderComponent={this.renderSearchBar()}
                                    initialScrollIndex={0}
                                    ListEmptyComponent={spinner()}
                                    ListFooterComponent={<TouchableOpacity style={styles(this.props.appSettings.darkMode).listItem} ><Text >More Coins</Text></TouchableOpacity>}
                                />
                            )
                    }
                </View>
            </StyleProvider>
        );

    }
    private endReached = () => {
        // const newNumberOfCoins = this.state.numberOfCoins + 100;
        // getCoins(this.props.appSettings, this.state.numberOfCoins, 100).then(() => {
        //     this.setState({
        //         numberOfCoins: newNumberOfCoins,
        //     })
        // })
    }
    private getItemLayout = (data: any, index: number) => ({ length: 70, offset: 70 * index, index });
    private keyExtractor = (item: ICoinPrice) => item.id.toString();

    private onRefresh = () => {
        const newNumberOfCoins = this.state.numberOfCoins + 100;
        this.setState({
            refreshing: true
        });
        getCoins(this.props.appSettings, this.state.numberOfCoins, 100).then(() => {
            this.setState({
                numberOfCoins: newNumberOfCoins,    // COMMENT : should be calculated with this.propw.coins.length()
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