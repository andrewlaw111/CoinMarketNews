import * as express from "express";

export default class CoinRouter {
    public coinService: any;

    public constructor(coinService: any) {
        this.coinService = coinService;
    }

    public router() {
        const router = express.Router();
        router.get("/", this.getAllCoins);
        router.get("/:coinID", this.getSpecificCoin);
        return router;
    }
    private getAllCoins = (req: express.Request, res: express.Response) => {
        return this.coinService.getAllCoins(req.body.token)
            .then((data: any) => res.json)
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private getSpecificCoin = (req: express.Request, res: express.Response) => {
        return this.coinService.getSpecificCoin()
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
}
