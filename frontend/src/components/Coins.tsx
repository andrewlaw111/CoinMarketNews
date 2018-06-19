import React from "react";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Body, Button, Col, Grid, Left, List, ListItem, Right, Segment, Text, Thumbnail } from "native-base";
import { FlatList, StyleSheet, TouchableHighlight, TouchableNativeFeedback, View } from "react-native";

import { ICoin, IUser } from "../models";
import { getCoins } from "../redux/actions/coins";
import { IRootState } from "../redux/store";

interface ICoinsListProps {
    coins: ICoin[];
    user: IUser;
    navigator: Navigator;
}

class PureCoinsList extends React.Component<ICoinsListProps> {
    public renderCoinList = (info: { item: ICoin, index: number }) => (
        <View style={styles.listItem}>
            <TouchableNativeFeedback onPress={this.handlePress.bind(this, info.index)} delayPressIn={0}>
                <View style={styles.listCoin}>
                    <View style={styles.listCoinLeft}>
                        <Thumbnail source={
                            { uri: `http://10.0.0.22:8000/icon/${info.item.symbol.toLocaleLowerCase()}.png` }
                        } />
                    </View>
                    <View style={styles.listCoinBody}>
                        <Text>{info.item.name}</Text>
                        <Text note={true}>$3.00</Text>
                    </View>
                    <View style={styles.listCoinRight}>
                        <Text note={true} style={styles.lisCoinRightText}>$3.00</Text>
                    </View>
                </View>
            </TouchableNativeFeedback>
        </View>
    )

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

    public handlePress = (coinID: number) => {
        this.props.navigator.showModal({
            animationType: "slide-up",
            // backButtonHidden: false,
            // backButtonTitle: undefined,
            passProps: { coinID },
            screen: "CoinMarketNews.CoinsPage",
        });
    }
    private keyExtractor = (item: ICoin) => item.id.toString();
}

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        user: state.user.user,
    };
};

const CoinsList = connect(mapStateToProps)(PureCoinsList);
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
    // tslint:disable-next-line:object-literal-sort-keys
    listCoin: {
        flex: 1,
        flexDirection: "row",
        paddingBottom: 10,
        paddingLeft: 20,
        paddingRight: 20,
        paddingTop: 10,

    },
    listCoinBody: {
        flex: 0.6,
    },
    listCoinLeft: {
        flex: 0.2,
    },
    listCoinRight: {
        flex: 0.2,
    },
    lisCoinRightText: {
        textAlign: "right",
    },
    listItem: {
        borderColor: "#d6d7da",
        borderWidth: 0.5,
    },
});
