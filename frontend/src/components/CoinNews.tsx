import axios from "axios";
import React from "react";
import Config from "react-native-config";

import { Body, Card, CardItem, Container, Text, StyleProvider, Content, Spinner } from "native-base";
import { FlatList, Linking, StyleSheet, TouchableOpacity, View } from "react-native";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin, INews } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsNewsProps {
    coin: ICoin;
    darkMode: boolean;
}
interface ICoinsNewsState {
    news: INews[];
}

export default class CoinNews extends React.Component<ICoinsNewsProps, ICoinsNewsState> {
    public styles: typeof styles;

    constructor(props: ICoinsNewsProps) {
        super(props);
        this.state = {
            news: [],
        };
    }
    public componentDidMount() {
        this.getNews();
    }
    public renderList = (info: { item: INews, index: number }) => (
        <Card style={this.styles.card}>
            <TouchableOpacity onPress={this.handleLinkPress.bind(this, info.item.link)}>
                <CardItem header={true} bordered={true} style={this.styles.cardItem}>
                    <Text style={this.styles.cardText}>{info.item.title}</Text>
                </CardItem>
                <CardItem button={true} style={this.styles.cardItem}>
                    <Body>
                        <Text style={this.styles.cardText}>{info.item.content}</Text>
                    </Body>
                </CardItem>
                <CardItem footer={true} style={this.styles.cardItem}>
                    <Text style={this.styles.cardText}>{new Date(Date.parse(info.item.created_at)).toLocaleString()}</Text>
                </CardItem>
            </TouchableOpacity>
        </Card>
    )
    public render() {
        this.styles = (this.props.darkMode) ? darkStyles : styles;
        return (
            <StyleProvider style={getTheme(commonColour)}>
                <Container>
                    <StyleProvider style={getTheme()} >
                        <FlatList
                            data={this.state.news}
                            renderItem={this.renderList}
                            keyExtractor={this.keyExtractor}
                            style={this.styles.news}
                        />
                    </StyleProvider>
                </Container>
            </StyleProvider>
        );
    }
    private getNews = () => {
        axios
            .get<INews[]>(`${Config.API_SERVER}/news/${this.props.coin.id}`)
            .then((response) => {
                this.setState({
                    news: response.data,
                });
            });
    }
    private handleLinkPress = (link: string) => {
        Linking.openURL(link);
    }
    private keyExtractor = (item: INews) => item.id.toString();
}

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        user: state.user.user,
    };
};
const styles = StyleSheet.create({
    card: {
    },
    cardItem: {
    },
    coinInfoStats: {
        flex: 1,
    },
    coinInfoStatsLine: {
        flex: 1,
        flexDirection: "row",
        justifyContent: "space-between",
    },
    coinInfoStatsText: {
        flex: 1,
    },
    cardText: {

    },
    news: {

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
    cardText: {
        color: "#F8F8F8"
    },
    coinInfoStats: {
        flex: 1,
    },
    coinInfoStatsLine: {
        flex: 1,
        flexDirection: "row",
        justifyContent: "space-between",
    },
    coinInfoStatsText: {
        flex: 1,
    },
    news: {
        backgroundColor: "#2f343f",
    },
});
