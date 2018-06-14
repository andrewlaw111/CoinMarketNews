exports.seed = (knex, Promise) => {
    return knex('users').del()
        .then(() => {
            return knex("users").insert({
                notification: true,
            });
        }).then(() => {
            return knex('sessions').del()
                .then(() => {
                    return knex("sessions").insert({
                        user_id: 1,
                        token: "12345",
                    });
                });
        });
};