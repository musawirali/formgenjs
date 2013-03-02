# Includes
express       = require 'express'
passport      = require 'passport'
LocalStrategy = require('passport-local').Strategy;
site          = require './site'
fgapp         = require './fgapp'

# 1] Configure Express
app = express()
app.configure ()->
  app.use express.static('public')
  app.use express.cookieParser()
  app.use express.bodyParser()
  app.use express.session {'secret': "MusawirAliShah"}
  app.use passport.initialize()
  app.use passport.session()

# 2] Configure Passport with local authentication strategy
# a)
passport.use new LocalStrategy (username, password, done)->
  console.log "Login request: #{username}"
  #return done "Not Implemented"
  return done null, {'id': 1}
# b]
passport.serializeUser (user, done)->
  done null, user.id
# c]
passport.deserializeUser (id, done)->
  done null,
    'username': 'Choo Choo'

# 3] Setup routes
app.get '/', site.index
app.get '/app', fgapp.run
app.post '/login',
  passport.authenticate('local',
      'failureRedirect': '/login.html',
      'successRedirect': '/app',
      failureFlash: true
    )

# 4] Start server
app.listen(3000)