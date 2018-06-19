import React from "react";
import { connect } from "react-redux";

import { Container, Tab, Tabs, Text } from "native-base";
import { StyleSheet, View } from "react-native";

import { ICoin, IUser } from "../models";
import { IRootState } from "../redux/store";

import CoinAlerts from "./CoinAlerts";
import CoinInfo from "./CoinInfo";
import CoinNews from "./CoinNews";
import CoinPrice from "./CoinPrice";

interface ICoinsPageProps {
    coinID: number;
    coins: ICoin[];
    user: IUser;
}

class PureCoinsList extends React.Component<ICoinsPageProps> {

    public render() {
        // tslint:disable-next-line:no-console
        console.log(this.props.coinID);
        return (
            <Container>
                <Tabs initialPage={0}>
                    <Tab heading="Info">
                        <CoinInfo coin={this.props.coins[this.props.coinID]} />
                    </Tab>
                    <Tab heading="News">
                        <CoinNews coin={this.props.coins[this.props.coinID]} />
                    </Tab>
                    <Tab heading="Price">
                        <CoinPrice coin={this.props.coins[this.props.coinID]} />
                    </Tab>
                    <Tab heading="Alerts">
                        <CoinAlerts coin={this.props.coins[this.props.coinID]} />
                    </Tab>
                </Tabs>
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

const CoinsList = connect(mapStateToProps)(PureCoinsList);
export default CoinsList;

const styles = StyleSheet.create({
});
