forceSsl = (req, res, next) ->
  if req.protocol != 'https' and req.headers['x-forwarded-proto'] != 'https'
    host = req.get('Host')
    if forceSsl.https_port?
      colonidx = host.indexOf(':')
      if colonidx != -1
        host = host.slice(0, colonidx)
      host = host + ':' + forceSsl.https_port
    return res.redirect ['https://', host, req.url].join('')
  return next()

forceSsl.https_port = null

module.exports = forceSsl