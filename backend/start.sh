# !!! not used at the moment !!!
yarn install
npx knex migrate:latest
npx knex seed:run
node app.js