import React from 'react';

import { Card, CardItem, Content, Icon, Right, Text } from 'native-base';

export default class News extends React.Component {
    public render() {
        return (
            <Content>
                <Card>
                    <CardItem>
                        <Icon active={true} name="logo-googleplus" />
                        <Text>News</Text>
                        <Right>
                            <Icon name="arrow-forward" />
                        </Right>
                    </CardItem>
                </Card>
            </Content>
        );
    }
}