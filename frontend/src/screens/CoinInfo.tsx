import React from "react";
import Config from "react-native-config";

import { Body, Card, CardItem, Icon, Right, StyleProvider, Text } from "native-base";
import { LayoutAnimation, Linking, Platform, ScrollView, StyleSheet, UIManager, View } from "react-native";

import getTheme from "../../native-base-theme/components";
import commonColour from "../../native-base-theme/variables/commonColor";

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

    public renderAboutCoin() {
        return (
            <Card style={this.styles(this.props.darkMode).Card}>
                <CardItem header={true} bordered={true} style={this.styles(this.props.darkMode).cardItem}>
                    <Text style={this.styles(this.props.darkMode).cardHeader}>What is {this.props.coin.name}?</Text>
                </CardItem>
                <CardItem style={this.styles(this.props.darkMode).cardItem}>
                    <View>
                        <Text
                            style={this.styles(this.props.darkMode).cardText}
                            numberOfLines={this.state.numberOfLines}
                            onPress={this.handleAboutPress}
                        >
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
                    <View key={index} style={this.styles(this.props.darkMode).coinInfoStatsLine}>
                        <Text style={this.styles(this.props.darkMode).coinInfoStatsText}>
                            {stat.statType}
                        </Text>
                        {(stat.statType === "Rank") ?
                            <Text
                                style={[
                                    this.styles(this.props.darkMode).bold,
                                    this.styles(this.props.darkMode).coinInfoStatsText,
                                ]}
                            >
                                #{stat.stat}
                            </Text>
                            :
                            <Text style={this.styles(this.props.darkMode).coinInfoStatsText}>
                                {stat.stat}
                            </Text>}
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
                linkIcon: (this.props.darkMode) ? "whitepaper_white" : "whitepaper",
                linkType: "Whitepaper",
                name: "Whitepaper",
            },
            {
                link: this.props.coin.website_link,
                linkIcon: (this.props.darkMode) ? "website_white" : "website",
                linkType: "Website",
                name: this.props.coin.website_name,
            },
            {
                link: this.props.coin.twitter_link,
                linkIcon: "twitter",
                linkType: "Twitter",
                name: this.props.coin.twitter_name,
            },
            {
                link: this.props.coin.medium_link,
                linkIcon: "medium",
                linkType: "Medium",
                name: this.props.coin.medium_name,
            },
            {
                link: this.props.coin.reddit_link,
                linkIcon: "reddit",
                linkType: "Reddit",
                name: this.props.coin.reddit_name,
            },
            {
                link: this.props.coin.telegram_link,
                linkIcon: "telegram",
                linkType: "Telegram",
                name: this.props.coin.telegram_name,
            },
        ];
        return links.map((link, index) => {
            if (link.link && link.link !== "n/a") {
                return (
                    <CardItem
                        key={index}
                        button={true}
                        style={this.styles(this.props.darkMode).Card}
                        onPress={this.handleLinkPress.bind(this, link.link)}
                    >
                        <FastImage
                            style={this.styles(this.props.darkMode).linkIcon}
                            source={{ uri: `${Config.API_SERVER}/media-icons/${link.linkIcon}.png` }}
                            resizeMode={FastImage.resizeMode.contain}
                        />
                        <Text style={[
                            this.styles(this.props.darkMode).cardText,
                            this.styles(this.props.darkMode).link,
                        ]}
                        >
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
                <ScrollView style={this.styles(this.props.darkMode).infoBackground} >
                    <View style={{ paddingBottom: 20 }}>
                        {(this.props.coin.about) ? this.renderAboutCoin() : null}
                        {/* tslint:disable-next-line:jsx-no-multiline-js */}
                        {(this.props.coin.rank ||
                            this.props.coin.type ||
                            this.props.coin.algorithm ||
                            this.props.coin.proof ||
                            this.props.coin.mineable ||
                            this.props.coin.premined) ? (
                                <Card style={this.styles(this.props.darkMode).Card}>
                                    <CardItem
                                        header={true}
                                        bordered={true}
                                        style={this.styles(this.props.darkMode).cardItem}
                                    >
                                        <Text style={this.styles(this.props.darkMode).cardHeader}>Information</Text>
                                    </CardItem>
                                    <CardItem style={this.styles(this.props.darkMode).cardItem}>
                                        <Body style={this.styles(this.props.darkMode).coinInfoStats}>
                                            {this.renderCoinStats()}
                                        </Body>
                                    </CardItem>
                                </Card>
                            ) : (
                                null
                            )}
                        {/* tslint:disable-next-line:jsx-no-multiline-js */}
                        {(this.props.coin.website_link ||
                            this.props.coin.medium_link ||
                            this.props.coin.telegram_link ||
                            this.props.coin.twitter_link ||
                            this.props.coin.reddit_link) ? (
                                <Card style={this.styles(this.props.darkMode).Card}>
                                    <CardItem
                                        header={true}
                                        bordered={true}
                                        style={this.styles(this.props.darkMode).cardItem}
                                    >
                                        <Text style={this.styles(this.props.darkMode).cardHeader}>
                                            Links
                                        </Text>
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
            // tslint:disable-next-line:no-unused-expression
            UIManager.setLayoutAnimationEnabledExperimental && UIManager.setLayoutAnimationEnabledExperimental(true);
        }

        LayoutAnimation.configureNext(LayoutAnimation.Presets.spring);

        this.setState({
            numberOfLines: newNumberOfLines,
        });
    }
}

const styles = (darkMode: boolean) => StyleSheet.create({
    Card: {
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
    },
    bold: {
        fontWeight: "bold",
    },
    cardHeader: {
        color: "#007aff",
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
        marginBottom: 7,
    },
    coinInfoStatsText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
        flex: 1,
    },
    infoBackground: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        paddingBottom: 20,
    },
    link: {
        color: (darkMode) ? "#fff" : "#000",
        marginLeft: 10,
    },
    linkIcon: {
        height: 28,
        width: 28,
    },
});
