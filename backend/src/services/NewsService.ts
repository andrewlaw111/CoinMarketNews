import { knex } from "../utils/init-app";
interface INews {
    id: number;
    title: string;
    content: string;
    source_id: string | null;
    link: string,
    created_at: string,
    counter: number
};

export default class NewsService {

    public getNews(token: string) {
        return knex
            .select("*")
            .from("news")
            .limit(20)
            .orderBy("created_at", "desc")
            .then((data: INews[]) => {
                data.map(function (news: INews) {
                    news.content = news.content.substr(0, 200) + '...';
                    return news;
                });
                return data;
            })
            .catch((err) => {
                console.log(err);
            });
    };

    public getCoinNews(token: string, coinID: string) {
        return knex('coin_news')
            .join('news', 'coin_news.news_id', '=', 'news.id')
            .select('news.*')
            .where('coin_news.coin_id', '=', coinID)
            .limit(20)
            .orderBy("created_at", "desc")
            .then((data: INews[]) => {
                data.map(function (news: INews) {
                    news.content = news.content.substr(0, 200) + '...';
                    return news;
                });
                return data;
            });
    }
}
