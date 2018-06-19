import React from 'react';
import { Navigator } from 'react-native-navigation';
import { connect } from 'react-redux';

import { Body, Button, Col, Grid, Left, List, ListItem, Right, Segment, Text, Thumbnail } from 'native-base';
import { StyleSheet, View } from 'react-native';

import { ICoin, IUser } from '../models';
import { getCoins } from "../redux/actions/coins";
import { IRootState } from "../redux/store";

interface ICoinsListProps {
    coins: ICoin[];
    user: IUser;
    navigator: Navigator;
}

class PureCoinsList extends React.Component<ICoinsListProps>{
    public renderCoinList = (item: ICoin, _SECTIONID: string | number, rowID: string | number) => (
        <ListItem key={rowID} avatar={true} onPress={this.handlePress.bind(this, rowID)}>
            <Left>
                <Thumbnail source={{ uri: `http://10.0.0.22:8000/icon/${item.symbol.toLocaleLowerCase()}.png` }} />
            </Left>
            <Body>
                <Text>{item.name}</Text>
                <Text note={true}>$3.00</Text>
            </Body>
            <Right>
                <Text note={true}>$3.00</Text>
            </Right>
        </ListItem>
    );

    public render() {
        if (this.props.coins) {
            return (
                <View>
                    {/* <Grid>
                        <Col style={{ flex: 0.4 }}>
                            <Segment>
                                <Button style={styles.smallpadding} first={true} active={true}>
                                    <Text style={styles.nopadding}>Cap</Text>
                                </Button>
                                <Button style={styles.smallpadding}>
                                    <Text style={styles.nopadding}>Gain</Text>
                                </Button>
                                <Button style={styles.smallpadding} last={true}>
                                    <Text style={styles.nopadding}>Drop</Text>
                                </Button>
                            </Segment>
                        </Col>
                        <Col style={{ flex: 0.25 }}>
                            <Segment>
                                <Button style={styles.smallpadding} first={true} active={true}>
                                    <Text style={styles.nopadding}>USD</Text>
                                </Button>
                                <Button style={styles.smallpadding} last={true}>
                                    <Text style={styles.nopadding}>BTC</Text>
                                </Button>
                            </Segment>
                        </Col>
                        <Col style={{ flex: 0.35 }}>
                            <Segment>
                                <Button style={styles.smallpadding} first={true} active={true}>
                                    <Text style={styles.nopadding}>1W</Text>
                                </Button>
                                <Button style={styles.smallpadding}>
                                    <Text style={styles.nopadding}>1D</Text>
                                </Button>
                                <Button style={styles.smallpadding} last={true}>
                                    <Text style={styles.nopadding}>1M</Text>
                                </Button>
                            </Segment>
                        </Col>
                    </Grid> */}
                    <List dataArray={this.props.coins}
                        // tslint:disable-next-line:jsx-no-lambda
                        renderRow={this.renderCoinList} />
                </View>
            );
        } else {
            return (
                <View>
                    <Text>CoinMarketNews was unable to retrieve data.</Text>
                </View>
            );
        };
    };

    public handlePress = (coinID: number) => {
        this.props.navigator.push({
            animated: false,
            backButtonHidden: false,
            backButtonTitle: undefined,
            passProps: { coinID },
            screen: "CoinMarketNews.CoinsPage",
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
    listStyle: {
        paddingTop: -100,
    },
    nopadding: {
        paddingLeft: 0,
        paddingRight: 0,
    },
    smallpadding: {
        paddingLeft: 5,
        paddingRight: 5,
    },
});
