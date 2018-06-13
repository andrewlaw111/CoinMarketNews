yarn install
npx knex migrate:latest
npx knex seed:run
npx nodemon -e js,ts index.js