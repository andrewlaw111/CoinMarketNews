import * as express from "express";

export default class UserRoutuer {
    public userService: any;

    public constructor(userService: any) {
        this.userService = userService;
    }

    public router() {
        const router = express.Router();
        router.get("/"), this.getUser.bind(this);
        router.post("/"), this.createUser.bind(this);
        router.put("/"), this.updateUser.bind(this);
        return router;
    }
    private getUser(req: any, res: any) {
        return this.userService.getUser()
            .then((data: any) => res.json(data))
            .catch((err: any) => res.status(500).json(err));
    }

    private createUser(req: any, res: any) {
        return this.userService.createUser()
            .then((data: any) => res.json(data))
            .catch((err: any) => res.status(500).json(err));
    }
    private updateUser(req: any, res: any) {
        return this.userService.updateUser()
            .then((data: any) => res.json(data))
            .catch((err: any) => res.status(500).json(err));
    }
}
