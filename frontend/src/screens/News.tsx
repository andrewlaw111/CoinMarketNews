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
    public styles: typeof styles;
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
                                            <Text
                                                style={this.styles.newsCounter}>{info.item.counter}
                                            </Text>
                                            <Icon
                                                style={this.styles.newsCounterIcon}
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
                                        this.styles.newsText,
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
                                                    style={this.styles.newsIcons}
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
        this.styles = (this.props.appSettings.darkMode) ? darkStyles : styles;
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
                <View style={this.styles.news}>
                    <FlatList
                        data={this.props.news}
                        renderItem={this.renderNewsList}
                        keyExtractor={this.keyExtractor}
                        style={this.styles.newsList}
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

const styleTemplate = (darkMode: boolean) => StyleSheet.create({
    card: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        paddingBottom: 10,
        paddingLeft: 10,
        paddingRight: 10,
        paddingTop: 10,
    },
    headingText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
        fontSize: 14,
        fontWeight: "bold",
        paddingRight: 25,
        // textDecorationLine: "underline",
    },
    news: {
        backgroundColor: (darkMode) ? "#2f343f" : "#F8F8F8",
    },
    newsCounter: {
        color: "#ffa236",
        fontSize: 14,
    },
    newsCounterIcon: {
        color: "#ffa236",
        fontSize: 15,
        width: 13,
    },
    newsIcons: {
        backgroundColor: "grey",
        borderRadius: 50,
        height: 25,
        marginRight: 6,
        width: 25,
    },
    newsList: {
        // paddingBottom: 20,
    },
    newsSourceIcon: {
        height: 30,
        marginRight: 8,
        width: 30,
    },
    newsText: {
        color: (darkMode) ? "#F8F8F8" : "#a3a3a2",
        fontSize: 14,
    },
});

const styles = styleTemplate(false);
const darkStyles = styleTemplate(true);
