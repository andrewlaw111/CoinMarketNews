import * as express from "express";
import { IUser, IUserToken } from "../services/UserService";

export default class UserRouter {
    public userService: any;

    public constructor(userService: any) {
        this.userService = userService;
    }

    public router() {
        const router = express.Router();
        router.route("/")
            .get(this.getUser)
            .patch(this.changeNotifications)
            .post(this.createUser)
            // .put(this.updateUser);
        router.route("/price_alert/")
            .post(this.createPriceAlert)
            .delete(this.deletePriceAlert)
            .put(this.updatePriceAlert);
        router.route("/news_alert/")
            .post(this.createNewsAlert)
            .delete(this.deleteNewsAlert);
        // router.route("/favourites/")
        //     .post(this.saveFavourite)
        //     .delete(this.deleteFavourite);
        return router;
    }
    private getUser = (req: express.Request, res: express.Response) => {
        console.log('Get user')
        return this.userService.getUser(req.headers.token)
            .then((data: IUser) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private changeNotifications = (req: express.Request, res: express.Response) => {
        console.log(req.headers)
        return this.userService.changeNotifications(req.headers.token, req.body.data.notifications)
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }

    private createUser = (req: express.Request, res: express.Response) => {
        return this.userService.createUser()
            .then((data: IUserToken) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    // private updateUser = (req: express.Request, res: express.Response) => {
    //     return this.userService.updateUser(
    //         req.headers.token,
    //         req.body.fiat_currency_id,
    //         req.body.coin_currency_id,
    //         req.body.email,
    //         req.body.password,
    //         req.body.notifications,
    //     )
    //         .then((data: IUser) => res.json(data))
    //         .catch((err: express.Errback) => res.status(500).json(err));
    // }
    private createPriceAlert = (req: express.Request, res: express.Response) => {
        return this.userService.createPriceAlert(
            req.headers.token,
            req.body.coinmarketcap_id,
            req.body.currency_symbol,
            req.body.upper,
            req.body.price_point,
            req.body.active
        )
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private deletePriceAlert = (req: express.Request, res: express.Response) => {
        return this.userService.deletePriceAlert(req.headers.token, req.body.priceID)
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private updatePriceAlert = (req: express.Request, res: express.Response) => {
        return this.userService.updatePriceAlert(
            req.headers.token,
            req.body.priceID,
            req.body.active
        )
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private createNewsAlert = (req: express.Request, res: express.Response) => {
        return this.userService.createNewsAlert(req.headers.token, req.body.coinID)
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private deleteNewsAlert = (req: express.Request, res: express.Response) => {
        return this.userService.deleteNewsAlert(req.headers.token, req.body.coinID)
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    // private deleteFavourite = (req: express.Request, res: express.Response) => {
    //     return this.userService.deleteFavourite(req.headers.token, req.body.coinID)
    //         .then((data: any) => res.json(data))
    //         .catch((err: express.Errback) => res.status(500).json(err));
    // }
    // private saveFavourite = (req: express.Request, res: express.Response) => {
    //     return this.userService.saveFavourite(req.headers.token, req.body.data.coinID)
    //         .then((data: any) => res.json(data))
    //         .catch((err: express.Errback) => res.status(500).json(err));
    // }
}
