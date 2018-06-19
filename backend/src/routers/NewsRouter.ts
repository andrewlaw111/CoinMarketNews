import * as express from "express";
import INews from "../services/NewsService";

export default class NewsRouter {
    public newsService: any;

    public constructor(newsService: any) {
        this.newsService = newsService;
    }

    public router() {
        const router = express.Router();
        router.get("/", this.getNews);
        router.get("/coin", this.getCoinNews);
        return router;
    }
    private getNews = (req: express.Request, res: express.Response) => {
        return this.newsService.getNews(req.headers.token)
            .then((data: INews[]) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private getCoinNews = (req: express.Request, res: express.Response) => {
        return this.newsService.getCoinNews(req.headers.token, req.params.coinID)
            .then((data: INews) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
}
