import React from "react";
import Config from "react-native-config";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, StyleProvider, Text } from "native-base";
import { ScrollView, StyleSheet, View, WebView } from "react-native";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin, ICoinPrice } from "../models";
import { IRootState } from "../redux/store";

interface ICoinPriceProps {
    coin: ICoin;
    coinPrice: ICoinPrice;
    darkMode: boolean;
    priceWidget: string;
}

class PureCoinPrice extends React.Component<ICoinPriceProps> {
    public styles: typeof styles;

    public componentWillMount() {
        this.styles = (this.props.darkMode) ? darkStyles : styles;
    }
    public componentWillReceiveProps(nextProps: ICoinPriceProps) {
        this.styles = (this.props.darkMode) ? darkStyles : styles;
    }
    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <ScrollView style={this.styles.price}>
                    <Container>
                        <Card style={this.styles.card}>
                            <CardItem style={this.styles.cardItem} header={true}>
                                <Text style={this.styles.cardText}>Price</Text>
                            </CardItem>
                            <CardItem style={this.styles.cardItem}>
                                <Body>
                                    <Text style={this.styles.cardText}>
                                        {this.props.coinPrice.price_fiat.price}
                                    </Text>
                                    <Text style={this.styles.cardText}>
                                        {this.props.coinPrice.price_fiat.percent_change_24h}
                                    </Text>
                                    <Text style={this.styles.cardText}>
                                        {this.props.coinPrice.price_fiat.price / (100 + this.props.coinPrice.price_fiat.percent_change_24h)}
                                    </Text>
                                </Body>
                            </CardItem>
                        </Card>
                        <Card style={this.styles.card}>
                            <WebView
                                source={{ uri: this.props.priceWidget }}
                                style={this.styles.webView}
                            />
                        </Card>
                        <Card style={this.styles.cardMarketData}>
                            <CardItem style={this.styles.cardItem} header={true}>
                                <Text style={this.styles.cardText}>Market Data</Text>
                            </CardItem>
                            <CardItem style={this.styles.cardItem}>
                                <Body>
                                    <Text style={this.styles.cardText}>
                                        Market Capitalization
                                    </Text>
                                    <Text style={this.styles.cardText}>
                                        {this.props.coinPrice.price_fiat.market_cap}
                                    </Text>
                                    <Text style={this.styles.cardText}>
                                        24 Hour Volume
                                    </Text>
                                    <Text style={this.styles.cardText}>
                                        {this.props.coinPrice.price_fiat.volume_24h}
                                    </Text>
                                </Body>
                            </CardItem>
                        </Card>
                    </Container>
                </ScrollView>
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

const styleTemplate = (darkMode: boolean) => StyleSheet.create({
    card: {
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
    },
    cardMarketData: {
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
        marginBottom: 20,
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
    },
    cardText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
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
    price: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        flex: 1,
    },
    webView: {
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        height: 300,
    },
})

const styles = styleTemplate(false);
const darkStyles = styleTemplate(true);