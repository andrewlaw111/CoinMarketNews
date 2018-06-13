import { app } from "./utils/init-app";

import CoinRouter from "./routers/CoinRouter";
import UserRouter from "./routers/UserRouter";
import CoinService from "./services/CoinService";
import UserService from "./services/UserService";
import LoginRouter from "./utils/login";

const coinService = new CoinService();
const userService = new UserService();

app.use("/login", new LoginRouter().router());
app.use("/coin", new CoinRouter(coinService).router());
app.use("/user", new UserRouter(userService).router());

app.listen(8000);
