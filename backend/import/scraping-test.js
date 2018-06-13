const Crawler = require("crawler");

var c = new Crawler({
    maxConnections: 10,
    // This will be called for each crawled page
    callback: function (error, res, done) {
        if (error) {
            console.log(error);
        } else {
            var $ = res.$;
            console.log('-----');
            var coinDescription = $('.coin-description').clone().children('strong, a').remove().end().text().trim();
            console.log(coinDescription);
            console.log('-----');
            var rank = $('#info div.col-6').eq(1).text();
            console.log(rank);
            console.log('-----');
            var type = $('#info div.col-6').eq(3).text();
            console.log(type);
        }
        done();
    }
});

// Queue just one URL, with default callback
c.queue('https://coinlib.io/coin/ETH/Ethereum');
c.queue('https://coinlib.io/coin/EOS/EOS');