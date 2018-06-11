# ReactProject

## Summary
A React Native application that displays news related to the cryptocurrency market. Features will include news gathered from various web sources and APIs as well as RSS feeds and will also include market price information for various coins. The news will be sorted by coins and users will have the option to enable push notifications based on favourite coins, the specific news sources, and price range.

## For later
https://reactnavigation.org
nativebase.io

## Postman API List
https://identity.getpostman.com/handover/multifactor?user=4016000&handover_token=4ac1dbd2-ec95-4c95-b832-f958c4309bed

## To Do

### Backend

#### Server
1. Create Docker environment
2. Backend Server
  - NodeJS
  - Express
  - Postgresql
  - knex migration
  - Jwt login
  - routers (API responses)
  - services
  - environment variables
  - One Signal(notifications)
  
3. Scraping
  - CoinMarketCap
    - Get CoinMarketCap ID
    - API Calls (get initial information)
  - CoinCheckup
    - Links to accounts
  - Coinlib.io
    - Coin Information
    
  - Setup Regular API Calls
    - CoinMarketCap
    - Reddit
    - Medium
    - Twitter
  - RSS feeds (nodejs library)
    - CoinDesk
    - Cointelegraph
    - NewsBTC
    - CCN.com
    - Toshitimes.com

#### Deployment
1. CircleCI
2. AWS ECS? CloudFront

### Frontend
#### Mobile
1. Navigation
2. Interfaces
  - Coin Prices
    - Info
    - News
    - Price
    - Alert
  - News
    - Favourite
    - Market
    
  - Settings
    - Set email
    - Currency (Fiat + Coin)
    - Notifcation switch
3. Redux Store, Actions, Reducers, Thunk
4. Axios API calls

#### Deployment
1. App Store?? Google Play?????!!?
