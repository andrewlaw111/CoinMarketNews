import * as express from "express";

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
        return this.userService.getUser()
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }

    private createUser = (req: express.Request, res: express.Response) => {
        return this.userService.createUser()
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
    private updateUser = (req: express.Request, res: express.Response) => {
        return this.userService.updateUser()
            .then((data: any) => res.json(data))
            .catch((err: express.Errback) => res.status(500).json(err));
    }
}
