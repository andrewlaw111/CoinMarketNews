import React, { RefObject } from "react";
import Moment from "react-moment";
import Config from "react-native-config";
import FastImage from "react-native-fast-image";
import { Navigator } from "react-native-navigation";
import IonIcons from "react-native-vector-icons/Ionicons";
import { connect } from "react-redux";

import { Body, Card, CardItem, Content, Icon, Spinner, StyleProvider, Text } from "native-base";
import { FlatList, Linking, Platform, RefreshControl, StyleSheet, TouchableOpacity, View } from "react-native";

import getTheme from "../../native-base-theme/components";
import commonColour from "../../native-base-theme/variables/commonColor";

import { ICoinPrice, INews, ISettings, IUser } from "../models";
import { getNews } from "../redux/actions/news";
import { IRootState } from "../redux/store";
import styles from "../styles/NewsStyles";

interface INewsListProps {
    appSettings: ISettings;
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
    public static navigatorStyle = {
        navBarTitleTextCentered: true,
        statusBarBlur: true,
    };
    public newsRef: RefObject<FlatList<INews>>;

    constructor(props: INewsListProps) {
        super(props);
        this.props.navigator.setOnNavigatorEvent(this.onNavigatorEvent.bind(this));
        this.newsRef = React.createRef<FlatList<INews>>();
        this.state = {
            refreshing: false,
        };
    }
    public renderNewsList = (info: { item: INews, index: number }) => (
        <View>
            <Card style={styles(this.props.appSettings.darkMode).card}>
                <TouchableOpacity
                    onPress={this.handleLinkPress.bind(this, info.item.link)}
                >
                    <CardItem header={true} bordered={true} style={styles(this.props.appSettings.darkMode).cardItem}>
                        <FastImage
                            style={styles(this.props.appSettings.darkMode).newsSourceIcon}
                            source={{ uri: `${Config.API_SERVER}/source-icons/${info.item.source_id}.png` }}
                            resizeMode={FastImage.resizeMode.contain}
                        />
                        <Text
                            style={styles(this.props.appSettings.darkMode).headingText}
                        >
                            {info.item.title}
                        </Text>
                    </CardItem>
                    <CardItem bordered={true} style={styles(this.props.appSettings.darkMode).cardItem}>
                        <Body>
                            <Text style={styles(this.props.appSettings.darkMode).newsText} numberOfLines={3}>
                                {info.item.content}
                            </Text>
                        </Body>
                    </CardItem>
                    <CardItem
                        footer={true}
                        style={[styles(this.props.appSettings.darkMode).cardItem, { justifyContent: "space-between", alignItems: "flex-start" }]}
                    >
                        <View style={{ flexDirection: "row", justifyContent: "flex-start", marginTop: 5 }}>
                            <View>
                                {/* tslint:disable-next-line:jsx-no-multiline-js */}
                                {(info.item.counter > 1) ?
                                    (
                                        <View style={{ flexDirection: "row", marginRight: 3, alignItems: "center" }}>
                                            <Text
                                                style={styles(this.props.appSettings.darkMode).newsCounter}>{info.item.counter}
                                            </Text>
                                            <Icon
                                                style={styles(this.props.appSettings.darkMode).newsCounterIcon}
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
                                        styles(this.props.appSettings.darkMode).newsText,
                                        { color: (this.props.appSettings.darkMode) ? "#fff" : "#313131" },
                                    ]} element={Text} fromNow={true}>{info.item.created_at}</Moment>
                            </View>
                        </View>
                        <View style={{ flexDirection: "row", justifyContent: "flex-end" }}>
                            {/* tslint:disable-next-line:jsx-no-multiline-js */}
                            {info.item.coins && info.item.coins.map((coin: string, key: number) => {
                                if (key < 6) {
                                    return (
                                        <View key={key}>
                                            <TouchableOpacity
                                                onPress={this.handlePressIcon.bind(this, info.item.coins_id[key])}
                                            >
                                                <FastImage
                                                    style={styles(this.props.appSettings.darkMode).newsIcons}
                                                    // tslint:disable-next-line:max-line-length
                                                    source={{ uri: `${Config.API_SERVER}/icon/${coin.toLocaleLowerCase()}.png` }}
                                                    resizeMode={FastImage.resizeMode.contain}
                                                />
                                            </TouchableOpacity>
                                        </View>
                                    );
                                }
                            })}
                        </View>
                    </CardItem>
                </TouchableOpacity>
            </Card>
        </View>
    )
    public render() {
        const listEmptyComponent = () => {
            return (
                <View style={{ justifyContent: "center", alignItems: "center" }}>
                    <Content >
                        <Spinner />
                        <Text>CoinMarketNews is fetching news.</Text>
                    </Content>
                </View>
            );
        };
        return (
            <StyleProvider style={getTheme(commonColour)}>
                <View style={styles(this.props.appSettings.darkMode).news}>
                    <FlatList
                        data={this.props.news}
                        renderItem={this.renderNewsList}
                        keyExtractor={this.keyExtractor}
                        style={styles(this.props.appSettings.darkMode).newsList}
                        refreshControl={
                            <RefreshControl refreshing={this.state.refreshing} onRefresh={this.onRefresh} />
                        }
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
    private handlePressIcon = (coinsID: number) => {
        const selectedCoin = this.props.coins.find((coin) => coin.id === coinsID);
        const favourite = (this.props.favourites.indexOf(coinsID) > -1) ? true : false;

        Promise.all([
            IonIcons.getImageSource("ios-arrow-back", 20, "#FFF"),
            IonIcons.getImageSource("ios-star", 24, "grey"),
        ]).then((sources) => {
            this.props.navigator.showModal({
                navigatorButtons: {
                    leftButtons: [{
                        buttonColor: (this.props.appSettings.darkMode) ?
                            "#F8F8F8" : (Platform.OS === "ios") ? "#2874F0" : "#333",
                        buttonFontSize: 18,
                        buttonFontWeight: "600",
                        icon: (Platform.OS === "ios") ? sources[0] : null,
                        id: "back",
                        showAsAction: "ifRoom",
                        title: "back",
                    }],
                    rightButtons: [{
                        buttonColor: (favourite) ? "gold" : "grey",
                        buttonFontSize: 18,
                        buttonFontWeight: "600",
                        icon: sources[1],
                        id: "like",
                        showAsAction: "ifRoom",
                    }],

                },
                navigatorStyle: {},
                passProps: {
                    appSettings: this.props.appSettings,
                    coinID: coinsID,
                    coinPrice: selectedCoin,
                    favourite,
                },
                screen: "CoinMarketNews.CoinsPage",
                title: selectedCoin.name,
            });
            // SelectedCoin needs to be fixed
        }).catch((err) => {
            // tslint:disable-next-line:no-console
            console.error(err);
        });
    }
    private keyExtractor = (item: INews) => item.id.toString();

    private onNavigatorEvent(event: any) {
        if (event.id === "bottomTabReselected") {
            this.newsRef.current.scrollToIndex({ index: 0, viewOffset: 0, viewPosition: 0, animated: true });
        }
    }

    private onRefresh = () => {
        this.setState({
            refreshing: true,
        });
        getNews().then(() => {
            this.setState({
                refreshing: false,
            });
        });
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
