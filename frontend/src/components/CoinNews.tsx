import React from "react";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, List, ListItem, Text } from "native-base";
import { StyleSheet, View } from "react-native";

import { ICoin } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsPageProps {
    coin: ICoin;
}

class PureCoinNews extends React.Component<ICoinsPageProps> {
    public renderList = (rowData: any, _SECTIONID: string | number, rowID: string | number) => (
        <ListItem key={rowID}>
            <Card>
                <CardItem header={true} button={true}>
                    <Text>{rowData.news}</Text>
                </CardItem>
                <CardItem button={true}>
                    <Body>
                        <Text>{rowData.link}</Text>
                    </Body>
                </CardItem>
            </Card>
        </ListItem>
    )
    public render() {
        return (
            <Container>
                <List dataArray={[
                    { news: "abc", link: "abc" },
                    { news: "abc", link: "abc" },
                    { news: "abc", link: "abc" }]} // replace with this.props.news
                    // tslint:disable-next-line:jsx-no-lambda
                    renderRow={this.renderList} />
            </Container>
        );
    }
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
