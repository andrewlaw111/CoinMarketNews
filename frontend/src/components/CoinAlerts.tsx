import React from "react";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, Text, StyleProvider } from "native-base";
import { StyleSheet, View } from "react-native";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsAlertsProps {
    coin: ICoin;
    darkMode: boolean;
}

class PureCoinAlerts extends React.Component<ICoinsAlertsProps> {
    public styles: typeof styles;

    public componentWillMount() {
        this.styles = (this.props.darkMode) ? darkStyles : styles;
    }
    public componentWillReceiveProps(nextProps: ICoinsAlertsProps) {
        this.styles = (this.props.darkMode) ? darkStyles : styles;
    }

    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <Container style={this.styles.alertsPage}>
                    <Card style={this.styles.card}>
                        <CardItem style={this.styles.cardItem} header={true}>
                            <Text>{this.props.coin.name}</Text>
                        </CardItem>
                        <CardItem style={this.styles.cardItem}>
                            <Body>
                                <Text>Your text here</Text>
                            </Body>
                        </CardItem>
                    </Card>
                    <Card style={this.styles.card}>
                        <CardItem style={this.styles.cardItem} header={true}>
                            <Text>NativeBase</Text>
                        </CardItem>
                        <CardItem style={this.styles.cardItem}>
                            <Body>
                                <Text>
                                    Your text here
                            </Text>
                            </Body>
                        </CardItem>
                    </Card>
                    <Card style={this.styles.card}>
                        <CardItem style={this.styles.cardItem} header={true}>
                            <Text>NativeBase</Text>
                        </CardItem>
                        <CardItem style={this.styles.cardItem}>
                            <Body>
                                <Text>
                                    Your text here
                                    </Text>
                            </Body>
                        </CardItem>
                    </Card>
                </Container>
            </StyleProvider>
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

const styleTemplate = (darkMode: boolean) => StyleSheet.create({
    card: {
        borderColor: (darkMode) ? "#41444c" : null,
        backgroundColor: (darkMode) ? "#454951" : null,
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : null,
    },
    cardText: {
        color: (darkMode) ? "#F8F8F8" : null
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
    alertsPage: {
        backgroundColor: (darkMode) ? "#2f343f" : null,
        flex: 1,
    },
    webView: {
        borderColor: (darkMode) ? "#41444c" : null,
        backgroundColor: (darkMode) ? "#2f343f" : null,
        height: 300
    }
});


const styles = styleTemplate(false);
const darkStyles = styleTemplate(true);