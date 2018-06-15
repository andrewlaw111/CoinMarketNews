/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
    Platform,
    StyleSheet,
    View
} from 'react-native';
import { Container, Header, Title, Content, Footer, FooterTab, Grid, Col, Button, Segment, Left, Right, Body, Icon, Tab, Tabs, TabHeading, List, ListItem, Thumbnail, Text, Badge } from 'native-base';
import Price from './price';

export default class App extends Component {
    myFunction() {
        navigator.geolocation.getCurrentPosition(function (position) {
            alert(position.coords.latitude + '/' + position.coords.longitude);
        });
    }
    render() {
        return (
            <Container>
                <Header hasTabs style={{ height: 30 }} />
                <Tabs>
                    <Tab heading={<TabHeading><Icon type="Ionicons" name="ios-star" /><Text>Favorite</Text></TabHeading>}>
                        <Content>
                            <Price />
                        </Content>
                    </Tab>
                    <Tab heading={<TabHeading><Icon type="Foundation" name="graph-trend" /><Text>Market</Text></TabHeading>}>
                        <Content>
                            <Price />
                        </Content>
                    </Tab>
                </Tabs>
                <Footer>
                    <FooterTab>
                        <Button active>
                            <Icon active type="Foundation" name="graph-trend" onPress={this.myFunction} />
                        </Button>
                        <Button>
                            <Icon type="FontAwesome" name="newspaper-o" onPress={this.myFunction} />
                        </Button>
                        <Button onPress={this.myFunction} >
                            <Icon type="FontAwesome" name="cog" />
                        </Button>
                    </FooterTab>
                </Footer>
            </Container>
        );
    }
}

const styles = StyleSheet.create({
    // container: {
    //     flex: 1,
    //     paddingTop: 2
    // },
});
