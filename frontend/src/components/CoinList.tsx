import React from "react";
import Config from "react-native-config";
import { connect } from "react-redux";

import { Icon, Text, StyleProvider, Spinner } from "native-base";
import { FlatList, TouchableOpacity, View, RefreshControl, Platform, TextInput, NativeSyntheticEvent, NativeScrollEvent, Animated, UIManager, LayoutAnimation, Dimensions, ScrollView } from "react-native";

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
import { darkBackground } from "./styles/colours";
import Coins from "./Coins";
import axios from "axios";

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
    searching: boolean;
    searchedCoins: ICoinPrice[];
    cryptoCurrencyName: string;
    fiatCurrencyName: string;
    showCancel: boolean;
    showSearch: boolean;
}
class PureCoinList extends React.Component<ICoinListProps, ICoinListState> {
    public cryptoCurrency = <Text style={styles(this.props.appSettings.darkMode).coinPrice}>&#xf15a; </Text>;
    public fiatCurrency = <Text style={styles(this.props.appSettings.darkMode).coinPrice}>$ </Text>;
    public windowHeight = Dimensions.get("window").height;
    public textInput: TextInput;
    public searchInput: string = "";
    public offset = 0;

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
            searching: false,
            searchedCoins: [],
            cryptoCurrencyName: "BTC",
            showCancel: false,
            showSearch: true,
            fiatCurrencyName: "USD",
        };
    }
    
    public renderCoinList = (info: { item: ICoinPrice, index: number }) => {
        const favourite = this.props.favourites.indexOf(info.item.id) > -1;
        if (info.item.price_crypto.percent_change_1h === null || info.item.price_crypto.percent_change_24h === null || info.item.price_crypto.percent_change_7d === null || info.item.price_fiat.percent_change_1h === null || info.item.price_fiat.percent_change_24h === null || info.item.price_fiat.percent_change_7d === null) {
            return null
        };

        return (
            <CoinListItem key={info.item.id} item={info.item} favourite={favourite} navigator={this.props.navigator} setting={this.props.setting} />
        )
    }
    public renderSearchBar() {
        if (this.state.showSearch) {
            return (
                <View>
                    <View style={{ flexDirection: "row", justifyContent: "center", alignItems: "center", backgroundColor: (this.props.appSettings.darkMode) ? "#343a44" : "#F8F8F8", height: 50, }}>
                        <TextInput
                            style={{ flex: 0.95, backgroundColor: "#FFFFFF", borderColor: 'gray', borderWidth: 1, borderRadius: 7, height: 40, }}
                            clearButtonMode={"always"}
                            onChangeText={this.onChangeTextHandler}
                            onFocus={this.onFocusHandler}
                            onBlur={this.onBlurHandler}
                            underlineColorAndroid="transparent"
                            placeholder="Search"
                            ref={input => { this.textInput = input }}
                        // value={this.state.text}
                        />
                        <TouchableOpacity style={{ marginLeft: 5 }} onPress={this.onPressCancel}>{(this.state.showCancel) ? <Text>Cancel</Text> : null}</TouchableOpacity>
                    </View>
                    <View style={{ height: (this.state.searching) ? this.windowHeight - 227 : 0 }}>
                        <FlatList
                            data={this.state.searchedCoins}
                            extraData={this.props.favourites}
                            initialNumToRender={15}
                            renderItem={this.renderCoinList}
                            keyExtractor={this.keyExtractor}
                            style={[styles(this.props.appSettings.darkMode).coinList,]}
                            getItemLayout={this.getItemLayout}
                        />
                    </View>
                </View >
            )
        } else {
            return null
        }
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
                        (this.props.favouriteTab) ? null : (
                            this.renderSearchBar()
                        )
                    }
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
                                    style={[styles(this.props.appSettings.darkMode).coinList,]}
                                    getItemLayout={this.getItemLayout}
                                    refreshControl={(Platform.OS === "ios") ? <RefreshControl refreshing={this.state.refreshing} onRefresh={this.onRefresh} /> : null}
                                    // onEndReached={this.endReached}
                                    // onEndReachedThreshold={0.8}
                                    onScroll={this.onScroll}
                                    ListEmptyComponent={spinner()}
                                // ListFooterComponent={<TouchableOpacity style={styles(this.props.appSettings.darkMode).listItem} ><Text >More Coins</Text></TouchableOpacity>}
                                />
                            )
                    }
                </View>
            </StyleProvider>
        );

    }
    private endReached = () => {
        // console.log('end');
        // const newNumberOfCoins = this.state.numberOfCoins + 100;
        // getCoins(this.props.appSettings, this.state.numberOfCoins, 100).then(() => {
        //     this.setState({
        //         numberOfCoins: newNumberOfCoins,
        //     })
        // })
    }
    private getItemLayout = (data: any, index: number) => ({ length: 70, offset: 70 * index, index });
    private keyExtractor = (item: ICoinPrice) => item.id.toString();
    private onBlurHandler = () => {
        if (this.state.searchedCoins.length > 0) {
            return
        } else {
            this.textInput.clear()
            this.setState({
                showCancel: false
            }, () => {
                if (Platform.OS === "android") {
                    UIManager.setLayoutAnimationEnabledExperimental && UIManager.setLayoutAnimationEnabledExperimental(true);
                }
                let animationConfig = { ...LayoutAnimation.Presets.spring };
                animationConfig.duration = 720;

                LayoutAnimation.configureNext(animationConfig);

                this.setState({
                    searching: false
                })
            })
        }
    }
    private onChangeTextHandler = (searchInput: string) => {
        this.searchInput = searchInput;
        if (searchInput.length > 1) {
            if (searchInput.length > 2 && this.state.searchedCoins.length === 0) {
                return
            } else {
                axios
                    .get<ICoinPrice[]>(
                        `${Config.API_SERVER}/price/search`,
                        {
                            headers: {
                                token: this.props.user.token,
                                searchInput: searchInput,
                                fiat: this.state.fiatCurrencyName,
                                crypto: this.state.cryptoCurrencyName,
                            }
                        }
                    )
                    .then((response) => {
                        if (this.searchInput.length > 1) {
                            this.setState({
                                searchedCoins: response.data
                            });
                        }
                    });
            }
        } else {
            this.setState({
                searchedCoins: []
            });
        }
    }
    private onFocusHandler = () => {
        this.setState({
            showCancel: true
        }, () => {
            if (Platform.OS === "android") {
                UIManager.setLayoutAnimationEnabledExperimental && UIManager.setLayoutAnimationEnabledExperimental(true);
            }

            let animationConfig = { ...LayoutAnimation.Presets.easeInEaseOut };
            animationConfig.duration = 400;

            LayoutAnimation.configureNext(animationConfig);

            this.setState({
                searching: true
            })
        })

    }
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

    private onPressCancel = () => {
        this.setState({
            searchedCoins: []
        }, () => {
            this.textInput.clear();
            this.textInput.blur();
            this.onBlurHandler();
        })
    }
    private onScroll = (event: NativeSyntheticEvent<NativeScrollEvent>) => {
        if (Platform.OS === "android") {
            UIManager.setLayoutAnimationEnabledExperimental && UIManager.setLayoutAnimationEnabledExperimental(true);
        }

        if (this.offset - event.nativeEvent.contentOffset.y > 5) {
            LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut);
            this.setState({
                showSearch: true
            })
        } else if (event.nativeEvent.contentOffset.y - this.offset > 30) {
            LayoutAnimation.configureNext(LayoutAnimation.Presets.easeInEaseOut);
            this.setState({
                showSearch: false
            })
        }
        this.offset = event.nativeEvent.contentOffset.y
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