import React from 'react';
import { Navigator } from 'react-native-navigation';
import { connect } from 'react-redux';

import { Body, Card, CardItem, List, ListItem, Text } from 'native-base';
import { Linking, StyleSheet, View } from 'react-native';

import { INews, IUser } from '../models';
import { IRootState } from '../redux/store';

interface INewsListProps {
    news: INews[];
    user: IUser;
    navigator: Navigator;
}

class PureNewsList extends React.Component<INewsListProps>{
    public renderNewsList = (item: INews, _SECTIONID: string | number, rowID: number) => (
        <ListItem key={rowID} avatar={true}>
            <Card>
                <CardItem header={true}>
                    <Text>{this.props.news[rowID].title}</Text>
                </CardItem>
                <CardItem>
                    <Body>
                        <Text>
                            {this.props.news[rowID].content}
                        </Text>
                    </Body>
                </CardItem>
                <CardItem button={true} footer={true} onPress={this.handleLinkPress.bind(this, this.props.news[rowID].link)}>
                    <Text>Open in Browser</Text>
                </CardItem>
            </Card>
        </ListItem>
    );
    public render() {
        console.log(this.props.news);
        if (this.props.news) {
            return (
                <View>
                    <List dataArray={this.props.news}
                        // tslint:disable-next-line:jsx-no-lambda
                        renderRow={this.renderNewsList} />
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

    public handleLinkPress = (link: string) => {
        Linking.openURL(link);
    }
}

const mapStateToProps = (state: IRootState) => {
    return {
        news: state.news.news,
        user: state.user.user,
    };
};

const NewsList = connect(mapStateToProps)(PureNewsList);
export default NewsList;

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
    }
});
