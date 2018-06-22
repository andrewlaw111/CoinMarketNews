import React from "react";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Body, Card, CardItem, StyleProvider, Text, Content, Spinner } from "native-base";
import { FlatList, Linking, StyleSheet, TouchableOpacity, View } from "react-native";
import getTheme from "../../native-base-theme/components"

import { INews, IUser } from "../models";
import { IRootState } from "../redux/store";

interface INewsListProps {
    news: INews[];
    user: IUser;
    navigator: Navigator;
}

class PureNewsList extends React.Component<INewsListProps> {
    public static navigatorStyle = {
        navBarTitleTextCentered: true,
        statusBarBlur: true,
        statusBarColor: "blue",
    };
    public renderNewsList = (info: { item: INews, index: number }) => (
        <View>
            <StyleProvider style={getTheme()} >
                <Card>
                    <TouchableOpacity
                        onPress={this.handleLinkPress.bind(this, this.props.news[info.index].link)}>
                        <CardItem header={true}>
                            <Text
                                style={styles.headingText}>
                                {this.props.news[info.index].title}
                            </Text>
                        </CardItem>
                        <CardItem>
                            <Body>
                                <Text >
                                    {this.props.news[info.index].content}
                                </Text>
                            </Body>
                        </CardItem>
                        <CardItem
                            button={true}
                            footer={true}
                        >
                            <Text>{new Date(Date.parse(info.item.created_at)).toLocaleString()}</Text>
                        </CardItem>
                    </TouchableOpacity>
                </Card>
            </StyleProvider>
        </View>
    )
    public render() {
        if (this.props.news.length > 0) {
            return (
                <View >
                    <FlatList data={this.props.news}
                        renderItem={this.renderNewsList}
                        keyExtractor={this.keyExtractor}
                    />
                </View>
            );
        } else {
            return (
                <View>
                    <Content>
                        <Spinner />
                        <Text>CoinMarketNews is fetching news.</Text>
                    </Content>
                </View>
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
        news: state.news.news,
        user: state.user.user,
    };
};

const NewsList = connect(mapStateToProps)(PureNewsList);
export default NewsList;

const styles = StyleSheet.create({
    headingText: {
        textDecorationLine: "underline",
    },
});
