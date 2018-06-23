import { ICoinPrice } from "../models";

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
            amountCapChange: (item: ICoinPrice) => string;
            coinPrice: (item: ICoinPrice) => string;
            percentageChange: (item: ICoinPrice) => string;
        },
    },
}
const displayCoinOptions: IDisplayCoinOptions = {
    0: {
        0: {
            coinPrice: (item: ICoinPrice) => `${item.price_fiat.price}`,
            amountCapChange: (item: ICoinPrice) => `${(item.price_fiat.price / (100 + item.price_crypto.percent_change_7d)).toFixed(6)}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_fiat.percent_change_7d).toFixed(2)}`,
        },

        1: {
            coinPrice: (item: ICoinPrice) => `${item.price_fiat.price}`,
            amountCapChange: (item: ICoinPrice) => `${(item.price_fiat.price / (100 + item.price_fiat.percent_change_24h)).toFixed(6)}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_fiat.percent_change_24h).toFixed(2)}`,
        },
        2: {
            coinPrice: (item: ICoinPrice) => `${item.price_fiat.price}`,
            amountCapChange: (item: ICoinPrice) => `${(item.price_fiat.price / (100 + item.price_fiat.percent_change_1h)).toFixed(6)}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_fiat.percent_change_1h).toFixed(2)}`,
        }
    },
    1: {
        0: {
            coinPrice: (item: ICoinPrice) => `${item.price_crypto.price}`,
            amountCapChange: (item: ICoinPrice) => `${(item.price_crypto.price / (100 + item.price_crypto.percent_change_7d)).toFixed(6)}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_crypto.percent_change_7d).toFixed(2)}`,
        },

        1: {
            coinPrice: (item: ICoinPrice) => `${item.price_crypto.price}`,
            amountCapChange: (item: ICoinPrice) => `${(item.price_crypto.price / (100 + item.price_crypto.percent_change_24h)).toFixed(6)}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_crypto.percent_change_24h).toFixed(2)}`,
        },
        2: {
            coinPrice: (item: ICoinPrice) => `${item.price_crypto.price}`,
            amountCapChange: (item: ICoinPrice) => `${(item.price_crypto.price / (100 + item.price_crypto.percent_change_1h)).toFixed(6)}`,
            percentageChange: (item: ICoinPrice) => `${(item.price_crypto.percent_change_1h).toFixed(2)}`,
        }
    },
};

export default displayCoinOptions