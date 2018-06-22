import React from "react";
import Config from "react-native-config";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Button, Col, Container, Content, Grid, Icon, Segment, Spinner, Tab, Tabs, Text, Thumbnail } from "native-base";
import { FlatList, Platform, StyleSheet, TouchableNativeFeedback, TouchableOpacity, View } from "react-native";

import { ICoinPrice, IUser } from "../models";
import { addCoinFavourite, removeCoinFavourite } from "../redux/actions/favourites";
import { IRootState } from "../redux/store";

interface ICoinsListProps {
    coins: ICoinPrice[];
    favourites: number[];
    user: IUser;
    navigator: Navigator;
    addCoinFavourite: (coinID: number) => void;
    removeCoinFavourite: (coinID: number) => void;
}

interface ICoinsListState {
    sortCap: boolean;
    sortDrop: boolean;
    sortGain: boolean;
    fiatCurrency: boolean;
    cryptoCurrency: boolean;
    setting1D: boolean;
    setting1H: boolean;
    setting1W: boolean;
}

class PureCoinsList extends React.Component<ICoinsListProps, ICoinsListState> {
    public static navigatorStyle = {
        navBarHidden: true,
        statusBarBlur: true,
        statusBarColor: "blue",
    };
    public constructor(props: ICoinsListProps) {
        super(props);
        this.state = {
            cryptoCurrency: false,
            fiatCurrency: true,
            setting1D: true,
            setting1H: false,
            setting1W: false,
            sortCap: true,
            sortDrop: false,
            sortGain: false,
        };
    }
    public renderCoins = (info: { item: ICoinPrice, index: number }, heartColour: string) => {
        let coinPrice: string;
        let amountCapChange: string;
        let percentageChange: string;

        if (this.state.cryptoCurrency) {
            coinPrice = `${info.item.price_crypto.price}`;
            if (this.state.setting1D) {
                amountCapChange =
                    `${
                    (info.item.price_crypto.price / (100 + info.item.price_crypto.percent_change_24h))
                        .toFixed(6)}`;
                percentageChange = `${(info.item.price_crypto.percent_change_24h)
                    .toFixed(2)}`;
            } else if (this.state.setting1H) {
                amountCapChange =
                    `${
                    (info.item.price_crypto.price / (100 + info.item.price_crypto.percent_change_1h))
                        .toFixed(6)}`;
                percentageChange = `${(info.item.price_crypto.percent_change_1h)
                    .toFixed(2)}`;
            } else {
                amountCapChange =
                    `${(info.item.price_crypto.price / (100 + info.item.price_crypto.percent_change_7d))
                        .toFixed(6)}`;
                percentageChange = `${(info.item.price_crypto.percent_change_7d)
                    .toFixed(2)}`;
            }
        } else {
            coinPrice = `${info.item.price_fiat.price}`;
            if (this.state.setting1D) {
                amountCapChange = `${(info.item.price_fiat.price / (100 + info.item.price_fiat.percent_change_24h))
                    .toFixed(6)}`;
                percentageChange = `${(info.item.price_fiat.percent_change_24h)
                    .toFixed(2)}`;
            } else if (this.state.setting1H) {
                amountCapChange = `${(info.item.price_fiat.price / (100 + info.item.price_fiat.percent_change_1h))
                    .toFixed(6)}`;

                percentageChange = `${(info.item.price_fiat.percent_change_1h)
                    .toFixed(2)}`;
            } else {
                amountCapChange = `${(info.item.price_fiat.price / (100 + info.item.price_fiat.percent_change_7d))
                    .toFixed(6)}`;
                percentageChange = `${(info.item.price_fiat.percent_change_7d)
                    .toFixed(2)}`;

            }
        }

        return (
            <View style={styles.listCoin} >
                <View style={styles.listCoinLeft}>
                    <Text>{info.item.rank}. </Text>
                    <View style={{
                        backgroundColor: "#fff",
                        borderRadius: 50,
                        overflow: "hidden",
                    }}>
                        <Thumbnail circular={true} style={styles.coinThumnail} source={
                            { uri: `${Config.API_SERVER}/icon/${info.item.symbol.toLocaleLowerCase()}.png` }
                            // { uri: `http://api.coinmarketnews.app/icon/${info.item.symbol.toLocaleLowerCase()}.png` }
                        } />
                    </View>
                </View>
                <View style={styles.listCoinBody}>
                    <Text style={styles.coinName}>{info.item.name} ({info.item.symbol})</Text>
                    <Text note={true} style={{ fontWeight: "bold" }}>{coinPrice}</Text>
                </View>
                <View style={styles.listCoinRight}>
                    <View>
                        <Text note={true} style={styles.listCoinRightText}>{amountCapChange}</Text>
                        <Text note={true} style={styles.listCoinRightText}>{percentageChange}%</Text>
                    </View>
                    <TouchableOpacity
                        style={{ height: 70, width: 70, justifyContent: "center", alignItems: "center" }}
                        onPress={this.handlePressHeart.bind(this, info.item.id)}
                    >
                        <Icon
                            type="FontAwesome"
                            name="heart"
                            style={{ color: heartColour }}
                        />
                    </TouchableOpacity>
                </View>
            </View>
        );
    }

