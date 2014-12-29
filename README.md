# force-ssl

Express middleware for forcing ssl. Redirects http requests to https. Tested on Express 4.x

## Install

    npm install force-ssl

## Using

Prerequisites for this example:

    npm install express self-signed-https force-ssl

Javascript code (paste into app.js):

    var express = require('express')
    var selfSignedHttps = require('self-signed-https')
    var forceSsl = require('force-ssl')
    
    var app = express()
    app.listen(80) // http on port 80
    selfSignedHttps(app).listen(443) // https on port 443
    app.use(forceSsl)
    
    app.get('/', function(req, res) {
      res.send('hello world')
    })

You may need to run it as root (since it listens on port 80):

    sudo node app.js

Now if you visit http://localhost, it should redirect you to https://localhost

## License

MIT

## Credits

[Geza Kovacs](https://github.com/gkovacs)
