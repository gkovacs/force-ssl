module.exports = (req, res, next) ->
  if req.protocol != 'https'
    return res.redirect ['https://', req.get('Host'), req.url].join('')
  return next()
