yarn install
npx knex migrate:latest
npx knex seed:run
npx nodemon index.js