import React from 'react';

import { AppRegistry } from 'react-native';
// import App from './App';

// AppRegistry.registerComponent('CoinMarketNews', () => App);

import { Navigation } from 'react-native-navigation';

import { registerScreens } from './screens';

registerScreens(); // this is where you register all of your app's screens

// start the app
Navigation.startTabBasedApp({
  tabs: [
    {
      label: 'Coins',
      screen: 'CoinMarketNews.Coins', // this is a registered name for a screen
      icon: require('./img/logo.svg'),
      selectedIcon: require('./img/logo.svg'), // iOS only
      title: 'Coins'
    },
    {
      label: 'News',
      screen: 'CoinMarketNews.News',
      icon: require('./img/logo.svg'),
      selectedIcon: require('./img/logo.svg'), // iOS only
      title: 'News'
    },
    {
      label: 'Settings',
      screen: 'CoinMarketNews.Settings',
      icon: require('./img/logo.svg'),
      selectedIcon: require('./img/logo.svg'), // iOS only
      title: 'Settings'
    }
  ]
});