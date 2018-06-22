import axios from "axios";
import React from "react";
import Config from "react-native-config";
import { connect } from "react-redux";

import { Container, Content, Spinner, Tab, Tabs } from "native-base";
import { StyleSheet, View } from "react-native";

import { ICoin, ICoinPrice, IUser } from "../models";
import { IRootState } from "../redux/store";

import CoinAlerts from "./CoinAlerts";
import CoinInfo from "./CoinInfo";
import CoinNews from "./CoinNews";
import CoinPrice from "./CoinPrice";

interface ICoinsPageProps {
    coinID: number;
    coinPrice: ICoinPrice;
    user: IUser;
}
interface ICoinsPageState {
    coin?: ICoin;
}

class PureCoinsList extends React.Component<ICoinsPageProps, ICoinsPageState> {
    public static navigatorStyle = {
        tabBarHidden: true,
    };

    constructor(props: ICoinsPageProps) {
        super(props);
        this.state = {
            coin: undefined,
        };
        this.getCoin();
    }
    public renderNoConnection() {
        return (
            <View>
                <Content>
                    <Spinner />
                </Content>
            </View>
        );
    }
    public render() {
        return (
            <Container>
                <Tabs initialPage={0}>
                    <Tab heading="Info">
                        {(this.state.coin) ? <CoinInfo coin={this.state.coin} /> : this.renderNoConnection()}
                    </Tab>
                    <Tab heading="News">
                        {(this.state.coin) ? <CoinNews coin={this.state.coin} /> : this.renderNoConnection()}
                    </Tab>
                    <Tab heading="Price">
                        {(this.state.coin) ? (
                            <CoinPrice coin={this.state.coin} coinPrice={this.props.coinPrice} />
                        ) : (
                                this.renderNoConnection()
                            )}
                    </Tab>
                    <Tab heading="Alerts">
                        {(this.state.coin) ? <CoinAlerts coin={this.state.coin} /> : this.renderNoConnection()}
                    </Tab>
                </Tabs>
            </Container>
        );
    }
    private getCoin = () => {
        axios
            .get<ICoin>(`${Config.API_SERVER}/coin/${this.props.coinID}`)
            .then((response) => {
                this.setState({
                    coin: response.data,
                });
            });
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
