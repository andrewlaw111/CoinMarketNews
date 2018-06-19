import React from "react";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, Icon, Right, Text } from "native-base";
import { StyleSheet, View } from "react-native";

import { ICoin } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsPageProps {
    coin: ICoin;
}

class PureCoinInfo extends React.Component<ICoinsPageProps> {

    public render() {
        return (
            <Container>
                <Card>
                    <CardItem header={true} bordered={true}>
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
                    <CardItem>
                        <Icon active={true} name="logo-googleplus" />
                        <Text>Google Plus</Text>
                        <Right>
                            <Icon name="arrow-forward" />
                        </Right>
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

const CoinInfo = connect(mapStateToProps)(PureCoinInfo);
export default CoinInfo;

const styles = StyleSheet.create({
});
