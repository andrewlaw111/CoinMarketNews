import * as express from "express";
interface IUser {
    id: number;
    fiat_currency_id: number;
    coin_currency_id: number;
    email: string;
    notifications: boolean;
}

interface IUserToken extends IUser {
    token: string;
}

export default class UserRoutuer {
    public userService: any;

    public constructor(userService: any) {
        this.userService = userService;
    }

    public router() {
        const router = express.Router();
        router.route("/")
            .get(this.getUser)
            .post(this.createUser)
            .put(this.updateUser);
        return router;
    }
    private getUser = (req: express.Request, res: express.Response) => {
        return this.userService.getUser(req.headers.token)
            .then((data: IUser) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }

    private createUser = (req: express.Request, res: express.Response) => {
        return this.userService.createUser()
            .then((data: IUserToken) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private updateUser = (req: express.Request, res: express.Response) => {
        return this.userService.updateUser(
            req.headers.token,
            req.body.fiat_currency_id,
            req.body.coin_currency_id,
            req.body.email,
            req.body.password,
            req.body.notifications,
        )
            .then((data: IUser) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
}
