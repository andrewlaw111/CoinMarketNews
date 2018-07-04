import * as bcrypt from "bcrypt";

/* DELETE LATER */

export const hashPassword = (plainTextPassword: string) => {
    return new Promise((resolve, reject) => {
        bcrypt.genSalt((err: Error, salt) => {
            if (err) {
                reject(err);
            }
            bcrypt.hash(plainTextPassword, salt, (hashErr: Error, hash) => {
                if (hashErr) {
                    reject(hashErr);
                }
                resolve(hash);
            });
        });
    });
};

export const checkPassword = (plainTextPassword: string, hashedPassword: string) => {
    return new Promise((resolve, reject) => {
        bcrypt.compare(plainTextPassword, hashedPassword, (err, match) => {
            if (err) {
                // console.log('reject');
                reject(err);
            } else {
                // console.log(hashedPassword);
                // console.log('resolve');
                resolve(match);
            }
        });
    });
};
