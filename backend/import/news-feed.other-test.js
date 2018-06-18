const FeedMe = require('feedme');
const http = require('https');

http.get('https://cointelegraph.com/rss', (res) => {
    if (res.statusCode != 200) {
        console.error(new Error(`status code ${res.statusCode}`));
        return;
    }
    var parser = new FeedMe();
    //   parser.on('title', (title) => {
    //     console.log('title of feed is', title);
    //   });
    parser.on('item', (item) => {
        console.log();
        console.log(item);
        console.log('news:', item.title);
        console.log(item.description);
    });
    res.pipe(parser);
});