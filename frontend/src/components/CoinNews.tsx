import React from "react";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, List, ListItem, Text } from "native-base";
import { FlatList, StyleSheet, View } from "react-native";

import { ICoin, INews } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsPageProps {
    coin: ICoin;
}

class PureCoinNews extends React.Component<ICoinsPageProps> {
    public renderList = (info: { item: any, index: number }) => (
        <View>
            <Card>
                <CardItem header={true} button={true}>
                    <Text>{info.item.news}</Text>
                </CardItem>
                <CardItem button={true}>
                    <Body>
                        <Text>{info.item.link}</Text>
                    </Body>
                </CardItem>
            </Card>
        </View>
    )
    public render() {
        return (
            <Container>
                <FlatList data={[
                    { news: "abc", link: "abc" },
                    { news: "abc", link: "abc" },
                    { news: "abc", link: "abc" }]}
                    renderItem={this.renderList}
                    keyExtractor={this.keyExtractor}
                />
            </Container>
        );
    }
    private keyExtractor = (item: any) => item.news;
}

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        user: state.user.user,
    };
};

const CoinNews = connect(mapStateToProps)(PureCoinNews);
export default CoinNews;

const styles = StyleSheet.create({
});
