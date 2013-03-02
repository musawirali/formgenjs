exports.run = (req, res)->
  return res.redirect '/login.html' unless req.user?
  res.send "hi"