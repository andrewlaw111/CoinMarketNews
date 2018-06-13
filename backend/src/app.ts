
import CoinRouter from "./routers/CoinRouter";
import UserRouter from "./routers/UserRouter";
import CoinService from "./services/CoinService";
import UserService from "./services/UserService";
import { app, server } from "./utils/init-app";
import LoginRouter from "./utils/login";

const coinService = new CoinService();
const userService = new UserService();

app.use("/login", new LoginRouter().router());
app.use("/coin", new CoinRouter(coinService).router());
app.use("/user", new UserRouter(userService).router());

server.listen(8080);
// tslint:disable-next-line:no-console
console.log("server running on port 8000");
