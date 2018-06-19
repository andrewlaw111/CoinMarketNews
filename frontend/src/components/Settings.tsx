import React from "react";

import { Card, CardItem, Content, Icon, Right, Text } from "native-base";

export default class Settings extends React.Component {
    public constructor(props: {}) {
        super(props);
    }
    public render() {
        return (
            <Content>
                <Card>
                    <CardItem>
                        <Icon active={true} name="logo-googleplus" />
                        <Text>Settings</Text>
                        <Right>
                            <Icon name="arrow-forward" />
                        </Right>
                    </CardItem>
                </Card>
            </Content>
        );
    }
}
