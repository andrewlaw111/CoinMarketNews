import * as express from "express";
import ICoin from "../services/PriceService";

export default class PriceRouter {
    public priceService: any;

    public constructor(priceService: any) {
        this.priceService = priceService;
    }

    public router() {
        const router = express.Router();
        router.get("/", this.getPrice);
        router.get("/:coinID", this.getSpecificCoin);
        return router;
    }
    private getPrice = (req: express.Request, res: express.Response) => {
        // console.log('price');
        // console.log(req.headers);
        return this.priceService.getPrice(req.headers.token, req.headers.fiat, req.headers.crypto, req.headers.start, req.headers.limit)
            .then((data: ICoin[]) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private getSpecificCoin = (req: express.Request, res: express.Response) => {
        return this.priceService.getSpecificCoin(req.headers.token, req.params.coinID, req.headers.fiat, req.headers.crypto)
            .then((data: ICoin) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
}
