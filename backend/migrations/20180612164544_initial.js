exports.up = function (knex, Promise) {
    return knex.schema.createTable("users", (users) => {
        users.increments();
        users.string("username");
        users.unique("username");
        users.string("password");
        users.string("display_name");
        users.unique("display_name");
        users.string("google_id");
        users.unique("google_id");
        users.boolean("manager");
    }).then(() => {
        return knex.schema.createTable("restaurants", (restaurants) => {
            restaurants.increments();
            restaurants.string("name");
            restaurants.string("logo");
            restaurants.string("location");
        }).then(() => {
            return knex.schema.createTable("orders", (orders) => {
                orders.increments();
                orders.integer("restaurants_id").unsigned();
                orders.foreign("restaurants_id").references("restaurants.id");
                orders.integer("table").unsigned();
                orders.text("comment");
                orders.timestamp('created_at');
            }).then(() => {
                return knex.schema.createTable("comments", (comments) => {
                    comments.increments();
                    comments.integer("orders_id").unsigned();
                    comments.foreign("orders_id").references("orders.id");
                    comments.text("comment");
                    comments.timestamp('created_at');
                }).then(() => {
                    return knex.schema.createTable("items", (items) => {
                        items.increments();
                        items.integer("restaurants_id").unsigned();
                        items.foreign("restaurants_id").references("restaurants.id");
                        items.string("name");
                        items.decimal('price')
                        items.string("image");
                        items.string("category");
                        items.text("description");
                        items.boolean("recommended");
                    }).then(() => {
                        return knex.schema.createTable("users_restaurants", (usersRestaurants) => {
                            usersRestaurants.increments();
                            usersRestaurants.integer("user_id").unsigned();
                            usersRestaurants.foreign("user_id").references("users.id");
                            usersRestaurants.integer("restaurants_id").unsigned();
                            usersRestaurants.foreign("restaurants_id").references("restaurants.id");
                        }).then(() => {
                            return knex.schema.createTable("orders_items", (orders_items) => {
                                orders_items.increments();
                                orders_items.integer("items_id").unsigned();
                                orders_items.foreign("items_id").references("items.id");
                                orders_items.integer("orders_id").unsigned();
                                orders_items.foreign("orders_id").references("orders.id");
                            })
                        });
                    });
                });
            });
        });
    });
};

exports.down = function (knex, Promise) {
    return knex.schema.dropTable('users_restaurants')
        .then(() => {
            return knex.schema.dropTable('orders_items')
                .then(() => {
                    return knex.schema.dropTable('users')
                        .then(() => {
                            return knex.schema.dropTable('items')
                                .then(() => {
                                    return knex.schema.dropTable('comments')
                                        .then(() => {
                                            return knex.schema.dropTable('orders')
                                                .then(() => {
                                                    return knex.schema.dropTable('restaurants')
                                                });
                                        });
                                });
                        });
                })
        });
};