import React from "react";
import Config from "react-native-config";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, StyleProvider, Text } from "native-base";
import { ScrollView, StyleSheet, View, WebView } from "react-native";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin, ICoinPrice, ISettings } from "../models";
import { IRootState } from "../redux/store";

interface ICoinPriceProps {
    appSettings: ISettings;
    coin: ICoin;
    coinPrice: ICoinPrice;
    darkMode: boolean;
    priceWidget: string;
}
interface ICoinStats {
    statType: string;
    stat?: string | number;
    style: any[];
}

class PureCoinPrice extends React.Component<ICoinPriceProps> {

    public currencySymbols: { [key: string]: string } = {
        USD: "$",
        EUR: "€",
        CAD: "$",
        GBP: "£",
        HKD: "$",
        // BTC: "&#xf15a",
        // ETH: "&#xf42e",
    }
    public stats: ICoinStats[] = [
        {
            stat: `${this.currencySymbols[this.props.appSettings.fiatCurrency]} ${this.props.coinPrice.price_fiat.price.toFixed(2)}`,
            statType: `Price in ${this.props.appSettings.fiatCurrency}`,
            style: [styles(this.props.darkMode).coinInfoStatsText,]
        },
        {
            stat: `${this.props.coinPrice.price_crypto.price.toFixed(8)}`,
            statType: `Price in ${this.props.appSettings.cryptoCurrency}`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { fontFamily: "Font Awesome 5 Brands" }, ]
        },
        {
            stat: `${this.props.coinPrice.price_fiat.percent_change_1h}%`,
            statType: `${this.props.appSettings.fiatCurrency} 1 hour % change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_fiat.percent_change_1h >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_crypto.percent_change_1h}%`,
            statType: `${this.props.appSettings.cryptoCurrency} 1 hour % change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_crypto.percent_change_1h >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_fiat.percent_change_24h}%`,
            statType: `${this.props.appSettings.fiatCurrency} 24 hour % change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_fiat.percent_change_24h >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_crypto.percent_change_24h}%`,
            statType: `${this.props.appSettings.cryptoCurrency} 24 hour % change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_crypto.percent_change_24h >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_fiat.percent_change_7d}%`,
            statType: `${this.props.appSettings.fiatCurrency} 7 day % change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_fiat.percent_change_7d >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_crypto.percent_change_7d}%`,
            statType: `${this.props.appSettings.cryptoCurrency} 7 day % change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_crypto.percent_change_7d >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.currencySymbols[this.props.appSettings.fiatCurrency]} ${this.props.coinPrice.price_fiat.market_cap}`,
            statType: `${this.props.appSettings.fiatCurrency} market capitalization`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_fiat.market_cap >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_fiat.volume_24h.toFixed(2)}`,
            statType: `${this.props.appSettings.fiatCurrency} 24 hour volume`,
        }
    ];

    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <ScrollView style={styles(this.props.darkMode).price}>
                    <View>
                        <Card style={styles(this.props.darkMode).card}>
                            <CardItem bordered={true} style={styles(this.props.darkMode).cardItem} header={true}>
                                <Text style={styles(this.props.darkMode).cardText}>Price</Text>
                            </CardItem>
                            <CardItem style={styles(this.props.darkMode).cardItem}>
                                <View style={styles(this.props.darkMode).coinInfoStats}>
                                    {/*tslint:disable-next-line:jsx-no-multiline-js*/}
                                    {this.stats.map((stat, index) => {
                                        return (
                                            <View key={index} style={{ flex: 1, flexDirection: "row", justifyContent: "space-between" }}>
                                                <Text style={styles(this.props.darkMode).coinInfoStatsText} >
                                                    {stat.statType}
                                                </Text>
                                                {/*tslint:disable-next-line:jsx-no-multiline-js*/}
                                                {(index === 1) ? (
                                                    (this.props.appSettings.cryptoCurrency === "BTC") ? (
                                                        <Text style={stat.style}> &#xf15a;{stat.stat}</Text>
                                                    ) : (
                                                            <Text style={stat.style}> &#xf42e;{stat.stat}</Text>
                                                        )
                                                ) : (
                                                        <Text style={stat.style}> {stat.stat}</Text>
                                                    )}
                                            </View>
                                        )
                                    })}
                                </View>
                            </CardItem>
                        </Card>
                        <Card style={styles(this.props.darkMode).priceWidgetCard}>
                            <WebView
                                source={{ uri: this.props.priceWidget }}
                                style={styles(this.props.darkMode).webView}
                            />
                        </Card>
                    </View>
                </ScrollView>
            </StyleProvider >
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

const styles = (darkMode: boolean) => StyleSheet.create({
    bold: {
        fontWeight: 'bold',
    },
    card: {
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
        flex: 0.4
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
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    price: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        flex: 1,
    },
    priceWidgetCard: {
        flex: 0.4,
    },
    webView: {
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        height: 300,
    },
})