# force-ssl

Express middleware for forcing ssl. Redirects http requests to https. Tested on Express 4.x

## Install

    npm install force-ssl

## Usage

Prerequisites for this example:

    npm install express self-signed-https force-ssl

Javascript code (paste into app.js):

```javascript
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
```

You may need to run it as root (since it listens on port 80):

    sudo node app.js

Now if you visit http://localhost, it should redirect you to https://localhost

## Options

If HTTPS is running on a different port, then set the https_port option to specify it:

```javascript
var express = require('express')
var selfSignedHttps = require('self-signed-https')
var forceSsl = require('force-ssl')

var app = express()
app.listen(3000) // http on port 3000
selfSignedHttps(app).listen(3001) // https on port 3001
forceSsl.https_port = 3001 // specify that https is running on port 3001
app.use(forceSsl)

app.get('/', function(req, res) {
  res.send('hello world')
})
```

Now if you visit http://localhost:3000, it should redirect you to https://localhost:3001

## License

MIT

## Credits

[Geza Kovacs](https://github.com/gkovacs)
