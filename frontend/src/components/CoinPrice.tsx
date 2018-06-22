import React from "react";
import Config from "react-native-config";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, StyleProvider, Text } from "native-base";
import { StyleSheet, View, WebView } from "react-native";
import getTheme from "../../native-base-theme/components"

import { ICoin, ICoinPrice } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsPageProps {
    coin: ICoin;
    coinPrice: ICoinPrice;
}

class PureCoinPrice extends React.Component<ICoinsPageProps> {

    public render() {
        return (
            <StyleProvider style={getTheme()} >
                <Container>
                    <Card>
                        <CardItem header={true}>
                            <Text>Price</Text>
                        </CardItem>
                        <CardItem>
                            <Body>
                                <Text>
                                    {this.props.coinPrice.price_fiat.price}
                                </Text>
                                <Text>
                                    {this.props.coinPrice.price_fiat.percent_change_24h}
                                </Text>
                                <Text>
                                    {this.props.coinPrice.price_fiat.price
                                        / (100 + this.props.coinPrice.price_fiat.percent_change_24h)}
                                </Text>
                            </Body>
                        </CardItem>
                    </Card>
                    <View style={{ height: 300 }}>
                        <WebView
                            source={{ uri: `${Config.API_SERVER}/chart/${this.props.coin.symbol}` }}
                            style={{ height: 300 }}
                        />
                    </View>
                    <Card>
                        <CardItem header={true}>
                            <Text>Market Data</Text>
                        </CardItem>
                        <CardItem>
                            <Body>
                                <Text>
                                    Market Capitalization
                            </Text>
                                <Text>
                                    {this.props.coinPrice.price_fiat.market_cap}
                                </Text>
                                <Text>
                                    24 Hour Volume
                            </Text>
                                <Text>
                                    {this.props.coinPrice.price_fiat.volume_24h}
                                </Text>
                                {/* <Text>
                                Circulating Supply
                            </Text>
                            <Text>
                                {this.props.coinPrice.price_fiat.}
                            </Text> */}
                            </Body>
                        </CardItem>
                    </Card>
                    <Card>
                        <CardItem header={true}>
                            <Text>NativeBase</Text>
                        </CardItem>
                        <CardItem>
                            <Body>
                                <Text>
                                    Your text here
                                    </Text>
                            </Body>
                        </CardItem>
                    </Card>
                </Container>
            </StyleProvider>
        );
    }
}

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        user: state.user.user,
    };
};

const CoinPrice = connect(mapStateToProps)(PureCoinPrice);
export default CoinPrice;

const styles = StyleSheet.create({
});
