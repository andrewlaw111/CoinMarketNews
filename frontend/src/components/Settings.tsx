import React from "react";

import { Card, CardItem, Content, Icon, Right, Text } from "native-base";
import { Platform } from "react-native";

export default class Settings extends React.Component {
    public static navigatorStyle = {
        navBarTitleTextCentered: true,
        statusBarBlur: true,
        statusBarColor: "blue",
    };
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
