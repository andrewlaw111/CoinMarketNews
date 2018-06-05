import { Navigation } from 'react-native-navigation';

import Coins from './components/Coins';
import News from './components/News';
import Settings from './components/Settings';

// register all screens of the app (including internal ones)
export function registerScreens() {
  Navigation.registerComponent('CoinMarketNews.Coins', () => Coins);
  Navigation.registerComponent('CoinMarketNews.News', () => News);
  Navigation.registerComponent('CoinMarketNews.Settings', () => Settings);
}