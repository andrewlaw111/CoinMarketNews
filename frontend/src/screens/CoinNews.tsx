import axios from "axios";
import React from "react";
import Moment from "react-moment";
import Config from "react-native-config";

import { Body, Card, CardItem, Container, Icon, StyleProvider, Text } from "native-base";
import { FlatList, Linking, StyleSheet, TouchableOpacity, View } from "react-native";

import getTheme from "../../native-base-theme/components";
import commonColour from "../../native-base-theme/variables/commonColor";

import FastImage from "react-native-fast-image";
import { Navigator } from "react-native-navigation";
import { ICoin, ICoinPrice, INews, ISettings } from "../models";
import styles from "../styles/CoinNewsStyles";

interface ICoinsNewsProps {
    appSettings: ISettings;
    coin: ICoin;
    coins: ICoinPrice[];
    darkMode: boolean;
    favourites: number[];
    navigator: Navigator;
}
interface ICoinsNewsState {
    news: INews[];
    noNews: boolean;
}

export default class CoinNews extends React.Component<ICoinsNewsProps, ICoinsNewsState> {
    public styles: typeof styles;

    constructor(props: ICoinsNewsProps) {
        super(props);
        this.state = {
            news: [],
            noNews: false,
        };
    }
    public componentDidMount() {
        this.getNews();
    }

    public renderNewsList = (info: { item: INews, index: number }) => (
        <View>
            <Card style={styles(this.props.darkMode).card}>
                <TouchableOpacity
                    onPress={this.handleLinkPress.bind(this, info.item.link)}
                >
                    <CardItem header={true} bordered={true} style={styles(this.props.darkMode).cardItem}>
                        <FastImage
                            style={styles(this.props.darkMode).newsSourceIcon}
                            source={{ uri: `${Config.API_SERVER}/source-icons/${info.item.source_id}.png` }}
                            resizeMode={FastImage.resizeMode.contain}
                        />
                        <Text
                            style={styles(this.props.darkMode).headingText}
                        >
                            {info.item.title}
                        </Text>
                    </CardItem>
                    <CardItem bordered={true} style={styles(this.props.darkMode).cardItem}>
                        <Body>
                            <Text style={styles(this.props.darkMode).newsText} numberOfLines={3}>
                                {info.item.content}
                            </Text>
                        </Body>
                    </CardItem>
                    <CardItem
                        footer={true}
                        style={
                            [
                                styles(this.props.darkMode).cardItem,
                                { justifyContent: "space-between", alignItems: "flex-start" },
                            ]
                        }
                    >
                        <View style={{ flexDirection: "row", justifyContent: "flex-start", marginTop: 5 }}>
                            <View>
                                {/* tslint:disable-next-line:jsx-no-multiline-js */}
                                {(info.item.counter > 1) ?
                                    (
                                        <View style={{ flexDirection: "row", marginRight: 3, alignItems: "center" }}>
                                            <Text
                                                style={styles(this.props.darkMode).newsCounter}
                                            >
                                                {info.item.counter}
                                            </Text>
                                            <Icon
                                                style={styles(this.props.darkMode).newsCounterIcon}
                                                type="Ionicons"
                                                name="ios-flame"
                                            />
                                        </View>
                                    ) : (
                                        null
                                    )}
                            </View>
                            <View>
                                <Moment
                                    style={[
                                        styles(this.props.darkMode).newsText,
                                        { color: (this.props.darkMode) ? "#fff" : "#313131" },
                                    ]}
                                    element={Text}
                                    fromNow={true}
                                >
                                    {info.item.created_at}
                                </Moment>
                            </View>
                        </View>
                    </CardItem>
                </TouchableOpacity>
            </Card>
        </View>
    )
    public renderNews() {
        return (
            <FlatList
                data={this.state.news}
                renderItem={this.renderNewsList}
                keyExtractor={this.keyExtractor}
            />
        );
    }
    public renderNoNews() {
        return (
            <View style={[styles(this.props.darkMode).news, { justifyContent: "center", alignItems: "center" }]}>
                <Text style={[styles(this.props.darkMode).cardText, { marginTop: 7 }]}>
                    No news was found, please check again later.
                </Text>
            </View>
        );
    }
    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)}>
                <Container style={styles(this.props.darkMode).news}>
                    {(this.state.noNews) ? this.renderNoNews() : this.renderNews()}
                </Container>
            </StyleProvider>
        );
    }
    private getNews = () => {
        axios
            .get<INews[]>(`${Config.API_SERVER}/news/${this.props.coin.id}`)
            .then((response) => {
                if (response.data.length > 0) {
                    this.setState({
                        news: response.data,
                    });
                } else {
                    this.setState({
                        noNews: true,
                    });
                }
            })
            .catch((err) => {
                // tslint:disable-next-line:no-console
                console.log(err);
            });
    }
    private handleLinkPress = (link: string) => {
        Linking.openURL(link);
    }
    private keyExtractor = (item: INews) => item.id.toString();
}