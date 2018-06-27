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
    noNews: boolean;
}

export default class CoinNews extends React.Component<ICoinsNewsProps, ICoinsNewsState> {
    public styles: typeof styles;

    constructor(props: ICoinsNewsProps) {
        super(props);
        this.state = {
            news: [],
            noNews: false,
        };
    }
    public componentDidMount() {
        this.getNews();
    }
    public componentWillMount() {
        this.styles = (this.props.darkMode) ? darkStyles : styles;
    }
    public componentWillReceiveProps(nextProps: ICoinsNewsProps) {
        this.styles = (this.props.darkMode) ? darkStyles : styles;
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
    public renderNews() {
        return (
            <FlatList
                data={this.state.news}
                renderItem={this.renderList}
                keyExtractor={this.keyExtractor}
                style={this.styles.news}
            />
        )
    }
    public renderNoNews() {
        return (
            <View style={this.styles.news}>
                <Text>
                    No news was found, please check again later.
                </Text>
            </View>
        )
    }
    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)}>
                <Container>
                    {(this.state.noNews) ? this.renderNoNews() : this.renderNews()}
                </Container>
            </StyleProvider>
        );
    }
    private getNews = () => {
        axios
            .get<INews[]>(`${Config.API_SERVER}/news/${this.props.coin.id}`)
            .then((response) => {
                if (response.data.length > 0) {
                    this.setState({
                        news: response.data,
                    });
                } else {
                    this.setState({
                        noNews: true,
                    });
                }
            })
            .catch((data) => {
            })
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

const styleTemplate = (darkMode: boolean) => StyleSheet.create({
    card: {
        borderColor: (darkMode) ? "#41444c" : null,
        backgroundColor: (darkMode) ? "#454951" : null,
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : null,
    },
    cardText: {
        color: (darkMode) ? "#F8F8F8" : null,
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
        backgroundColor: (darkMode) ? "#2f343f" : null,
        flex: 1,
    },
});

const styles = styleTemplate(false);

const darkStyles = styleTemplate(true);