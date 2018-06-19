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
        console.log(token);
        return knex
            .select("*")
            .from("news")
            .then((data: INews[]) => {
                console.log(data);
                return data;
            })
            .catch((err) => {
                console.log(err);
            });
    };

    // No CoinID yet DO NOT USE
    public getCoinNews(token: string, coinID: string) {
        return knex
            .select("*")
            .from("news")
            .orderBy("rank", "asc").then((data: INews[]) => {
                console.log(data);
                return data;
            });
    }
}
