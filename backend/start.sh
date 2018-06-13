# !!! not used at the moment !!!
yarn install
npx knex migrate:latest
npx knex seed:run
npx nodemon index.js