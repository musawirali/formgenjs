_userSchema = 
  username: String,
  password: String,
  email: String

User = null

exports.setup = (mongoose)->
  userSchema = mongoose.Schema _userSchema
  User = mongoose.model 'User', userSchema
  return User

exports.createUser = (opts, cb)->
  user = new User opts
  user.save cb
  return