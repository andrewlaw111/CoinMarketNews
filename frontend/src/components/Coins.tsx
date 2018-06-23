import React from "react";
import Config from "react-native-config";
import FastImage from "react-native-fast-image";
import { isIphoneX } from "react-native-iphone-x-helper";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Button, Col, Container, Content, Grid, Icon, Segment, Spinner, Tab, Tabs, Text, Thumbnail } from "native-base";
import { FlatList, Platform, TouchableNativeFeedback, TouchableOpacity, View } from "react-native";

import { ICoinPrice, IUser } from "../models";
import { addCoinFavourite, removeCoinFavourite } from "../redux/actions/favourites";
import { IRootState } from "../redux/store";
import sortCoins from "./CoinsSort";

import coinStyles from "./styles/CoinsStyles"
import getSettingID from "./CoinsSettings";
import displayCoinOptions from "./CoinsRenderSettings";

interface ICoinsListProps {
    coins: ICoinPrice[];
    favourites: number[];
    user: IUser;
    navigator: Navigator;
    addCoinFavourite: (coinID: number) => void;
    removeCoinFavourite: (coinID: number) => void;
}

export interface ICoinsListState {
    // coinsToRender: ICoinPrice[];
    setting: string,
    cryptoCurrencyName: string;
    fiatCurrencyName: string;
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
            // coinsToRender: [],
            cryptoCurrencyName: "BTC",
            fiatCurrencyName: "USD",
            setting: "000",
        };
    }
    // public componentDidMount() {
    //     this.setState({
    //         coinsToRender: this.props.coins
    //     })
    // }
    public renderCoins = (info: { item: ICoinPrice, index: number }, heartColour: string) => {
        const percentageChange = displayCoinOptions[this.state.setting[1]][this.state.setting[2]].percentageChange(info.item);
        const coinPrice = displayCoinOptions[this.state.setting[1]][this.state.setting[2]].coinPrice(info.item);
        const amountCapChange = displayCoinOptions[this.state.setting[1]][this.state.setting[2]].amountCapChange(info.item);

        const priceColour = (parseFloat(percentageChange) > 0) ?
            "green" : (parseFloat(percentageChange) === 0) ?
                "grey" : "red";
        return (
            <View style={coinStyles.listCoin} >

                <View style={coinStyles.listCoinLeft}>
                    <Text>{info.item.rank}. </Text>
                    <View style={{ backgroundColor: "#fff", borderRadius: 50, overflow: "hidden", }}>
                        <Thumbnail
                            style={coinStyles.coinThumbnail}
                            source={{ uri: `${Config.API_SERVER}/icon/${info.item.symbol.toLocaleLowerCase()}.png` }}
                        />
                    </View>
                </View>

                <View style={coinStyles.listCoinBody}>
                    <Text style={coinStyles.coinName}>{info.item.name} ({info.item.symbol})</Text>
                    <Text note={true} style={{ fontWeight: "bold", color: priceColour }}>{coinPrice}</Text>
                </View>

                <View style={coinStyles.listCoinRight}>
                    <View style={{ alignItems: "flex-end" }}>
                        <Text note={true} style={{ color: priceColour }}>{amountCapChange}</Text>
                        <Text note={true} style={{ color: priceColour }}>{percentageChange}%</Text>
                    </View>
                    <TouchableOpacity
                        style={{ alignItems: "flex-end", height: 70, justifyContent: "center", paddingRight: 10, right: -10, width: 50 }}
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
                <View style={coinStyles.listItem}>
                    <TouchableOpacity onPress={this.handlePress.bind(this, info)} delayPressIn={0}>
                        {this.renderCoins(info, heartColour)}
                    </TouchableOpacity>
                </View>
            );
        } else {
            return (
                <View style={coinStyles.listItem}>
                    <TouchableNativeFeedback onPress={this.handlePress.bind(this, info)} delayPressIn={0}>
                        {this.renderCoins(info, heartColour)}
                    </TouchableNativeFeedback>
                </View>
            );
        }
    }
    public renderOptions() {
        interface IOptionsButton {
            active: boolean;
            first: boolean;
            handler: string;
            last: boolean;
            text: string;
        }

        const leftButtons: IOptionsButton[] = [{
            active: this.state.setting[0] === "0",
            first: true,
            handler: "Cap",
            last: false,
            text: "Cap",
        }, {
            active: this.state.setting[0] === "1",
            first: false,
            handler: "Gain",
            last: false,
            text: "Gain",
        }, {
            active: this.state.setting[0] === "2",
            first: false,
            handler: "Drop",
            last: true,
            text: "Drop",
        }];

        const middleButtons: IOptionsButton[] = [{
            active: this.state.setting[1] === "0",
            first: true,
            handler: "Fiat",
            last: false,
            text: this.state.fiatCurrencyName,
        }, {
            active: this.state.setting[1] === "1",
            first: false,
            handler: "Crypto",
            last: true,
            text: this.state.cryptoCurrencyName,
        }];
        const rightButtons: IOptionsButton[] = [{
            active: this.state.setting[2] === "0",
            first: true,
            handler: "oneWeek",
            last: false,
            text: "1W",
        }, {
            active: this.state.setting[2] === "1",
            first: false,
            handler: "oneDay",
            last: false,
            text: "1D",
        }, {
            active: this.state.setting[2] === "2",
            first: false,
            handler: "oneHour",
            last: true,
            text: "1H",
        }];

        const buttonTemplate = (button: IOptionsButton, index: number) => (
            <Button
                style={coinStyles.smallpadding}
                first={button.first}
                active={button.active}
                onPress={this.handleOptionsPress.bind(this, button.handler)}
                key={index}
            >
                <Text style={coinStyles.nopadding}>{button.text}</Text>
            </Button>
        );
        return (
            <Grid style={coinStyles.coinListFilters} >
                <Col style={{ flex: 0.4 }}>
                    <Segment>
                        {leftButtons.map((button, index) => buttonTemplate(button, index))}
                    </Segment>
                </Col>
                <Col style={{ flex: 0.25 }}>
                    <Segment>
                        {middleButtons.map((button, index) => buttonTemplate(button, index))}
                    </Segment>
                </Col>
                <Col style={{ flex: 0.35 }}>
                    <Segment>
                        {rightButtons.map((button, index) => buttonTemplate(button, index))}
                    </Segment>
                </Col>
            </Grid >
        );
    }

    public render() {
        let coins = this.props.coins.slice();

        coins = coins.filter((coin) => coin.price_crypto.market_cap !== null && coin.price_fiat.market_cap !== null && coin.rank !== null);

        coins = sortCoins(this.state.setting, coins);

        if (coins.length > 0) {
            return (
                <Container style={coinStyles.coinListComponent}>
                    <Tabs style={(isIphoneX()) ? { height: 44 } : null} initialPage={0}>
                        <Tab heading="Favourites">
                            {this.renderOptions()}
                            {/* tslint:disable-next-line:jsx-no-multiline-js */}
                            {(this.props.favourites.length > 0) ? (
                                <FlatList
                                    data={coins.filter((coin: ICoinPrice) => this.props.favourites.indexOf(coin.id) > -1, )}
                                    renderItem={this.renderCoinList}
                                    keyExtractor={this.keyExtractor}
                                    style={coinStyles.coinList}
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
                                style={coinStyles.coinList}
                            />
                        </Tab>
                    </Tabs>
                </Container >
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
            passProps: { coinID: info.item.id, coinPrice: info.item },
            screen: "CoinMarketNews.CoinsPage",
            title: info.item.name,
            titleImage: `http://${Config.API_SERVER}/icon/${info.item.symbol.toLocaleLowerCase()}.png`,
        });
    }

    private handlePressHeart = (coinID: number) => {
        if (this.props.favourites.indexOf(coinID) === -1) {
            return this.props.addCoinFavourite(coinID);
        } else {
            return this.props.removeCoinFavourite(coinID);
        }
    }

    private handleOptionsPress = (options: string) => {
        const setting: string = getSettingID(options, this.state.setting);
        this.setState({
            setting
        })
    }

    private keyExtractor = (item: ICoinPrice) => item.id.toString();
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