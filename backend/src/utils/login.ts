import * as express from "express";

export default class LoginRouter {
    public router() {
        const router = express.Router();
        router.post("/", this.login);
        router.put("/", this.updateLogin);
        return router;
    }

    private login = (req: any, res: any) => {
        // if (req.body.email && req.body.password) {
        // let email = req.body.email;
        // let password = req.body.password;

        // // let user = users.find((u) => {
        //     return u.email === email && u.password === password;
        // });
        //     if (user) {
        //         let payload = {
        //             id: user.id
        //         };
        //         let token = jwt.encode(payload, config.jwtSecret);
        //         res.json({
        //             token
        //         });
        //     } else {
        //         res.sendStatus(401);
        //     }
        // } else {
        //     res.sendStatus(401);

        // }
        return;
    }

    private updateLogin = () => {
        return;
    }
}
