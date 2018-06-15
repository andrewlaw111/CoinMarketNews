import { ICoin } from "../../models";
import { CoinActions, LOAD_COIN_FAILURE, LOAD_COIN_SUCCESS } from "../actions/coins";

export interface ICoinState {
  coins: ICoin[];
}

export const coinReducer = (state: ICoinState = { coins: [] }, action: CoinActions) => {
  // Use switch to handle different actions
  switch (action.type) {
    case LOAD_COIN_SUCCESS:
      return {
        coins: action.coins, // Use concat to add a new link
      };
    case LOAD_COIN_FAILURE:
      return {
      };
    default:
      return state; // Do not change the state in case of any other actions
  }
};
