import React from "react";
import { Navigator } from "react-native-navigation";
import { connect } from "react-redux";

import { Body, Card, CardItem, Text } from "native-base";
import { FlatList, Linking, Platform, StyleSheet, TouchableOpacity, View } from "react-native";

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
            <Card >
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
                    <Text>CoinMarketNews was unable to retrieve data.</Text>
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
