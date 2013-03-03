// Generated by CoffeeScript 1.4.0
(function() {
  var User, _userSchema;

  _userSchema = {
    username: String,
    password: String,
    email: String
  };

  User = null;

  exports.setup = function(mongoose) {
    var userSchema;
    userSchema = mongoose.Schema(_userSchema);
    User = mongoose.model('User', userSchema);
    return User;
  };

  exports.createUser = function(opts, cb) {
    var user;
    user = new User(opts);
    user.save(cb);
  };

}).call(this);