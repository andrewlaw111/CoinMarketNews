import { Navigation } from 'react-native-navigation';
import FontAwesomeIcon from "react-native-vector-icons/FontAwesome";

import { getCoins } from './redux/actions/coins';
import { getNews } from './redux/actions/news';
import { getUser } from './redux/actions/user';
import { registerScreens } from './screens';



registerScreens(); // this is where you register all of your app's screens

// start the app
Promise.all([
  FontAwesomeIcon.getImageSource("user-circle-o", 20, "#3db9f7"),
  FontAwesomeIcon.getImageSource("comment", 20, "#3db9f7"),
  FontAwesomeIcon.getImageSource("wrench", 20, "#3db9f7"),
  getUser(),
  getNews(),
  getCoins(),
]).then((sources) => {
  // start the app
  Navigation.startTabBasedApp({
    tabs: [
      {
        icon: sources[0],
        label: 'Coins',
        screen: 'CoinMarketNews.Coins', // this is a registered name for a screen
        selectedIcon: sources[0], // iOS only
        title: 'Coins'
      },
      {
        icon: sources[1],
        label: 'News',
        screen: 'CoinMarketNews.News',
        selectedIcon: sources[1], // iOS only
        title: 'News'
      },
      {
        icon: sources[2],
        label: 'Settings',
        screen: 'CoinMarketNews.Settings',
        selectedIcon: sources[2], // iOS only
        title: 'Settings'
      }
    ]
  })
});