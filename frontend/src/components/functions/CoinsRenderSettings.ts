import { ICoinPrice } from "../../models";

// Format 
// {
//     Fiat: {
//         1W, 1D, 1H
//     }
//     Crypto: {
//         1W, 1D, 1H
//     },
// }
interface IDisplayCoinOptions {
    [key: string]: {
        [key: string]: {
            coinPrice: (item: ICoinPrice) => string;
            percentageChange: (item: ICoinPrice) => string;
        },
    },
}
const displayCoinOptions: IDisplayCoinOptions = {
    0: {
        0: {
            coinPrice: (item: ICoinPrice) => `${item.price_fiat.price}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_fiat.percent_change_7d).toFixed(2)}`,
        },

        1: {
            coinPrice: (item: ICoinPrice) => `${item.price_fiat.price}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_fiat.percent_change_24h).toFixed(2)}`,
        },
        2: {
            coinPrice: (item: ICoinPrice) => `${item.price_fiat.price}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_fiat.percent_change_1h).toFixed(2)}`,
        }
    },
    1: {
        0: {
            coinPrice: (item: ICoinPrice) => `${item.price_crypto.price}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_crypto.percent_change_7d).toFixed(2)}`,
        },

        1: {
            coinPrice: (item: ICoinPrice) => `${item.price_crypto.price}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_crypto.percent_change_24h).toFixed(2)}`,
        },
        2: {
            coinPrice: (item: ICoinPrice) => `${item.price_crypto.price}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_crypto.percent_change_1h).toFixed(2)}`,
        }
    },
};

export default displayCoinOptions