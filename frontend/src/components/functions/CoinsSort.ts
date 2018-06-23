import { ICoinPrice, ICoin } from "../models";

interface IDisplayCoinOptions {
    0: (coins: ICoinPrice[]) => ICoinPrice[];
    1: {
        [key: string]: {
            [key: string]: (coins: ICoinPrice[]) => ICoinPrice[];
        }
    };
    2: {
        [key: string]: {
            [key: string]: (coins: ICoinPrice[]) => ICoinPrice[];
        }
    };
};
let coinCache: { [key: string]: ICoinPrice[] } = {};

export const cacheSorts = (coins: ICoinPrice[]) => {
    const allSettings = ["000", "001", "002", "010", "011", "012", "100", "101", "102", "110", "111", "112", "200", "201", "202", "210", "211", "212"];
    allSettings.forEach((setting) => {
        let settingArray = coins.slice();
        if (setting.split("")[0] === "0") {
            settingArray = sortMap[0](settingArray);
        } else if (setting.split("")[0] === "1") {
            settingArray = sortMap[1][setting.split("")[1]][setting.split("")[2]](settingArray);
        } else {
            settingArray = sortMap[2][setting.split("")[1]][setting.split("")[2]](settingArray);
        };
        coinCache[setting] = settingArray;
    });
}

const sortCoins = (setting: string, coins: ICoinPrice[]) => {
    if (coinCache[setting]) {
        return coinCache[setting];
    } else {
        return coins;
    }
}

const sortMap: IDisplayCoinOptions = {
    0: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => coinA.rank - coinB.rank),
    1: {
        0: {
            0: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinB.price_fiat.percent_change_7d - coinA.price_fiat.percent_change_7d
            }),
            1: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinB.price_fiat.percent_change_24h - coinA.price_fiat.percent_change_24h
            }),
            2: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinB.price_fiat.percent_change_1h - coinA.price_fiat.percent_change_1h
            }),
        },

        1: {
            0: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinB.price_crypto.percent_change_7d - coinA.price_crypto.percent_change_7d
            }),
            1: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinB.price_crypto.percent_change_24h - coinA.price_crypto.percent_change_24h
            }),
            2: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinB.price_crypto.percent_change_1h - coinA.price_crypto.percent_change_1h
            }),
        },
    },
    2: {
        0: {
            0: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinA.price_fiat.percent_change_7d - coinB.price_fiat.percent_change_7d
            }),
            1: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinA.price_fiat.percent_change_24h - coinB.price_fiat.percent_change_24h
            }),
            2: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinA.price_fiat.percent_change_1h - coinB.price_fiat.percent_change_1h
            }),
        },
        1: {
            0: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinA.price_crypto.percent_change_7d - coinB.price_crypto.percent_change_7d
            }),
            1: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinA.price_crypto.percent_change_24h - coinB.price_crypto.percent_change_24h
            }),
            2: (coins: ICoinPrice[]) => coins.sort((coinA, coinB) => {
                return coinA.price_crypto.percent_change_1h - coinB.price_crypto.percent_change_1h
            }),
        },
    }
};

export default sortCoins;