import cron = require('cron');
var CronJob = cron.CronJob;

export default class Cron {
    constructor () {
        new CronJob('* * * * * *', function () {
            console.log('cron ex');
        }, function () {
            console.log('cron stop');
        },
            true, /* Start the job right now */
            'America/Los_Angeles'
        );
    }
}