    public renderCoinList = (info: { item: ICoinPrice, index: number }) => {
        // console.error(this.props.favourites);
        let heartColour: string;
        if (this.props.favourites.indexOf(info.item.id) > -1) {
            heartColour = "red";
        } else {
            heartColour = "grey";
        }
        if (Platform.OS === "ios") {
            return (
                <View style={styles.listItem}>
                    <TouchableOpacity onPress={this.handlePress.bind(this, info)} delayPressIn={0}>
                        {this.renderCoins(info, heartColour)}
                    </TouchableOpacity>
                </View>
            );
        } else {
            return (
                <View style={styles.listItem}>
                    <TouchableNativeFeedback onPress={this.handlePress.bind(this, info)} delayPressIn={0}>
                        {this.renderCoins(info, heartColour)}
                    </TouchableNativeFeedback>
                </View>
            );
        }
    }
    public renderOptions() {
        return (
            <Grid style={styles.coinListFilters}>
                <Col style={{ flex: 0.4 }}>
                    <Segment>
                        <Button
                            style={styles.smallpadding}
                            first={true}
                            active={this.state.sortCap}
                            onPress={this.handleSortPress.bind(this, "Cap")}
                        >
                            <Text style={styles.nopadding}>Cap</Text>
                        </Button>
                        <Button
                            style={styles.smallpadding}
                            active={this.state.sortGain}
                            onPress={this.handleSortPress.bind(this, "Gain")}
                        >
                            <Text style={styles.nopadding}>Gain</Text>
                        </Button>
                        <Button
                            style={styles.smallpadding}
                            last={true}
                            active={this.state.sortDrop}
                            onPress={this.handleSortPress.bind(this, "Drop")}
                        >
                            <Text style={styles.nopadding}>Drop</Text>
                        </Button>
                    </Segment>
                </Col>
                <Col style={{ flex: 0.25 }}>
                    <Segment>
                        <Button style={styles.smallpadding}
                            first={true}
                            active={this.state.fiatCurrency}
                            onPress={this.handleCurrencyPress.bind(this, "Coin")}
                        >
                            <Text style={styles.nopadding}>USD</Text>
                        </Button>
                        <Button style={styles.smallpadding}
                            last={true}
                            active={this.state.cryptoCurrency}
                            onPress={this.handleCurrencyPress.bind(this, "Fiat")}
                        >
                            <Text style={styles.nopadding}>BTC</Text>
                        </Button>
                    </Segment>
                </Col>
                <Col style={{ flex: 0.35 }}>
                    <Segment>
                        <Button
                            first={true}
                            active={this.state.setting1W}
                            onPress={this.handleTimeframePress.bind(this, "1W")}
                            style={styles.smallpadding}
                        >
                            <Text style={styles.nopadding}>1W</Text>
                        </Button>
                        <Button
                            active={this.state.setting1D}
                            onPress={this.handleTimeframePress.bind(this, "1D")}
                            style={styles.smallpadding}

                        >
                            <Text style={styles.nopadding}>1D</Text>
                        </Button>
                        <Button
                            last={true}
                            active={this.state.setting1H}
                            onPress={this.handleTimeframePress.bind(this, "1H")}
                            style={styles.smallpadding}

                        >
                            <Text style={styles.nopadding}>1H</Text>
                        </Button>
                    </Segment>
                </Col>
            </Grid >
        );
    }
    public render() {
        let coins = this.props.coins.slice();

        if (this.state.fiatCurrency) {
            coins = coins.filter((coin) => coin.price_fiat.market_cap !== null && coin.rank !== null);
        } else {
            coins = coins.filter((coin) => coin.price_crypto.market_cap !== null && coin.rank !== null);
        }
        // coins = coins.sort((coinA, coinB) => {
        //     return coinA.price_fiat.percent_change_1h - coinB.price_fiat.percent_change_1h;
        // });
        // console.log(coins);
        coins = this.sortCoins(coins);
        if (this.props.coins.length > 0) {
            return (
                <Container style={styles.coinListComponent}>
                    <Tabs initialPage={0}>
                        <Tab heading="Favourites">
                            {this.renderOptions()}
                            {(this.props.favourites.length > 0) ? (
                                <FlatList
                                    data={coins.filter(
                                        (coin: ICoinPrice) => this.props.favourites.indexOf(coin.id) > -1,
                                    )}
                                    renderItem={this.renderCoinList}
                                    keyExtractor={this.keyExtractor}
                                    style={styles.coinList}
                                />
                            ) : (
                                    <View>
                                        <Text>
                                            You have no favourite coins! Click on the ❤️ to add some favourites!
                                        </Text>
                                    </View>
                                )
                            }

                        </Tab>
                        <Tab heading="Market">
                            {this.renderOptions()}
                            <FlatList
                                data={coins}
                                renderItem={this.renderCoinList}
                                keyExtractor={this.keyExtractor}
                                style={styles.coinList}
                            />
                        </Tab>
                    </Tabs>
                </Container>
            );
        } else {
            return (
                <View>
                    <Content>
                        <Spinner />
                        <Text>CoinMarketNews is fetching prices.</Text>
                    </Content>
                </View>
            );
        }
    }

