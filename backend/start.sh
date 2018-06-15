yarn install
npx knex migrate:latest
npx knex seed:run
npx nodemon --watch . --inspect=0.0.0.0:5858 --nolazy ./index.js