import React from "react";
import Config from "react-native-config";
import { Navigator } from "react-native-navigation";
import { connect, Dispatch } from "react-redux";

import { Button, Col, Container, Grid, Icon, Segment, Tab, Tabs, Text, Thumbnail } from "native-base";
import { FlatList, Platform, StyleSheet, TouchableHighlight, TouchableNativeFeedback, View } from "react-native";

import { ICoin, IUser } from "../models";
import { addCoinFavourite, removeCoinFavourite } from "../redux/actions/favourites";
import { IRootState } from "../redux/store";

interface ICoinsListProps {
    coins: ICoin[];
    favourites: number[];
    user: IUser;
    navigator: Navigator;
    addCoinFavourite: (coinID: number) => void;
    removeCoinFavourite: (coinID: number) => void;
}

class PureCoinsList extends React.Component<ICoinsListProps> {
    public renderCoins = (info: { item: ICoin, index: number }, heartColour: string) => {
        return (
            <View style={styles.listCoin}>
                <View style={styles.listCoinLeft}>
                    <Text>{info.item.rank}. </Text>
                    <Thumbnail source={
                        // tslint:disable-next-line:max-line-length
                        // { uri: `${Config.API_SERVER}/icon/${info.item.symbol.toLocaleLowerCase()}.png` }
                        { uri: `http://10.0.0.22:8000/icon/${info.item.symbol.toLocaleLowerCase()}.png` }
                        // { uri: `http://api.coinmarketnews.app/icon/${info.item.symbol.toLocaleLowerCase()}.png` }
                    } />
                </View>
                <View style={styles.listCoinBody}>
                    <Text style={styles.coinName}>{info.item.name}</Text>
                    <Text note={true}>$3.00</Text>
                </View>
                <View style={styles.listCoinRight}>
                    <View>
                        <Text note={true} style={styles.listCoinRightText}>$3.00</Text>
                        <Text note={true} style={styles.listCoinRightText}>$3.00</Text>
                    </View>
                    <View>
                        <Icon
                            type="FontAwesome"
                            name="heart"
                            style={{ color: heartColour }}
                            onPress={this.handlePressHeart.bind(this, info.item.id)}
                        />
                    </View>
                </View>
            </View>
        );
    }

    public renderCoinList = (info: { item: ICoin, index: number }) => {
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
                    <TouchableHighlight onPress={this.handlePress.bind(this, info)} delayPressIn={0}>
                        {this.renderCoins(info, heartColour)}
                    </TouchableHighlight>
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
                        <Button style={styles.smallpadding} first={true} active={true}>
                            <Text style={styles.nopadding}>Cap</Text>
                        </Button>
                        <Button style={styles.smallpadding}>
                            <Text style={styles.nopadding}>Gain</Text>
                        </Button>
                        <Button style={styles.smallpadding} last={true}>
                            <Text style={styles.nopadding}>Drop</Text>
                        </Button>
                    </Segment>
                </Col>
                <Col style={{ flex: 0.25 }}>
                    <Segment>
                        <Button style={styles.smallpadding} first={true} active={true}>
                            <Text style={styles.nopadding}>USD</Text>
                        </Button>
                        <Button style={styles.smallpadding} last={true}>
                            <Text style={styles.nopadding}>BTC</Text>
                        </Button>
                    </Segment>
                </Col>
                <Col style={{ flex: 0.35 }}>
                    <Segment>
                        <Button style={styles.smallpadding} first={true} active={true}>
                            <Text style={styles.nopadding}>1W</Text>
                        </Button>
                        <Button style={styles.smallpadding}>
                            <Text style={styles.nopadding}>1D</Text>
                        </Button>
                        <Button style={styles.smallpadding} last={true}>
                            <Text style={styles.nopadding}>1M</Text>
                        </Button>
                    </Segment>
                </Col>
            </Grid>
        );
    }
    public render() {
        if (this.props.coins) {
            return (
                <Container style={styles.coinListComponent}>
                    <Tabs initialPage={(this.props.favourites.length > 0) ? 0 : 1}>
                        <Tab heading="Favourites">
                            {this.renderOptions()}
                            {(this.props.favourites.length > 0) ? (
                                <FlatList
                                    data={this.props.coins.filter(
                                        (coin: ICoin) => this.props.favourites.indexOf(coin.id) > -1,
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
                                data={this.props.coins.slice().splice(0, 20)}
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
                    <Text>
                        CoinMarketNews was unable to retrieve data.
                    </Text>
                </View>
            );
        }
    }

    private handlePress = (info: { item: ICoin, index: number }) => {
        this.props.navigator.push({
            animated: true,
            animationType: "fade",
            backButtonHidden: false, // hide the back button altogether (optional)
            navigatorButtons: {},
            navigatorStyle: {},
            passProps: { coin: info.item },
            screen: "CoinMarketNews.CoinsPage",
            title: info.item.name,
            // titleImage: `${Config.API_SERVER}/icon/${info.item.symbol.toLocaleLowerCase()}.png`,
            titleImage: `http://10.0.0.22:8000/icon/${info.item.symbol.toLocaleLowerCase()}.png`,
        });
    }
    private handlePressHeart = (coinID: number) => {
        if (this.props.favourites.indexOf(coinID) === -1) {
            return this.props.addCoinFavourite(coinID);
        } else {
            return this.props.removeCoinFavourite(coinID);
        }
    }
    private keyExtractor = (item: ICoin) => item.id.toString();
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
    listCoin: {
        flex: 1,
        flexDirection: "row",
        paddingBottom: 10,
        paddingLeft: 20,
        paddingRight: 20,
        paddingTop: 10,

    },
    listCoinBody: {
        flex: 0.53,
        justifyContent: "space-around",
        paddingLeft: 10,
    },
    listCoinLeft: {
        alignItems: "center",
        flex: 0.23,
        flexDirection: "row",
        justifyContent: "space-between",
    },
    listCoinRight: {
        alignItems: "center",
        flex: 0.24,
        flexDirection: "row",
        justifyContent: "space-between",
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
