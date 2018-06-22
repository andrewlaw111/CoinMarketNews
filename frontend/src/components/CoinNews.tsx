import axios from "axios";
import React from "react";
import Config from "react-native-config";

import { Body, Card, CardItem, Container, Text, StyleProvider, Content, Spinner } from "native-base";
import { FlatList, Linking, StyleSheet, TouchableOpacity, View } from "react-native";
import getTheme from "../../native-base-theme/components"

import { ICoin, INews } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsNewsProps {
    coin: ICoin;
}
interface ICoinsNewsState {
    news: INews[];
}

export default class CoinNews extends React.Component<ICoinsNewsProps, ICoinsNewsState> {
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
        <Card>
            <TouchableOpacity
                onPress={this.handleLinkPress.bind(this, info.item.link)}>
                <CardItem header={true} bordered={true}>
                    <Text>{info.item.title}</Text>
                </CardItem>
                <CardItem button={true}>
                    <Body>
                        <Text>{info.item.content}</Text>
                    </Body>
                </CardItem>
                <CardItem footer={true}>
                    <Text>{new Date(Date.parse(info.item.created_at)).toLocaleString()}</Text>
                </CardItem>
            </TouchableOpacity>
        </Card>
    )
    public render() {
        return (
            <Container>
                <StyleProvider style={getTheme()} >
                    {(this.state.news.length > 0) ? (
                        <FlatList
                            data={this.state.news}
                            renderItem={this.renderList}
                            keyExtractor={this.keyExtractor}
                        />
                    ) : (
                            <View>
                                <Content>
                                    <Spinner />
                                    <Text>CoinMarketNews is fetching news.</Text>
                                </Content>
                            </View>
                        )}
                </StyleProvider>
            </Container>
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
});
