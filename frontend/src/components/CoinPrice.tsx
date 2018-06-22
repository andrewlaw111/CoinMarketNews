import React from "react";
import Config from "react-native-config";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, Text } from "native-base";
import { StyleSheet, View, WebView } from "react-native";

import { ICoin } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsPageProps {
    coin: ICoin;
}

class PureCoinPrice extends React.Component<ICoinsPageProps> {

    public render() {
        return (
            <Container>
                <Card>
                    <CardItem header={true}>
                        <Text>{this.props.coin.name}</Text>
                    </CardItem>
                    <CardItem>
                        <Body>
                            <Text>Your text here</Text>
                        </Body>
                    </CardItem>
                </Card>
                <View style={{ height: 300 }}>
                    <WebView
                        source={{ uri: `${Config.API_SERVER}/chart/${this.props.coin.symbol}` }}
                        style={{ height: 300 }}
                    />
                </View>
                <Card>
                    <CardItem header={true}>
                        <Text>NativeBase</Text>
                    </CardItem>
                    <CardItem>
                        <Body>
                            <Text>
                                Your text here
                                    </Text>
                        </Body>
                    </CardItem>
                </Card>
                <Card>
                    <CardItem header={true}>
                        <Text>NativeBase</Text>
                    </CardItem>
                    <CardItem>
                        <Body>
                            <Text>
                                Your text here
                                    </Text>
                        </Body>
                    </CardItem>
                </Card>
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

const CoinPrice = connect(mapStateToProps)(PureCoinPrice);
export default CoinPrice;

const styles = StyleSheet.create({
});
