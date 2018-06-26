import React from "react";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Body, Card, CardItem, StyleProvider, Text, Content, Spinner } from "native-base";
import { FlatList, Linking, StyleSheet, TouchableOpacity, View } from "react-native";

import getTheme from "../../native-base-theme/components";
import commonColour from '../../native-base-theme/variables/commonColor';

import { INews, IUser, ISettings } from "../models";
import { IRootState } from "../redux/store";

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
        statusBarColor: "blue",
    };
    public renderNewsList = (info: { item: INews, index: number }) => (
        <View>
            <Card style={this.styles.card}>
                <TouchableOpacity
                    onPress={this.handleLinkPress.bind(this, this.props.news[info.index].link)}
                >
                    <CardItem header={true} bordered={true}  style={this.styles.cardItem}>
                        <Text
                            style={this.styles.headingText}
                        >
                            {this.props.news[info.index].title}
                        </Text>
                    </CardItem>
                    <CardItem style={this.styles.cardItem}>
                        <Body>
                            <Text style={this.styles.newsText}>
                                {this.props.news[info.index].content}
                            </Text>
                        </Body>
                    </CardItem>
                    <CardItem
                        button={true}
                        footer={true}
                        style={this.styles.cardItem}
                    >
                        <Text style={this.styles.newsText} >
                            {new Date(Date.parse(info.item.created_at)).toLocaleString()}
                        </Text>
                    </CardItem>
                </TouchableOpacity>
            </Card>
        </View>
    )
    public render() {
        this.styles = (this.props.appSettings.darkMode) ? darkStyles : styles;
        if (this.props.news.length > 0) {
            return (
                <StyleProvider style={getTheme(commonColour)}>
                    <View style={this.styles.news}>
                        <FlatList
                            data={this.props.news}
                            renderItem={this.renderNewsList}
                            keyExtractor={this.keyExtractor}
                            style={this.styles.news}
                        />
                    </View>
                </StyleProvider>
            );
        } else {
            return (
                <StyleProvider style={getTheme(commonColour)}>
                    <View style={this.styles.news}>
                        <Content>
                            <Spinner />
                            <Text>CoinMarketNews is fetching news.</Text>
                        </Content>
                    </View>
                </StyleProvider>
            );
        }
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

const styles = StyleSheet.create({
    card: {
    },
    cardItem: {

    },
    headingText: {
        textDecorationLine: "underline",
    },
    news: {
    },
    newsList: {
    },
    newsText: {

    }
});

const darkStyles = StyleSheet.create({
    card: {
        borderColor: "#41444c",
        backgroundColor: "#454951",
    },
    cardItem: {
        backgroundColor: "#454951",
    },
    headingText: {
        color: "#F8F8F8",
        textDecorationLine: "underline",
    },
    news: {
        backgroundColor: "#2f343f",
    },
    newsList: {
    },
    newsText: {
        color: "#F8F8F8"
    },
});

