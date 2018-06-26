import React from "react";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, Text } from "native-base";
import { StyleSheet, View } from "react-native";

import { ICoin } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsPageProps {
    coin: ICoin;
    darkMode: boolean;
}

class PureCoinAlerts extends React.Component<ICoinsPageProps> {

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

const CoinAlerts = connect(mapStateToProps)(PureCoinAlerts);
export default CoinAlerts;

const styles = StyleSheet.create({
});
