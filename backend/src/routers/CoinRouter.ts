import * as express from "express";

export default class CoinRouter {
    public coinService: any;

    public constructor(coinService: any) {
        this.coinService = coinService;
    }

    public router() {
        const router = express.Router();
        router.get("/", this.getAllCoins.bind(this));
        router.get("/:coinID", this.getSpecificCoin.bind(this));
        return router;
    }
    public getAllCoins(req: any, res: any) {
        return this.coinService.getAllCoins()
            .then((data: any) => res.json(data))
            .catch((err: any) => res.status(500).json(err));
    }
    public getSpecificCoin(req: any, res: any) {
        return this.coinService.getSpecificCoin()
            .then((data: any) => res.json(data))
            .catch((err: any) => res.status(500).json(err));
    }
}
