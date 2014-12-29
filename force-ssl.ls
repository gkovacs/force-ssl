module.exports = (req, res, next) ->
  if req.protocol != 'https' and req.headers['x-forwarded-proto'] != 'https'
    return res.redirect ['https://', req.get('Host'), req.url].join('')
  return next()
