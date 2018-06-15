exports.up = function (knex, Promise) {
    return knex.schema.createTable("source", (sources) => {
        sources.increments();
        sources.string("name");
        sources.string("link");
    }).then(() => {
        return knex.schema.createTable("news", (news) => {
            news.increments();
            news.text('title');
            news.text('content');
            news.integer('source_id');
            news.foreign("source_id").references("source.id");
            news.string('link');
            news.timestamp('created_at');
            news.integer('counter');
        }).then(() => {
            return knex.schema.createTable("coin", (coins) => {
                coins.increments();
                coins.string('name');
                coins.string('symbol');
                coins.integer('rank');
                coins.bigInteger('circulating_supply');
                coins.bigInteger('total_supply');
                coins.bigInteger('max_supply');
                coins.integer('last_updated');
                coins.integer('coinmarketcap_id').unique();
                coins.text('about');
                coins.string('type');
                coins.string('algorithm');
                coins.string('proof');
                coins.boolean('mineable');
                coins.boolean('premined');
                coins.integer("official_website").unsigned();
                coins.foreign("official_website").references("source.id");
                coins.integer("medium").unsigned();
                coins.foreign("medium").references("source.id");
                coins.integer("reddit").unsigned();
                coins.foreign("reddit").references("source.id");
                coins.integer("twitter").unsigned();
                coins.foreign("twitter").references("source.id");
                coins.integer("telegram").unsigned();
                coins.foreign("telegram").references("source.id");
            }).then(() => {
                return knex.schema.createTable("coin_news", (coinNews) => {
                    coinNews.increments();
                    coinNews.integer("coin_id").unsigned();
                    coinNews.foreign("coin_id").references("coin.id");
                    coinNews.integer("news_id").unsigned();
                    coinNews.foreign("news_id").references("news.id");
                }).then(() => {
                    return knex.schema.createTable("currency", (currencies) => {
                        currencies.increments();
                        currencies.boolean('fiat');
                        currencies.string('symbol');
                    }).then(() => {
                        return knex.schema.createTable("users", (users) => {
                            users.increments();
                            users.integer("fiat_currency_id").unsigned();
                            users.foreign("fiat_currency_id").references("currency.id");
                            users.integer("coin_currency_id").unsigned();
                            users.foreign("coin_currency_id").references("currency.id");
                            users.string('email');
                            users.string('password');
                            users.boolean('notification');
                        }).then(() => {
                            return knex.schema.createTable("sessions", (sessions) => {
                                sessions.increments();
                                sessions.integer("user_id").unsigned();
                                sessions.foreign("user_id").references("coin.id");
                                sessions.string("token");
                            }).then(() => {
                                return knex.schema.createTable("price", (price) => {
                                    price.increments();
                                    price.integer("coinmarketcap_id").unsigned();
                                    price.foreign("coinmarketcap_id").references("coin.coinmarketcap_id");
                                    price.integer("currency_id").unsigned();
                                    price.foreign("currency_id").references("currency.id");
                                    price.decimal("price", 16, 8);
                                    price.decimal("volume_24h", 16, 8);
                                    price.decimal("market_cap", 16, 8);
                                    price.decimal("percent_change_1h");
                                    price.decimal("percent_change_24h");
                                    price.decimal("percent_change_7d");
                                }).then(() => {
                                    return knex.schema.createTable("price_alert", (priceAlert) => {
                                        priceAlert.increments();
                                        priceAlert.integer("user_id").unsigned();
                                        priceAlert.foreign("user_id").references("users.id");
                                        priceAlert.integer("price_id").unsigned();
                                        priceAlert.foreign("price_id").references("price.id");
                                        priceAlert.boolean('upper');
                                        priceAlert.decimal('price_point');
                                        priceAlert.boolean('active');
                                    }).then(() => {
                                        return knex.schema.createTable("news_alert", (newsAlert) => {
                                            newsAlert.increments();
                                            newsAlert.integer("user_id").unsigned();
                                            newsAlert.foreign("user_id").references("users.id");
                                            newsAlert.integer("coin_id").unsigned();
                                            newsAlert.foreign("coin_id").references("coin.id");
                                            newsAlert.boolean('favourite');
                                            newsAlert.boolean('subscribe_website');
                                            newsAlert.boolean('subscribe_medium');
                                            newsAlert.boolean('subscribe_reddit');
                                            newsAlert.boolean('subscribe_twitter');
                                        })
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
    });
};

exports.down = function (knex, Promise) {
return knex.schema.dropTable('news_alert')
    .then(() => {
        return knex.schema.dropTable('price_alert')
            .then(() => {
                return knex.schema.dropTable('price')
                    .then(() => {
                        return knex.schema.dropTable('users')
                            .then(() => {
                                return knex.schema.dropTable('currency')
                                    .then(() => {
                                        return knex.schema.dropTable('coin_news')
                                            .then(() => {
                                                return knex.schema.dropTable('coin')
                                                    .then(() => {
                                                        return knex.schema.dropTable('news')
                                                            .then(() => {
                                                                return knex.schema.dropTable('source')
                                                            });
                                                    });
                                            });
                                    });
                            })
                    });
            });
    });
};