    private handlePress = (info: { item: ICoinPrice, index: number }) => {
        this.props.navigator.push({
            animated: true,
            animationType: "fade",
            backButtonHidden: false, // hide the back button altogether (optional)
            navigatorButtons: {},
            navigatorStyle: {},
            passProps: { coinID: info.item.id, coinPrice: info.item },
            screen: "CoinMarketNews.CoinsPage",
            title: info.item.name,
            titleImage: `http://10.0.0.22:8000/icon/${info.item.symbol.toLocaleLowerCase()}.png`,
        });
    }
    private handleCurrencyPress = (currency: string) => {
        if (currency === "Fiat") {
            this.setState({
                cryptoCurrency: true,
                fiatCurrency: false,
            });
        } else {
            this.setState({
                cryptoCurrency: false,
                fiatCurrency: true,
            });
        }
    }
    private handlePressHeart = (coinID: number) => {
        if (this.props.favourites.indexOf(coinID) === -1) {
            return this.props.addCoinFavourite(coinID);
        } else {
            return this.props.removeCoinFavourite(coinID);
        }
    }
    private handleSortPress = (options: string) => {
        if (options === "Cap") {
            this.setState({
                sortCap: true,
                sortDrop: false,
                sortGain: false,
            });
        } else if (options === "Drop") {
            this.setState({
                sortCap: false,
                sortDrop: true,
                sortGain: false,
            });
        } else {
            this.setState({
                sortCap: false,
                sortDrop: false,
                sortGain: true,
            });
        }
    }

