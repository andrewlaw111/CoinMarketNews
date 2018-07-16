import { knexType } from "../utils/init-app";

interface INews {
    id: number;
    title: string;
    content: string;
    source_id: string | null;
    coins: string[] | null;
    coins_id: number[] | null;
    link: string;
    created_at: string;
    counter: number;
}

export default class NewsService {
    public knex: knexType;

    constructor(knex: knexType) {
        this.knex = knex;
    }

    public getNews(token: string) {
        return this.knex
            .select("*")
            .from("news")
            .limit(50)
            .orderBy("created_at", "desc")
            .then((data: INews[]) => {
                const ids = data.map((news: INews) => {
                    return news.id;
                });
                // console.log(ids);
                const newsSource: any = [];
                const newsSourceID: any = [];
                return this.knex("coin_news")
                    .join("coin", "coin_news.coin_id", "=", "coin.id")
                    .select("*")
                    .whereIn("news_id", ids)
                    .then((coinNews: any) => {
                        // console.log(coinNews);
                        coinNews.map((coin: any) => {
                            if (!(coin.news_id in newsSource)) {
                                newsSource[coin.news_id] = [];
                                newsSourceID[coin.news_id] = [];
                            }
                            newsSource[coin.news_id].push(coin.symbol);
                            newsSourceID[coin.news_id].push(coin.coin_id);
                            return coin;
                        });
                        // console.log(newsSource);
                        data.map((news: INews) => {
                            news.coins = newsSource[news.id];
                            news.coins_id = newsSourceID[news.id];
                            news.content = news.content
                                .replace(/(\r\n\t|\n|\r\t)/gm, "")
                                .replace(/&quot;/g, '\"')
                                .substr(0, 200);
                            return news;
                        });
                        return data;
                    });
            })
            .catch((err) => {
                // tslint:disable-next-line:no-console
                console.log(err);
            });
    }

    public getCoinNews(token: string, coinID: string) {
        return this.knex("coin_news")
            .join("news", "coin_news.news_id", "=", "news.id")
            .select("*")
            .where("coin_news.coin_id", "=", coinID)
            .limit(50)
            .orderBy("created_at", "desc")
            .then((data: INews[]) => {
                data.map((news: INews) => {
                    news.content = news.content
                        .replace(/(\r\n\t|\n|\r\t)/gm, "")
                        .replace(/&quot;/g, '\"')
                        .substr(0, 200);
                    return news;
                });
                return data;
            });
    }
}
