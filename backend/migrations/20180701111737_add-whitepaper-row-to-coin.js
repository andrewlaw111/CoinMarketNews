exports.up = function (knex, Promise) {
    return knex.schema.table('coin', (table) => {
        table.string("whitepaper_name");
        table.string("whitepaper_link");
    });
};

exports.down = function (knex, Promise) {
    return knex.schema.table('coin', (table) => {
        table.dropColumn('whitepaper_name');
        table.dropColumn('whitepaper_link');
    })
};