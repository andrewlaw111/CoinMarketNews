import { Navigation } from 'react-native-navigation';
import { Provider } from "react-redux";

import Coins from './components/Coins';
import News from './components/News';
import Settings from './components/Settings';
import { store } from './redux/store';

// register all screens of the app (including internal ones)
export function registerScreens() {
  Navigation.registerComponent('CoinMarketNews.Coins', () => Coins, store, Provider);
  Navigation.registerComponent('CoinMarketNews.News', () => News, store, Provider);
  Navigation.registerComponent('CoinMarketNews.Settings', () => Settings, store, Provider);
}