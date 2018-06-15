import React, { Component } from 'react';
import {
    Platform,
    StyleSheet,
    View
} from 'react-native';
import { Container, Header, Title, Content, Footer, FooterTab, Grid, Col, Button, Segment, Left, Right, Body, Icon, Tab, Tabs, TabHeading, List, ListItem, Thumbnail, Text, Badge } from 'native-base';

export default class Price extends Component {
    render() {
        return (
            <View>
                <Grid>
                    <Col style={{ flex: 0.4 }}>
                        <Segment>
                            <Button style={styles.smallpadding} first active><Text style={styles.nopadding}>Cap</Text></Button>
                            <Button style={styles.smallpadding}><Text style={styles.nopadding}>Gain</Text></Button>
                            <Button style={styles.smallpadding} last><Text style={styles.nopadding}>Drop</Text></Button>
                        </Segment>
                    </Col>
                    <Col style={{ flex: 0.25 }}>
                        <Segment>
                            <Button style={styles.smallpadding} first active><Text style={styles.nopadding}>USD</Text></Button>
                            <Button style={styles.smallpadding} last><Text style={styles.nopadding}>BTC</Text></Button>
                        </Segment>
                    </Col>
                    <Col style={{ flex: 0.35 }}>
                        <Segment>
                            <Button style={styles.smallpadding} first active><Text style={styles.nopadding}>1W</Text></Button>
                            <Button style={styles.smallpadding}><Text style={styles.nopadding}>1D</Text></Button>
                            <Button style={styles.smallpadding} last><Text style={styles.nopadding}>1M</Text></Button>
                        </Segment>
                    </Col>
                </Grid>
                <List>
                    <ListItem avatar>
                        <Left>
                            <Thumbnail source={{ uri: 'https://raw.githubusercontent.com/cjdowner/cryptocurrency-icons/master/128/icon/btc.png' }} />
                        </Left>
                        <Body>
                            <Text>Bitcoin</Text>
                            <Text note>Doing what you like will always keep you happy . .</Text>
                        </Body>
                        <Right>
                            <Text note>3:43 pm</Text>
                        </Right>
                    </ListItem>
                    <ListItem avatar>
                        <Left>
                            <Thumbnail source={{ uri: 'https://raw.githubusercontent.com/cjdowner/cryptocurrency-icons/master/128/icon/eth.png' }} />
                        </Left>
                        <Body>
                            <Text>Ethereum</Text>
                            <Text note>Doing what you like will always keep you happy . .</Text>
                        </Body>
                        <Right>
                            <Text note>3:43 pm</Text>
                        </Right>
                    </ListItem>
                </List>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    nopadding: {
        paddingRight: 0,
        paddingLeft: 0,
    },
    smallpadding: {
        paddingRight: 5,
        paddingLeft: 5,
    }
});
