import { Navigation } from "react-native-navigation";
import FontAwesomeIcon from "react-native-vector-icons/FontAwesome";

import { getCoins } from "./redux/actions/coins";
import { loadFavourites } from "./redux/actions/favourites";
import { getNews } from "./redux/actions/news";
import { loadSettings } from "./redux/actions/settings";
import { getUser } from "./redux/actions/user";

import { ISettings, IUser } from "./models";

import { registerScreens } from "./screens";

registerScreens(); // this is where you register all of your app's screens

import OneSignal from "react-native-onesignal";
import { loadAlerts } from "./redux/actions/alerts";
OneSignal.init("155944be-3bde-4703-82f1-2545b31dc1ed");

let tabBarColours: { tabBarButtonColor: string, tabBarSelectedButtonColor: string, tabBarBackgroundColor: string, };

let colours: {
    backgroundColor: string, navBarTextColor: string, screenBackgroundColor: string, statusBarTextColorScheme: string
};
function setColour(darkMode: boolean) {
    if (darkMode) {
        colours = {
            backgroundColor: "#343a44",
            navBarTextColor: "#FFF",
            screenBackgroundColor: "#454951",
            statusBarTextColorScheme: "light",
        };
        tabBarColours = {
            tabBarBackgroundColor: "#343a44",
            tabBarButtonColor: "#fff",
            tabBarSelectedButtonColor: "#2874F0",
        };
    } else {
        colours = {
            backgroundColor: "#F8F8F8",
            navBarTextColor: "#000",
            screenBackgroundColor: "#F8F8F8",
            statusBarTextColorScheme: "dark",
        };
        tabBarColours = {
            tabBarBackgroundColor: "#F8F8F8",
            tabBarButtonColor: "#343a44",
            tabBarSelectedButtonColor: "#2874F0",
        };
    }
}
// start the app
Promise.all([
    getUser()
        .then((data: IUser) => {
            loadAlerts(data);
            getNews();
        }),
    loadFavourites(),
    FontAwesomeIcon.getImageSource("newspaper-o", 26, "#3db9f7"),
    FontAwesomeIcon.getImageSource("cog", 30, "#3db9f7"),
    loadSettings()
        .then((settings: ISettings) => {
            if (settings) {
                setColour(settings.darkMode);
            } else {
                setColour(false);
            }
            // [CORE REVIEW] The promise below is not waited
            getCoins(settings, 0, 2000);
        }),
])
    .then((sources) => {
        // start the app
        Navigation.startTabBasedApp({
            tabs: [
                {
                    icon: require("./coin.png"),
                    label: "Coins",
                    screen: "CoinMarketNews.Coins", // this is a registered name for a screen
                    selectedIcon: require("./coin.png"), // iOS only
                },
                {
                    icon: sources[2],
                    label: "News",
                    screen: "CoinMarketNews.News",
                    selectedIcon: sources[2], // iOS only
                    title: "Coin Market News",
                },
                {
                    icon: sources[3],
                    label: "Settings",
                    screen: "CoinMarketNews.Settings",
                    selectedIcon: sources[3], // iOS only
                    title: "Settings",
                },
            ],
            tabsStyle: {
                navBarBackgroundColor: colours.backgroundColor,
                navBarTextColor: colours.navBarTextColor,
                screenBackgroundColor: colours.screenBackgroundColor,
                statusBarTextColorScheme: colours.statusBarTextColorScheme,
                tabBarBackgroundColor: tabBarColours.tabBarBackgroundColor,
                tabBarButtonColor: tabBarColours.tabBarButtonColor,
                tabBarSelectedButtonColor: tabBarColours.tabBarSelectedButtonColor,
            },
            appStyle: { // optional, add this if s if you want to style the tab bar beyond the defaults
                keepStyleAcrossPush: false,
                navBarBackgroundColor: colours.backgroundColor,
                navBarTextColor: colours.navBarTextColor,
                screenBackgroundColor: colours.screenBackgroundColor,
                statusBarColor: colours.backgroundColor,
                statusBarTextColorScheme: colours.statusBarTextColorScheme,
                tabBarBackgroundColor: tabBarColours.tabBarBackgroundColor,
                tabBarButtonColor: tabBarColours.tabBarButtonColor,
                tabBarSelectedButtonColor: tabBarColours.tabBarSelectedButtonColor,
            },
            animationType: "none",
        });
    }).catch((err) => {
        // tslint:disable-next-line:no-console
        // [CODE REVIEW] should show some error screen maybe
        console.log("error", err);
    });
