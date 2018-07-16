import React from "react";
import { connect } from "react-redux";

import { Card, CardItem, StyleProvider, Text } from "native-base";
import { Dimensions, ScrollView, StyleSheet, View, WebView } from "react-native";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin, ICoinPrice, ISettings } from "../models";
import { IRootState } from "../redux/store";
import styles from "../styles/CoinPriceStyles";

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
        CAD: "$",
        EUR: "€",
        GBP: "£",
        HKD: "$",
        USD: "$",
    };
    public stats: ICoinStats[] = [
        {
            stat: `${this.currencySymbols[this.props.appSettings.fiatCurrency]} ${this.props.coinPrice.price_fiat.price.toFixed(2)}`,
            statType: `Price in ${this.props.appSettings.fiatCurrency}`,
            style: [styles(this.props.darkMode).coinInfoStatsText,]
        },
        {
            stat: `${this.props.coinPrice.price_fiat.percent_change_1h}%`,
            statType: `1 hour change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_fiat.percent_change_1h >= 0) ? "green" : "red" }],
        },
        {
            stat: `${this.props.coinPrice.price_fiat.percent_change_24h}%`,
            statType: `1 day change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_fiat.percent_change_24h >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_fiat.percent_change_7d}%`,
            statType: `1 week change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_fiat.percent_change_7d >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_crypto.price}`,
            statType: `Price in ${this.props.appSettings.cryptoCurrency}`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { fontFamily: "Font Awesome 5 Brands" },]
        },
        {
            stat: `${this.props.coinPrice.price_crypto.percent_change_1h}%`,
            statType: `1 hour change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_crypto.percent_change_1h >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_crypto.percent_change_24h}%`,
            statType: `1 day change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_crypto.percent_change_24h >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.props.coinPrice.price_crypto.percent_change_7d}%`,
            statType: `1 week change`,
            style: [styles(this.props.darkMode).coinInfoStatsText, { color: (this.props.coinPrice.price_crypto.percent_change_7d >= 0) ? "green" : "red" }]
        },
        {
            stat: `${this.currencySymbols[this.props.appSettings.fiatCurrency]} ${this.props.coinPrice.price_fiat.market_cap}`,
            statType: `Market Cap`,
            style: [styles(this.props.darkMode).coinInfoStatsText]
        },
        {
            stat: `${this.currencySymbols[this.props.appSettings.fiatCurrency]} ${this.props.coinPrice.price_fiat.volume_24h.toFixed(0)}`,
            statType: `Volume (24h)`,
            style: [styles(this.props.darkMode).coinInfoStatsText]
        }
    ];

    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <ScrollView style={styles(this.props.darkMode).price}>
                    <View>
                        <Card style={styles(this.props.darkMode).priceWidgetCard}>
                            <WebView
                                source={{ uri: this.props.priceWidget }}
                                style={styles(this.props.darkMode).webView}
                            />
                        </Card>
                        <Card style={styles(this.props.darkMode).card}>
                            <CardItem bordered={true} style={styles(this.props.darkMode).cardItem} header={true}>
                                <Text>Price details</Text>
                            </CardItem>
                            <CardItem style={styles(this.props.darkMode).cardItem}>
                                <View style={styles(this.props.darkMode).coinInfoStats}>
                                    {/*tslint:disable-next-line:jsx-no-multiline-js*/}
                                    {this.stats.map((stat, index) => {
                                        if (stat.stat && !(this.props.coin.symbol === 'BTC' && index > 3 && index < 8)) {
                                            return (
                                                <View key={index} style={{ flex: 1, flexDirection: "row", justifyContent: "space-between" }}>
                                                    <Text style={[styles(this.props.darkMode).coinInfoStatsText, (index === 1 || index === 2 || index === 3 || index === 5 || index === 6 || index === 7) ? styles(this.props.darkMode).coinInfoStatsTextRight : null]} >
                                                        {stat.statType}
                                                    </Text>
                                                    {/*tslint:disable-next-line:jsx-no-multiline-js*/}
                                                    {(index === 4) ? (
                                                        (this.props.appSettings.cryptoCurrency === "BTC") ? (
                                                            <Text style={stat.style}> &#xf15a; {stat.stat}</Text>
                                                        ) : (
                                                                <Text style={stat.style}> &#xf42e; {stat.stat}</Text>
                                                            )
                                                    ) : (
                                                            <Text style={stat.style}>{stat.stat}</Text>
                                                        )}
                                                </View>
                                            )
                                        } else {
                                            return null
                                        }
                                    })}
                                </View>
                            </CardItem>
                        </Card>
                    </View>
                </ScrollView>
            </StyleProvider >
        );
    }
}

const mapStateToProps = (state: IRootState) => {
    return {
        appSettings: state.settings.settings,
        coins: state.coins.coins,
        user: state.user.user,
    };
};

const CoinPrice = connect(mapStateToProps)(PureCoinPrice);
export default CoinPrice;
