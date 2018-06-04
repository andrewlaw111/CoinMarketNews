// import React from 'react';

// import { Container, Button, Text, Footer, FooterTab, Content, Icon, Header } from 'native-base';


// import Home from './src/components/Home';
// import TabOne from './src/components/TabOne';

// export default class GeneralExample extends React.Component {
//   render() {
//     return (
//       <Container>
//         <Header />
//         <Content>
//           <Home />
//         </ Content >
//         <Footer>
//           <FooterTab>
//             <Button onPress={() => this.props.navigation.navigate('Coins')}>
//               <Icon type="MaterialCommunityIcons" name="coin" />
//             </Button>
//             <Button onPress={() => this.props.navigation.navigate('News')}>
//               <Icon type="MaterialCommunityIcons" name="newspaper" />
//             </Button>
//             <Button onPress={() => this.props.navigation.navigate('Settings')}>
//               <Icon type="MaterialCommunityIcons" name="menu" />
//             </Button>
//           </FooterTab>
//         </Footer>
//       </Container>
//     );
//   };
// };
import React from 'react';

import { YellowBox } from 'react-native';
YellowBox.ignoreWarnings(['Warning: isMounted(...) is deprecated', 'Module RCTImageLoader']);

import { TabNavigator, TabBarBottom } from 'react-navigation';

import Coins from './src/components/Coins';
import News from './src/components/News';
import Settings from './src/components/Settings';
import { View } from 'native-base';

let RootStack = TabNavigator(
  {
    Coins: { screen: Coins },
    News: { screen: News },
    Settings: { screen: Settings },
  },
  {
    tabBarOptions: {
      activeTintColor: '#6200EE',
      tabStyle: {
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: '#eee',
      },
      labelStyle: {
        fontSize: 15,
        margin: 0
      },
      inactiveTintColor: 'gray',
      showIcon: false,
    },
    lazy: false,
    tabBarComponent: TabBarBottom,
    tabBarPosition: 'bottom',
    animationEnabled: false,
    swipeEnabled: true,
  }
);

export default class App extends React.Component {
  render() {
    return (
      <RootStack />
    )
  }
}