// Update with your config settings.

module.exports = {

  development: {

    client: 'postgresql',
    connection: {
      host: 'db',
      database: "postgres",
      user: "postgres",
      password: "password"
    },
  },

  testing: {
    client: 'postgresql',
    connection: {
      database: "coinmarketnews-testing",
      port: 5433,
      user: "andrew",
      password: "password"
    },
  },
  staging: {
    client: 'postgresql',
    connection: {
      host: 'db',
      database: 'postgres',
      user: 'postgres',
      password: 'password'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  },

  production: {
    client: 'postgresql',
    connection: {
      host: 'db',
      database: 'postgres',
      user: 'postgres',
      password: 'password'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  }

};