import { Navigation } from "react-native-navigation";
import { Provider } from "react-redux";

import { store } from "./redux/store";
import CoinPage from "./screens/CoinPage";
import Coins from "./screens/Coins";
import News from "./screens/News";
import Settings from "./screens/Settings";

// register all screens of the app (including internal ones)
export function registerScreens() {
  Navigation.registerComponent("CoinMarketNews.Coins", () => Coins, store, Provider);
  Navigation.registerComponent("CoinMarketNews.CoinsPage", () => CoinPage, store, Provider);
  Navigation.registerComponent("CoinMarketNews.News", () => News, store, Provider);
  Navigation.registerComponent("CoinMarketNews.Settings", () => Settings, store, Provider);
}
