import * as express from "express";

export default class UserRoutuer {
    public userService: any;

    public constructor(userService: any) {
        this.userService = userService;
    }

    public router() {
        const router = express.Router();
        router.get("/", this.getUser);
        router.post("/", this.createUser);
        router.put("/", this.updateUser);
        return router;
    }
    private getUser = (req: any, res: any) => {
        return this.userService.getUser()
            .then((data: any) => res.json(data))
            .catch((err: any) => res.status(500).json(err));
    }

    private createUser = (req: any, res: any) => {
        return this.userService.createUser()
            .then((data: any) => res.json(data))
            .catch((err: any) => res.status(500).json(err));
    }
    private updateUser = (req: any, res: any) => {
        return this.userService.updateUser()
            .then((data: any) => res.json(data))
            .catch((err: any) => res.status(500).json(err));
    }
}
