import React, { RefObject } from "react";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";
import Moment from 'react-moment';

import { Body, Card, CardItem, StyleProvider, Text, Content, Spinner, Icon } from "native-base";
import { FlatList, Linking, StyleSheet, TouchableOpacity, View, RefreshControl, Platform, ScrollView } from "react-native";

import getTheme from "../../native-base-theme/components";
import commonColour from '../../native-base-theme/variables/commonColor';

import { INews, IUser, ISettings, ICoin, ICoinPrice } from "../models";
import { IRootState } from "../redux/store";
import { getNews } from "../redux/actions/news";
import { BlockOverflowProperty } from "csstype";
import FastImage from "react-native-fast-image";
import Config from "react-native-config";
import IonIcons from "react-native-vector-icons/Ionicons";

interface INewsListProps {
    appSettings: ISettings,
    coins: ICoinPrice[];
    favourites: number[];
    news: INews[];
    user: IUser;
    navigator: Navigator;
}

export interface INewsListState {
    refreshing: boolean;
}

class PureNewsList extends React.Component<INewsListProps, INewsListState> {
    public styles: typeof styles;
    public newsRef: RefObject<FlatList<INews>>;

    public static navigatorStyle = {
        navBarTitleTextCentered: true,
        statusBarBlur: true,
    };
    public constructor(props: INewsListProps) {
        super(props);
        this.props.navigator.setOnNavigatorEvent(this.onNavigatorEvent.bind(this));
        this.newsRef = React.createRef<FlatList<INews>>();
        this.state = {
            refreshing: false,
        };
    }
    public renderNewsList = (info: { item: INews, index: number }) => (
        <View>
            <Card style={this.styles.card}>
                <TouchableOpacity
                    onPress={this.handleLinkPress.bind(this, info.item.link)}
                >
                    <CardItem header={true} bordered={true} style={this.styles.cardItem}>
                        <FastImage
                            style={this.styles.newsSourceIcon}
                            source={{ uri: `${Config.API_SERVER}/source-icons/${info.item.source_id}.png` }}
                            resizeMode={FastImage.resizeMode.contain}
                        />
                        <Text
                            style={this.styles.headingText}
                        >
                            {info.item.title}
                        </Text>
                    </CardItem>
                    <CardItem bordered={true} style={this.styles.cardItem}>
                        <Body>
                            <Text style={this.styles.newsText} numberOfLines={3}>
                                {info.item.content}
                            </Text>
                        </Body>
                    </CardItem>
                    <CardItem
                        footer={true}
                        style={[this.styles.cardItem, { justifyContent: "space-between", alignItems: "flex-start" }]}
                    >
                        <View style={{ flexDirection: "row", justifyContent: "flex-start", marginTop: 5 }}>
                            <View>
                                {/* tslint:disable-next-line:jsx-no-multiline-js */}
                                {(info.item.counter > 1) ?
                                    (
                                        <View style={{ flexDirection: "row", marginRight: 3, alignItems: "center" }}>
                                            <Text style={this.styles.newsCounter}>{info.item.counter} </Text>
                                            <Icon style={this.styles.newsCounterIcon} type="Ionicons" name="ios-flame" />
                                        </View>
                                    ) : (
                                        null
                                    )}
                            </View>
                            <View>
                                <Moment style={[this.styles.newsText, { color: (this.props.appSettings.darkMode) ? "#fff" : "#313131" }]} element={Text} fromNow={true}>{info.item.created_at}</Moment>
                            </View>
                        </View>
                        <View style={{ flexDirection: "row", justifyContent: "flex-end" }}>
                            {/* tslint:disable-next-line:jsx-no-multiline-js */}
                            {info.item.coins && info.item.coins.map((coin: string, key: number) => {
                                if (key < 6) {
                                    return (
                                        <View key={key}>
                                            <TouchableOpacity onPress={this.handlePressIcon.bind(this, info.item.coins_id[key])}>
                                                <FastImage
                                                    style={this.styles.newsIcons}
                                                    source={{ uri: `${Config.API_SERVER}/icon/${coin.toLocaleLowerCase()}.png` }}
                                                    resizeMode={FastImage.resizeMode.contain}
                                                />
                                            </TouchableOpacity>
                                        </View>
                                    )
                                }
                            })}
                        </View>
                    </CardItem>
                </TouchableOpacity>
            </Card>
        </View>
    )
    public render() {
        this.styles = (this.props.appSettings.darkMode) ? darkStyles : styles;
        const listEmptyComponent = () => {
            return (
                <View style={{ justifyContent: "center", alignItems: "center" }}>
                    <Content >
                        <Spinner />
                        <Text>CoinMarketNews is fetching news.</Text>
                    </Content>
                </View>
            )
        }
        return (
            <StyleProvider style={getTheme(commonColour)}>
                <View style={this.styles.news}>
                    <FlatList
                        data={this.props.news}
                        renderItem={this.renderNewsList}
                        keyExtractor={this.keyExtractor}
                        style={this.styles.newsList}
                        refreshControl={<RefreshControl refreshing={this.state.refreshing} onRefresh={this.onRefresh} />}
                        ListEmptyComponent={listEmptyComponent()}
                        ref={this.newsRef}
                    />
                </View>
            </StyleProvider>
        );

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
            //SelectedCoin needs to be fixed
        }).catch((err) => {
            console.error(err)
        })
    }
    private keyExtractor = (item: INews) => item.id.toString();

    private onRefresh = () => {
        this.setState({
            refreshing: true
        });
        getNews().then(() => {
            this.setState({
                refreshing: false
            });
        });
    }

    public onNavigatorEvent(event: any) {
        if (event.id === 'bottomTabSelected') {

        }
        if (event.id === 'bottomTabReselected') {
            this.newsRef.current.scrollToIndex({ index: 0, viewOffset: 0, viewPosition: 0, animated: true });
        }
    }
}

const mapStateToProps = (state: IRootState) => {
    return {
        appSettings: state.settings.settings,
        coins: state.coins.coins,
        favourites: state.favourites.favourites,
        news: state.news.news,
        user: state.user.user,
    };
};

const NewsList = connect(mapStateToProps)(PureNewsList);
export default NewsList;

const styleTemplate = (darkMode: boolean) => StyleSheet.create({
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

const styles = styleTemplate(false);
const darkStyles = styleTemplate(true);