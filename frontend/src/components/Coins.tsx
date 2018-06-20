import React from "react";
import Config from "react-native-config";
import { Navigator } from "react-native-navigation";
import { connect, Dispatch } from "react-redux";

import { Button, Col, Grid, Icon, Segment, Text, Thumbnail } from "native-base";
import { FlatList, StyleSheet, TouchableHighlight, TouchableNativeFeedback, View } from "react-native";

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
    public renderCoinList = (info: { item: ICoin, index: number }) => {
        // console.error(this.props.favourites);
        let heartColor: string;
        if (this.props.favourites.indexOf(info.item.id) > -1) {
            heartColor = "red";
        } else {
            heartColor = "grey";
        }
        return (
            <View style={styles.listItem}>
                <TouchableNativeFeedback onPress={this.handlePress.bind(this, info.index)} delayPressIn={0}>
                    <View style={styles.listCoin}>
                        <View style={styles.listCoinLeft}>
                            <Text>{info.item.rank}. </Text>
                            <Thumbnail source={
                                // tslint:disable-next-line:max-line-length
                                { uri: `${Config.API_SERVER}/icon/${info.item.symbol.toLocaleLowerCase()}.png` }
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
                                    style={{ color: heartColor }}
                                    onPress={this.handlePressHeart.bind(this, info.item.id)}
                                />
                            </View>
                        </View>
                    </View>
                </TouchableNativeFeedback>
            </View>
        );
    }

    public render() {
        if (this.props.coins) {
            return (
                <View style={styles.coinListComponent}>
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
                    <FlatList data={this.props.coins.slice().splice(0, 20)}
                        renderItem={this.renderCoinList}
                        keyExtractor={this.keyExtractor}
                        style={styles.coinList}
                    />
                </View>
            );
        } else {
            return (
                <View>
                    <Text>CoinMarketNews was unable to retrieve data.</Text>
                </View>
            );
        }
    }

    private handlePress = (coinID: number) => {
        this.props.navigator.showModal({
            animationType: "slide-up",
            passProps: { coinID },
            screen: "CoinMarketNews.CoinsPage",
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
