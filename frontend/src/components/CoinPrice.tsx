import React from "react";
import Config from "react-native-config";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, StyleProvider, Text } from "native-base";
import { StyleSheet, View, WebView, ScrollView } from "react-native";
import getTheme from "../../native-base-theme/components"

import { ICoin, ICoinPrice } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsPageProps {
    coin: ICoin;
    coinPrice: ICoinPrice;
}

class PureCoinPrice extends React.Component<ICoinsPageProps> {

    public render() {
        // tslint:disable-next-line:max-line-length
        const priceWidget = "https://s.tradingview.com/widgetembed/?frameElementId=tradingview_fd207&symbol=BTCUSD&interval=D&symboledit=0&saveimage=0&toolbarbg=f1f3f6&studies=%5B%5D&theme=Dark&style=1&timezone=Etc%2FUTC&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_medium=widget&utm_campaign=chart&utm_term=BTCUSD";
        return (
            <ScrollView>
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
                        <Card style={{ height: 300 }}>
                            <WebView
                                source={{ uri: priceWidget.replace(/BTC/, this.props.coin.symbol) }}
                                style={{ height: 300 }}
                            />
                        </Card>
                    </Container>
                </StyleProvider>
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

const CoinPrice = connect(mapStateToProps)(PureCoinPrice);
export default CoinPrice;

const styles = StyleSheet.create({
});
