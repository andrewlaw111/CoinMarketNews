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

class PureCoinPrice extends React.Component<ICoinPriceProps> {

    public renderCoinPrice() {
        return <Text>TEST</Text>
        // interface ICoinStats {
        //     statType: string;
        //     stat?: string | number;
        // }
        // const stats: ICoinStats[] = [
        //     {
        //         stat: this.props.coinPrice.price_fiat.price,
        //         statType: `Price in ${this.props.appSettings.fiatCurrency}`,
        //     },
        //     {
        //         stat: this.props.coinPrice.price_crypto.price,
        //         statType: `Price in ${this.props.appSettings.cryptoCurrency}`,
        //     },
        //     {
        //         stat: this.props.coinPrice.price_fiat.percent_change_1h,
        //         statType: `${this.props.appSettings.fiatCurrency} 1 hour percentage change`,
        //     },
        //     {
        //         stat: this.props.coinPrice.price_fiat.percent_change_24h,
        //         statType: `${this.props.appSettings.fiatCurrency} 24 hour percentage change`,
        //     },
        //     {
        //         stat: this.props.coinPrice.price_fiat.percent_change_7d,
        //         statType: `${this.props.appSettings.fiatCurrency} 7 day percentage change`,
        //     },
        //     {
        //         stat: this.props.coinPrice.price_crypto.percent_change_1h,
        //         statType: `${this.props.appSettings.cryptoCurrency} 1 hour percentage change`,
        //     },
        //     {
        //         stat: this.props.coinPrice.price_crypto.percent_change_24h,
        //         statType: `${this.props.appSettings.cryptoCurrency} 24 hour percentage change`,
        //     },
        //     {
        //         stat: this.props.coinPrice.price_crypto.percent_change_7d,
        //         statType: `${this.props.appSettings.cryptoCurrency} 7 day percentage change`,
        //     },
        //     {
        //         stat: this.props.coinPrice.price_fiat.market_cap,
        //         statType: `${this.props.appSettings.fiatCurrency} market capitalization`,
        //     },
        //     {
        //         stat: this.props.coinPrice.price_fiat.volume_24h,
        //         statType: `${this.props.appSettings.fiatCurrency} 24 hour volume`,
        //     }
        // ];
        // stats.map((stat, index) => {
        //     if (stat.stat) {
        //         return (
        //             <View key={index} style={styles(this.props.darkMode).coinInfoStatsLine}>
        //                 <Text style={styles(this.props.darkMode).coinInfoStatsText}>
        //                     {stat.statType}
        //                 </Text>
        //                 <Text style={styles(this.props.darkMode).coinInfoStatsText}>
        //                     {stat.stat}
        //                 </Text>
        //             </View>

        //         );
        //     } else {
        //         return null
        //     }
        // });
    }
    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <ScrollView style={styles(this.props.darkMode).price}>
                    <Container>
                        <Card style={styles(this.props.darkMode).card}>
                            <CardItem style={styles(this.props.darkMode).cardItem} header={true}>
                                <Text style={styles(this.props.darkMode).cardText}>Price</Text>
                            </CardItem>
                            <CardItem style={styles(this.props.darkMode).cardItem}>
                                <Body>
                                    {this.renderCoinPrice()}
                                </Body>
                            </CardItem>
                        </Card>
                        <Card style={styles(this.props.darkMode).card}>
                            <WebView
                                source={{ uri: this.props.priceWidget }}
                                style={styles(this.props.darkMode).webView}
                            />
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

const styles = (darkMode: boolean) => StyleSheet.create({
    bold: {
        fontWeight: 'bold',
    },
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
        color: (darkMode) ? "#F8F8F8" : "#000",
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