# force-ssl

express middleware (tested on 4.x) for forcing ssl - http requests will be redirected to https

## Install

    npm install force-ssl

## Using

Coffeescript / LiveScript example, using the express and [self-signed-https](https://github.com/gkovacs/self-signed-https) modules:

    express = require('express')
    selfSignedHttps = require('self-signed-https')
    forceSsl = require('force-ssl')
    
    app = express()
    app.get '/', (req, res) ->
      res.send('hello world')
    app.listen(3000) # http on port 3000
    selfSignedHttps(app).listen(3001) # https on port 3001
    app.use(forceSsl)

Now if you visit http://localhost:3000, it should redirect you to https://localhost:3001

## Credits

[Geza Kovacs](https://github.com/gkovacs)
