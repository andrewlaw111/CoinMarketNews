import { Navigation } from 'react-native-navigation';
import { Provider } from "react-redux";

import CoinPage from './components/CoinPage';
import CoinsList from './components/Coins';
import News from './components/News';
import Settings from './components/Settings';
import Splash from './components/Splash';

import { store } from './redux/store';

// register all screens of the app (including internal ones)
export function registerScreens() {
  Navigation.registerComponent('CoinMarketNews.Splash', () => Splash);
  Navigation.registerComponent('CoinMarketNews.Coins', () => CoinsList, store, Provider);
  Navigation.registerComponent('CoinMarketNews.CoinsPage', () => CoinPage, store, Provider);
  Navigation.registerComponent('CoinMarketNews.News', () => News, store, Provider);
  Navigation.registerComponent('CoinMarketNews.Settings', () => Settings, store, Provider);
}