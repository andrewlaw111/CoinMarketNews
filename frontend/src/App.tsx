import { Navigation } from "react-native-navigation";
import FontAwesomeIcon from "react-native-vector-icons/FontAwesome";

import { getCoins } from "./redux/actions/coins";
import { getNews } from "./redux/actions/news";
import { getUser } from "./redux/actions/user";
import { registerScreens } from "./screens";

registerScreens(); // this is where you register all of your app's screens

Navigation.startSingleScreenApp({
  animationType: "slide-down", // optional, add transition animation to root change: 'none', 'slide-down', 'fade'
  screen: {
    screen: "CoinMarketNews.Splash", // unique ID registered with Navigation.registerScreen
    title: "Welcome", // title of the screen as appears in the nav bar (optional)
  },
});

// start the app
Promise.all([
  getUser().then(() => {
    getCoins();
    getNews();
  }),

  // FontAwesomeIcon.getImageSource("star", 20, "#3db9f7"),
  FontAwesomeIcon.getImageSource("newspaper-o", 20, "#3db9f7"),
  FontAwesomeIcon.getImageSource("cog", 20, "#3db9f7"),
]).then((sources) => {
  console.log(sources);
  // start the app
  Navigation.startTabBasedApp({
    tabs: [
      {
        icon: require("./coin.png"),
        label: "Coins",
        screen: "CoinMarketNews.Coins", // this is a registered name for a screen
        selectedIcon: require("./coin.png"), // iOS only
        title: "Coins",
      },
      {
        icon: sources[1],
        label: "News",
        screen: "CoinMarketNews.News",
        selectedIcon: sources[0], // iOS only
        title: "News",
      },
      {
        icon: sources[2],
        label: "Settings",
        screen: "CoinMarketNews.Settings",
        selectedIcon: sources[1], // iOS only
        title: "Settings",
      },
    ],
  });
});
