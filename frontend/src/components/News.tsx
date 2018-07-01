import React from "react";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";
import Moment from 'react-moment';

import { Body, Card, CardItem, StyleProvider, Text, Content, Spinner, Icon } from "native-base";
import { FlatList, Linking, StyleSheet, TouchableOpacity, View } from "react-native";

import getTheme from "../../native-base-theme/components";
import commonColour from '../../native-base-theme/variables/commonColor';

import { INews, IUser, ISettings } from "../models";
import { IRootState } from "../redux/store";
import { BlockOverflowProperty } from "csstype";
import FastImage from "react-native-fast-image";
import Config from "react-native-config";

interface INewsListProps {
    appSettings: ISettings,
    news: INews[];
    user: IUser;
    navigator: Navigator;
}

class PureNewsList extends React.Component<INewsListProps> {
    public styles: typeof styles;

    public static navigatorStyle = {
        navBarTitleTextCentered: true,
        statusBarBlur: true,
    };
    public renderNewsList = (info: { item: INews, index: number }) => (
        <View>
            <Card style={this.styles.card}>
                <TouchableOpacity
                    onPress={this.handleLinkPress.bind(this, this.props.news[info.index].link)}
                >
                    <CardItem header={true} bordered={true} style={this.styles.cardItem}>
                        <FastImage
                            style={this.styles.newsSourceIcon}
                            source={{ uri: `${Config.API_SERVER}/source-icons/${this.props.news[info.index].source_id}.png` }}
                            resizeMode={FastImage.resizeMode.contain}
                        />
                        <Text
                            style={this.styles.headingText}
                        >
                            {this.props.news[info.index].title}
                        </Text>
                    </CardItem>
                    <CardItem style={this.styles.cardItem}>
                        <Body>
                            <Text style={this.styles.newsText} numberOfLines={3}>
                                {this.props.news[info.index].content}
                            </Text>
                        </Body>
                    </CardItem>
                    <CardItem
                        button={true}
                        footer={true}
                        style={[this.styles.cardItem, { paddingTop: 0 }]}
                    >
                        {(this.props.news[info.index].counter > 1) ? <View style={{ flexDirection: "row", marginRight: 3 }}><Text style={this.styles.newsCounter}>{this.props.news[info.index].counter} </Text><Icon style={this.styles.newsCounterIcon} type="Ionicons" name="ios-flame" /></View> : <Text/>}
                        <Moment style={[this.styles.newsText, { color: "#313131" }]} element={Text} fromNow={true}>{info.item.created_at}</Moment>
                        {/* tslint:disable-next-line:jsx-no-multiline-js */}
                        {this.props.news[info.index].coins && this.props.news[info.index].coins.map((coin: string, key: number) => {
                            return (
                                <FastImage
                                    style={this.styles.newsIcons}
                                    source={{ uri: `${Config.API_SERVER}/icon/${coin.toLocaleLowerCase()}.png` }}
                                    resizeMode={FastImage.resizeMode.contain}
                                    key={key}
                                />
                            )
                        })}
                    </CardItem>
                </TouchableOpacity>
            </Card>
        </View>
    )
    public render() {
        this.styles = (this.props.appSettings.darkMode) ? darkStyles : styles;
        const listEmptyComponent = () => {
            return (
                <Content>
                    <Spinner />
                    <Text>CoinMarketNews is fetching news.</Text>
                </Content>
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
                        ListEmptyComponent={listEmptyComponent()}
                    />
                </View>
            </StyleProvider>
        );

    }

    private handleLinkPress = (link: string) => {
        Linking.openURL(link);
    }
    private keyExtractor = (item: INews) => item.id.toString();
}

const mapStateToProps = (state: IRootState) => {
    return {
        appSettings: state.settings.settings,
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
        fontSize: 17,
    },
    newsSourceIcon: {
        width: 30,
        height: 30,
        marginRight: 6,
    },
    newsIcons: {
        width: 20,
        height: 20,
        marginLeft: 8,
        backgroundColor: "grey",
        borderRadius:50,
    }
});

const styles = styleTemplate(false);
const darkStyles = styleTemplate(true);