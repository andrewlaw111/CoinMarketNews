import React from "react";
import Config from "react-native-config";

import { Body, Card, CardItem, Icon, Right, StyleProvider, Text, Container } from "native-base";
import { Linking, ScrollView, StyleSheet, View, LayoutAnimation, Platform, UIManager } from "react-native";

import getTheme from "../../native-base-theme/components"
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin } from "../models";

import FastImage from "react-native-fast-image";

interface ICoinsPageProps {
    coin: ICoin;
    darkMode: boolean;
}

interface ICoinsPageStates {
    numberOfLines: number;
}

export default class CoinInfo extends React.Component<ICoinsPageProps, ICoinsPageStates> {
    public styles: typeof styles;

    constructor(props: ICoinsPageProps) {
        super(props);
        this.state = {
            numberOfLines: 8,
        };
    }

    public componentWillMount() {
        this.styles = (this.props.darkMode) ? darkStyles : styles;
    }
    public componentWillReceiveProps(nextProps: ICoinsPageProps) {
        this.styles = (this.props.darkMode) ? darkStyles : styles;
    }

    public renderAboutCoin() {
        return (
            <Card style={this.styles.Card}>
                <CardItem header={true} bordered={true} style={this.styles.cardItem}>
                    <Text style={this.styles.cardHeader}>What is {this.props.coin.name}?</Text>
                </CardItem>
                <CardItem style={this.styles.cardItem}>
                    <View>
                        <Text style={this.styles.cardText} numberOfLines={this.state.numberOfLines} onPress={this.handleAboutPress}>
                            {this.props.coin.about}
                        </Text>
                    </View>
                </CardItem>
            </Card>
        );
    }
    public renderCoinStats() {
        interface ICoinStats {
            statType: string;
            stat?: string | number;
        }
        const stats: ICoinStats[] = [
            {
                stat: this.props.coin.rank,
                statType: "Rank",
            },
            {
                stat: this.props.coin.type,
                statType: "Type",
            },
            {
                stat: this.props.coin.algorithm,
                statType: "Algorithm",
            },
            {
                stat: this.props.coin.proof,
                statType: "Proof",
            },
            {
                stat: (this.props.coin.mineable === null) ? undefined : (this.props.coin.mineable) ? "Yes" : "No",
                statType: "Mineable",
            },
            {
                stat: (this.props.coin.premined === null) ? undefined : (this.props.coin.premined) ? "Yes" : "No",
                statType: "Premined",
            },
        ];
        return stats.map((stat, index) => {
            if (stat.stat) {
                return (
                    <View key={index} style={this.styles.coinInfoStatsLine}>
                        <Text style={this.styles.coinInfoStatsText}>
                            {stat.statType}
                        </Text>
                        {(stat.statType == 'Rank') ? <Text style={[this.styles.bold, this.styles.coinInfoStatsText]}>#{stat.stat}</Text> : <Text style={this.styles.coinInfoStatsText}>{stat.stat}</Text>}
                    </View>
                );
            } else {
                return null;
            }
        });
    }

    public renderCoinLinks() {
        interface ILinks {
            linkIcon: string;
            linkType: string;
            link?: string;
            name?: string;
        }
        const links: ILinks[] = [
            {
                link: this.props.coin.whitepaper_link,
                name: 'Whitepaper',
                linkIcon: (this.props.darkMode) ? "website_white" : "website",
                linkType: "Whitepaper",
            },
            {
                link: this.props.coin.website_link,
                name: this.props.coin.website_name,
                linkIcon: (this.props.darkMode) ? "website_white" : "website",
                linkType: "Website",
            },
            {
                link: this.props.coin.twitter_link,
                name: this.props.coin.twitter_name,
                linkIcon: "twitter",
                linkType: "Twitter",
            },
            {
                link: this.props.coin.medium_link,
                name: this.props.coin.medium_name,
                linkIcon: "medium",
                linkType: "Medium",
            },
            {
                link: this.props.coin.reddit_link,
                name: this.props.coin.reddit_name,
                linkIcon: "reddit",
                linkType: "Reddit",
            },
            {
                link: this.props.coin.telegram_link,
                name: this.props.coin.telegram_name,
                linkIcon: "telegram",
                linkType: "Telegram",
            }

        ];
        return links.map((link, index) => {
            if (link.link && link.link != 'n/a') {
                return (
                    <CardItem key={index} button={true} style={this.styles.Card} onPress={this.handleLinkPress.bind(this, link.link)}>
                        <FastImage
                            style={this.styles.linkIcon}
                            source={{ uri: `${Config.API_SERVER}/media-icons/${link.linkIcon}.png` }}
                            resizeMode={FastImage.resizeMode.contain}
                        />
                        <Text style={[this.styles.cardText, this.styles.link]}>
                            {link.name}
                        </Text>
                        <Right style={{ flex: 1 }}>
                            <Icon name="arrow-forward" />
                        </Right>
                    </CardItem>
                );
            } else {
                return null;
            }
        });
    }

    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <ScrollView style={this.styles.infoBackground} >
                    <View style={{ paddingBottom: 20 }}>
                        {(this.props.coin.about) ? this.renderAboutCoin() : null}
                        {/* tslint:disable-next-line:jsx-no-multiline-js */}
                        {(this.props.coin.rank || this.props.coin.type || this.props.coin.algorithm || this.props.coin.proof || this.props.coin.mineable || this.props.coin.premined) ? (
                            <Card style={this.styles.Card}>
                                <CardItem header={true} bordered={true} style={this.styles.cardItem}>
                                    <Text style={this.styles.cardHeader}>Information</Text>
                                </CardItem>
                                <CardItem style={this.styles.cardItem}>
                                    <Body style={styles.coinInfoStats}>
                                        {this.renderCoinStats()}
                                    </Body>
                                </CardItem>
                            </Card>
                        ) : (
                                null
                            )}
                        {/* tslint:disable-next-line:jsx-no-multiline-js */}
                        {(this.props.coin.website_link || this.props.coin.medium_link || this.props.coin.telegram_link || this.props.coin.twitter_link || this.props.coin.reddit_link) ? (
                            <Card style={this.styles.Card}>
                                <CardItem header={true} bordered={true} style={this.styles.cardItem}>
                                    <Text style={this.styles.cardHeader}>Links</Text>
                                </CardItem>
                                {this.renderCoinLinks()}
                            </Card>
                        ) : (
                                null
                            )}
                    </View>
                </ScrollView>
            </StyleProvider>
        );
    }
    private handleLinkPress = (link: string) => {
        Linking.openURL(link);
    }
    private handleAboutPress = () => {
        const newNumberOfLines = (this.state.numberOfLines === null) ? 8 : null;
        if (Platform.OS === "android") {
            UIManager.setLayoutAnimationEnabledExperimental && UIManager.setLayoutAnimationEnabledExperimental(true);
        }

        LayoutAnimation.configureNext(LayoutAnimation.Presets.spring);

        this.setState({
            numberOfLines: newNumberOfLines
        });
    }
}

const styleTemplate = (darkMode: boolean) => StyleSheet.create({
    bold: {
        fontWeight: 'bold',
    },
    Card: {
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
    },
    linkIcon: {
        width: 28,
        height: 28,
    },
    link: {
        color: (darkMode) ? "#fff" : "#000",
        marginLeft: 10,
    },
    cardText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    cardHeader: {
        color: "#007aff",
    },
    coinInfoStats: {
        flex: 1,
    },
    coinInfoStatsLine: {
        flex: 1,
        flexDirection: "row",
        justifyContent: "space-between",
        marginBottom: 7,
    },
    coinInfoStatsText: {
        flex: 1,
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    infoBackground: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        paddingBottom: 20,
    },
});


const styles = styleTemplate(false);
const darkStyles = styleTemplate(true)