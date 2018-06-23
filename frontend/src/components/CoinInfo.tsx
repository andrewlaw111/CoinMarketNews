import React from "react";

import { Body, Card, CardItem, Icon, Right, StyleProvider, Text } from "native-base";
import { Linking, ScrollView, StyleSheet, View } from "react-native";
import getTheme from "../../native-base-theme/components"

import { ICoin } from "../models";

interface ICoinsPageProps {
    coin: ICoin;
}

export default class CoinInfo extends React.Component<ICoinsPageProps> {
    public renderAboutCoin() {
        return (
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
                    <View key={index} style={styles.coinInfoStatsLine}>
                        <Text style={styles.coinInfoStatsText}>
                            {stat.statType}:
                        </Text>
                        <Text style={styles.coinInfoStatsText}>
                            {stat.stat}
                        </Text>
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
            link?: { id: number, link: string, name: string };
        }
        const links: ILinks[] = [
            {
                link: this.props.coin.medium,
                linkIcon: "medium",
                linkType: "Medium",
            },
            {
                link: this.props.coin.reddit,
                linkIcon: "reddit",
                linkType: "Reddit",
            },
            {
                link: this.props.coin.telegram,
                linkIcon: "telegram",
                linkType: "Telegram",
            },
            {
                link: this.props.coin.twitter,
                linkIcon: "twitter",
                linkType: "Twitter",
            },
            {
                link: this.props.coin.official_website,
                linkIcon: "link",
                linkType: "Official Website",
            },
        ];
        return links.map((link, index) => {
            if (link.link) {
                return (
                    <CardItem key={index}>
                        <Icon active={true} type="FontAwesome" name={link.linkIcon} />
                        <Text>
                            {link.linkType}:
                        </Text>
                        <Right>
                            <Text onPress={this.handleLinkPress.bind(this, link.link.link)}>
                                {link.link.name}
                            </Text>
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
            <ScrollView>
                <StyleProvider style={getTheme()} >
                    <View>
                        {(this.props.coin.about) ? this.renderAboutCoin() : null}
                        {(this.props.coin.rank || this.props.coin.type || this.props.coin.algorithm || this.props.coin.proof || this.props.coin.mineable || this.props.coin.premined) ? (
                            < Card >
                                <CardItem>
                                    <Body style={styles.coinInfoStats}>
                                        {this.renderCoinStats()}
                                    </Body>
                                </CardItem>
                            </Card>
                        ) : (
                                null
                            )}
                        {(this.props.coin.official_website || this.props.coin.medium || this.props.coin.telegram || this.props.coin.twitter || this.props.coin.reddit) ? (
                            < Card >
                                {this.renderCoinLinks()}
                            </Card>
                        ) : (
                                null
                            )}
                    </View>
                </StyleProvider>
            </ScrollView>
        );
    }
    private handleLinkPress = (link: string) => {
        Linking.openURL(link);
    }
}

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
