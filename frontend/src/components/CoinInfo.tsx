import React from "react";

import { Body, Card, CardItem, Icon, Right, StyleProvider, Text } from "native-base";
import { Linking, ScrollView, StyleSheet, View } from "react-native";

import getTheme from "../../native-base-theme/components"
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin } from "../models";

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
                    <Text style={this.styles.cardText}>What is {this.props.coin.name}?</Text>
                </CardItem>
                <CardItem style={this.styles.cardItem}>
                    <Body>
                        <Text style={this.styles.cardText} numberOfLines={this.state.numberOfLines} onPress={this.handleAboutPress}>{this.props.coin.about}</Text>
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
                linkType: "Website",
            },
        ];
        return links.map((link, index) => {
            if (link.link) {
                return (
                    <CardItem key={index} style={this.styles.cardItem}>
                        <Icon style={[this.styles.cardText, this.styles.linkIcon]} active={true} type="FontAwesome" name={link.linkIcon} />
                        <Text style={this.styles.cardText} >
                            {link.linkType}
                        </Text>
                        <Right>
                            <Text style={[this.styles.cardText, this.styles.link]} onPress={this.handleLinkPress.bind(this, link.link.link)}>
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
            <StyleProvider style={getTheme(commonColour)} >
                <ScrollView >
                    <View style={this.styles.infoBackground}>
                        {(this.props.coin.about) ? this.renderAboutCoin() : null}
                        {/* tslint:disable-next-line:jsx-no-multiline-js */}
                        {(this.props.coin.rank || this.props.coin.type || this.props.coin.algorithm || this.props.coin.proof || this.props.coin.mineable || this.props.coin.premined) ? (
                            <Card style={this.styles.Card}>
                                <CardItem header={true} bordered={true} style={this.styles.cardItem}>
                                    <Text>Information</Text>
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
                        {(this.props.coin.official_website || this.props.coin.medium || this.props.coin.telegram || this.props.coin.twitter || this.props.coin.reddit) ? (
                            <Card style={this.styles.Card}>
                                <CardItem header={true} bordered={true} style={this.styles.cardItem}>
                                    <Text>Links</Text>
                                </CardItem>
                                <CardItem style={this.styles.cardItem}>
                                    <Body style={this.styles.coinInfoStats}>
                                        {this.renderCoinLinks()}
                                    </Body>
                                </CardItem>
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
        this.setState({ numberOfLines: newNumberOfLines });
    }
}

const styleTemplate = (darkMode: boolean) => StyleSheet.create({
    bold: {
        fontWeight: 'bold',
    },
    Card: {
        borderColor: (darkMode) ? "#41444c" : "#F8F8F8",
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
    },
    linkIcon: {
        color: (darkMode) ? "#2a6496" : "#000",
    },
    link: {
        color: (darkMode) ? "#2a6496" : "#000",
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
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    infoBackground: {
        backgroundColor: (darkMode) ? "#2f343f" : "#E1E1E1",
        paddingBottom: 20,
    },
});


const styles = styleTemplate(false);
const darkStyles = styleTemplate(true)