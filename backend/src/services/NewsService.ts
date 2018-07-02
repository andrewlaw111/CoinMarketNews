import { knex } from "../utils/init-app";
interface INews {
    id: number;
    title: string;
    content: string;
    source_id: string | null;
    coins: string[] | null;
    link: string,
    created_at: string,
    counter: number
};

export default class NewsService {

    public getNews(token: string) {
        return knex
            .select('*')
            .from('news')
            .limit(50)
            .orderBy("created_at", "desc")
            .then((data: INews[]) => {
                const ids = data.map(function (news: INews) {
                    return news.id;
                })
                // console.log(ids);
                const news_source: any = [];
                return knex("coin_news")
                    .join('coin', 'coin_news.coin_id', '=', 'coin.id')
                    .select('*')
                    .whereIn('news_id', ids)
                    .then((coin_news: any) => {
                        // console.log(coin_news);
                        coin_news.map(function (coin: any) {
                            if (!(coin.news_id in news_source)) {
                                news_source[coin.news_id] = [];
                            }
                            news_source[coin.news_id].push(coin.symbol);
                            return coin;
                        });
                        // console.log(news_source);
                        data.map(function (news: INews) {
                            news.coins = news_source[news.id];
                            news.content = news.content.replace(/(\r\n\t|\n|\r\t)/gm,"").replace(/&quot;/g, '\"').substr(0, 200);
                            return news;
                        });
                        return data;
                    });
            })
            .catch((err) => {
                console.log(err);
            });
    };

    public getCoinNews(token: string, coinID: string) {
        return knex('coin_news')
            .join('news', 'coin_news.news_id', '=', 'news.id')
            .select('*')
            .where('coin_news.coin_id', '=', coinID)
            .limit(50)
            .orderBy("created_at", "desc")
            .then((data: INews[]) => {
                data.map(function (news: INews) {
                    news.content = news.content.replace(/(\r\n\t|\n|\r\t)/gm,"").replace(/&quot;/g, '\"').substr(0, 200);
                    return news;
                });
                return data;
            });
    }

    
}