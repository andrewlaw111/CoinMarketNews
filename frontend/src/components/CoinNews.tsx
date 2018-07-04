import axios from "axios";
import React from "react";
import Config from "react-native-config";
import Moment from 'react-moment';

import { Body, Card, CardItem, Container, Text, StyleProvider, Content, Spinner, Icon } from "native-base";
import { FlatList, Linking, StyleSheet, TouchableOpacity, View, Platform } from "react-native";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin, INews, ISettings, ICoinPrice } from "../models";
import { IRootState } from "../redux/store";
import IonIcons from "react-native-vector-icons/Ionicons";
import FastImage from "react-native-fast-image";
import { Navigator } from "react-native-navigation";

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
                        style={[styles(this.props.darkMode).cardItem, { justifyContent: "space-between", alignItems: "flex-start" }]}
                    >
                        <View style={{ flexDirection: "row", justifyContent: "flex-start", marginTop: 5 }}>
                            <View>
                                {/* tslint:disable-next-line:jsx-no-multiline-js */}
                                {(info.item.counter > 1) ?
                                    (
                                        <View style={{ flexDirection: "row", marginRight: 3, alignItems: "center" }}>
                                            <Text style={styles(this.props.darkMode).newsCounter}>{info.item.counter} </Text>
                                            <Icon style={styles(this.props.darkMode).newsCounterIcon} type="Ionicons" name="ios-flame" />
                                        </View>
                                    ) : (
                                        null
                                    )}
                            </View>
                            <View>
                                <Moment style={[styles(this.props.darkMode).newsText, { color: (this.props.darkMode) ? "#fff" : "#313131" }]} element={Text} fromNow={true}>{info.item.created_at}</Moment>
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
                style={styles(this.props.darkMode).newsList}
            />
        )
    }
    public renderNoNews() {
        return (
            <View style={[styles(this.props.darkMode).news,{justifyContent:"center", alignItems: "center"}]}>
                 <Text style={[styles(this.props.darkMode).cardText, {marginTop:7}]}>
                    No news was found, please check again later.
                </Text>
            </View>
        )
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
            .catch((data) => {
            })
    }
    private handleLinkPress = (link: string) => {
        Linking.openURL(link);
    }
    private handlePressIcon = (coins_id: number) => {
        const selectedCoin = this.props.coins.find((coin) => coin.id === coins_id)
        const favourite = (this.props.favourites.indexOf(coins_id) > -1) ? true : false

        Promise.all([
            IonIcons.getImageSource("ios-arrow-back", 20, "#FFF"),
            IonIcons.getImageSource("ios-star", 24, "grey"),
        ]).then((sources) => {
            this.props.navigator.showModal({
                navigatorButtons: {
                    leftButtons: [{
                        buttonColor: (this.props.appSettings.darkMode) ? "#F8F8F8" : (Platform.OS === "ios") ? "#2874F0" : "#333",
                        buttonFontSize: 18,
                        buttonFontWeight: "600",
                        id: "back",
                        showAsAction: "ifRoom",
                        title: "back",
                        icon: (Platform.OS === "ios") ? sources[0] : null,
                    }],
                    rightButtons: [{
                        buttonColor: (favourite) ? "gold" : "grey",
                        buttonFontSize: 18,
                        buttonFontWeight: "600",
                        id: "like",
                        showAsAction: "ifRoom",
                        icon: sources[1],
                    }],

                },
                navigatorStyle: {},
                passProps: { appSettings: this.props.appSettings, coinID: coins_id, coinPrice: selectedCoin, favourite },
                screen: "CoinMarketNews.CoinsPage",
                title: selectedCoin.name,
            });
        }).catch((err) => {
            console.error(err)
        })
    }
    private keyExtractor = (item: INews) => item.id.toString();
}

const styles = (darkMode: boolean) => StyleSheet.create({
    card: {
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        paddingRight: 10,
        paddingLeft: 10,
        paddingTop: 10,
        paddingBottom: 10,
    },
    cardText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    headingText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
        fontWeight: 'bold',
        fontSize: 14,
        paddingRight: 25,
        // textDecorationLine: "underline",
    },
    news: {
        backgroundColor: (darkMode) ? "#2f343f" : "#F8F8F8",
    },
    newsList: {
        // paddingBottom: 20,
    },
    newsText: {
        color: (darkMode) ? "#F8F8F8" : "#a3a3a2",
        fontSize: 14,
    },
    newsCounter: {
        color: "#ffa236",
        fontSize: 14,
    },
    newsCounterIcon: {
        width: 13,
        color: "#ffa236",
        fontSize: 15,
    },
    newsSourceIcon: {
        width: 30,
        height: 30,
        marginRight: 8,
    },
    newsIcons: {
        width: 25,
        height: 25,
        marginRight: 6,
        backgroundColor: "grey",
        borderRadius: 50,
    }
});