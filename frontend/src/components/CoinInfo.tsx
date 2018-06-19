import React from "react";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, Icon, Right, Text } from "native-base";
import { ScrollView, StyleSheet, View } from "react-native";

import { ICoin } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsPageProps {
    coin: ICoin;
}

class PureCoinInfo extends React.Component<ICoinsPageProps> {

    public render() {
        return (
            <ScrollView>
                <Card>
                    <CardItem header={true} bordered={true}>
                        <Text>{this.props.coin.name}</Text>
                    </CardItem>
                    <CardItem>
                        <Body>
                            <Text>{this.props.coin.about}</Text>
                        </Body>
                    </CardItem>
                </Card>
                <Card>
                    <CardItem>
                        <Body style={styles.coinInfoStats}>
                            <View style={styles.coinInfoStatsLine}>
                                <Text style={styles.coinInfoStatsText}>
                                    Rank:
                                </Text>
                                <Text style={styles.coinInfoStatsText}>
                                    {this.props.coin.rank}
                                </Text>
                            </View>
                            <View style={styles.coinInfoStatsLine}>
                                <Text style={styles.coinInfoStatsText}>
                                    Type:
                                </Text>
                                <Text style={styles.coinInfoStatsText}>
                                    {this.props.coin.type}
                                </Text>
                            </View>
                            <View style={styles.coinInfoStatsLine}>
                                <Text style={styles.coinInfoStatsText}>
                                    Algorigthm:
                                </Text>
                                <Text style={styles.coinInfoStatsText}>
                                    {this.props.coin.algorithm}
                                </Text>
                            </View>
                            <View style={styles.coinInfoStatsLine}>
                                <Text style={styles.coinInfoStatsText}>
                                    Proof:
                                </Text>
                                <Text style={styles.coinInfoStatsText}>
                                    {this.props.coin.proof}
                                </Text>
                            </View>
                            <View style={styles.coinInfoStatsLine}>
                                <Text style={styles.coinInfoStatsText}>
                                    Mineable:
                                </Text>
                                <Text style={styles.coinInfoStatsText}>
                                    {(this.props.coin.mineable) ? "Yes" : "No"}
                                </Text>
                            </View>
                            <View style={styles.coinInfoStatsLine}>
                                <Text style={styles.coinInfoStatsText}>
                                    Premined:
                                </Text>
                                <Text style={styles.coinInfoStatsText}>
                                    {(this.props.coin.premined) ? "Yes" : "No"}
                                </Text>
                            </View>
                        </Body>
                    </CardItem>
                </Card>
                <Card>
                    <CardItem>
                        <Icon active={true} name="logo-googleplus" />
                        <Text>
                            Official Website:
                        </Text>
                        <Right>
                            <Text>
                                bitcoin.com
                            </Text>
                        </Right>
                    </CardItem>
                    <CardItem>
                        <Icon active={true} name="logo-googleplus" />
                        <Text>
                            Reddit:
                        </Text>
                        <Right>
                            <Text>
                                bitcoin.com
                            </Text>
                        </Right>
                    </CardItem>
                    <CardItem>
                        <Icon active={true} name="logo-googleplus" />
                        <Text>
                            Medium:
                        </Text>
                        <Right>
                            <Text>
                                bitcoin.com
                            </Text>
                        </Right>
                    </CardItem>
                    <CardItem>
                        <Icon active={true} name="logo-googleplus" />
                        <Text>
                            Twitter:
                        </Text>
                        <Right>
                            <Text>
                                bitcoin.com
                            </Text>
                        </Right>
                    </CardItem>
                    <CardItem>
                        <Icon active={true} name="logo-googleplus" />
                        <Text>
                            Telegram:
                        </Text>
                        <Right>
                            <Text>
                                bitcoin.com
                            </Text>
                        </Right>
                    </CardItem>
                </Card>
            </ScrollView>
        );
    }
}

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        user: state.user.user,
    };
};

const CoinInfo = connect(mapStateToProps)(PureCoinInfo);
export default CoinInfo;

const styles = StyleSheet.create({
    coinInfoStats: {
        flex: 1,
    },
    coinInfoStatsLine: {
        flex: 1,
        flexDirection: "row",
        justifyContent: "space-between",
    },
    coinInfoStatsText: {
        flex: 1,
    },
});