    private handleTimeframePress = (options: string) => {
        if (options === "1W") {
            this.setState({
                setting1D: false,
                setting1H: false,
                setting1W: true,
            });
        } else if (options === "1D") {
            this.setState({
                setting1D: true,
                setting1H: false,
                setting1W: false,
            });
        } else {
            this.setState({
                setting1D: false,
                setting1H: true,
                setting1W: false,
            });
        }
    }
    private keyExtractor = (item: ICoinPrice) => item.id.toString();
    private sortCoins = (coins: ICoinPrice[]) => {

        switch (true) {
            case this.state.sortCap:
                coins.sort((coinA, coinB) => {
                    return coinA.rank - coinB.rank;
                });
                break;
            case this.state.sortGain && this.state.fiatCurrency:
                if (this.state.setting1H) {
                    coins.sort((coinA, coinB) => {
                        return coinB.price_fiat.percent_change_1h - coinA.price_fiat.percent_change_1h;
                    });
                } else if (this.state.setting1D) {
                    coins.sort((coinA, coinB) => {
                        return coinB.price_fiat.percent_change_24h - coinA.price_fiat.percent_change_24h;
                    });
                } else {
                    coins.sort((coinA, coinB) => {
                        return coinB.price_fiat.percent_change_7d - coinA.price_fiat.percent_change_7d;
                    });
                }
                break;
            case this.state.sortGain && this.state.cryptoCurrency:
                if (this.state.setting1H) {
                    coins.sort((coinA, coinB) => {
                        return coinB.price_crypto.percent_change_1h - coinA.price_crypto.percent_change_1h;
                    });
                } else if (this.state.setting1D) {
                    coins.sort((coinA, coinB) => {
                        return coinB.price_crypto.percent_change_24h - coinA.price_crypto.percent_change_24h;
                    });
                } else {
                    coins.sort((coinA, coinB) => {
                        return coinB.price_crypto.percent_change_7d - coinA.price_crypto.percent_change_7d;
                    });
                }
                break;
            case this.state.sortDrop && this.state.fiatCurrency:
                if (this.state.setting1H) {
                    coins.sort((coinA, coinB) => {
                        return coinA.price_fiat.percent_change_1h - coinB.price_fiat.percent_change_1h;
                    });
                } else if (this.state.setting1D) {
                    coins.sort((coinA, coinB) => {
                        return coinA.price_fiat.percent_change_24h - coinB.price_fiat.percent_change_24h;
                    });
                } else {
                    coins.sort((coinA, coinB) => {
                        return coinA.price_fiat.percent_change_7d - coinB.price_fiat.percent_change_7d;
                    });
                }
                break;
            case this.state.sortDrop && this.state.cryptoCurrency:
                if (this.state.setting1H) {
                    coins.sort((coinA, coinB) => {
                        return coinA.price_crypto.percent_change_1h - coinB.price_crypto.percent_change_1h;
                    });
                } else if (this.state.setting1D) {
                    coins.sort((coinA, coinB) => {
                        return coinA.price_crypto.percent_change_24h - coinB.price_crypto.percent_change_24h;
                    });
                } else {
                    coins.sort((coinA, coinB) => {
                        return coinA.price_crypto.percent_change_7d - coinB.price_crypto.percent_change_7d;
                    });
                }
                break;
            default:
                return;
        }
        return coins;
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        addCoinFavourite: (coinID: number) => dispatch(addCoinFavourite(coinID)),
        removeCoinFavourite: (coinID: number) => dispatch(removeCoinFavourite(coinID)),
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

const styles = StyleSheet.create({
    coinList: {
        flex: 0,
    },
    coinListComponent: {
    },
    coinListFilters: {
        backgroundColor: "#000",
        flex: 0,
    },
    coinName: {
        fontWeight: "bold",
    },
    coinThumnail: {
        backgroundColor: "grey",
        margin: 0,
    },
    listCoin: {
        flex: 1,
        flexDirection: "row",
        paddingBottom: 10,
        paddingLeft: 20,
        paddingRight: 20,
        paddingTop: 10,

    },
    listCoinBody: {
        flex: 0.45,
        justifyContent: "center",
        paddingLeft: 10,
        paddingRight: 10,
    },
    listCoinLeft: {
        alignItems: "center",
        flex: 0.25,
        flexDirection: "row",
        justifyContent: "flex-start",
    },
    listCoinRight: {
        alignItems: "center",
        flex: 0.30,
        flexDirection: "row",
        justifyContent: "flex-end",
        right: -20,
    },
    listCoinRightText: {
        // textAlign: "right",
    },
    listItem: {
        borderColor: "#d6d7da",
        borderWidth: 0.5,
    },
    listStyle: {
        paddingTop: -100,
    },
    nopadding: {
        paddingLeft: 0,
        paddingRight: 0,
    },
    smallpadding: {
        paddingLeft: 5,
        paddingRight: 5,
    },
});
