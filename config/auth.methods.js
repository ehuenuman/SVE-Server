var crypto = require("crypto");
var jwt = require("jsonwebtoken");

var exports = module.exports = {};

exports.createPassword = function (password) {
  salt = crypto.randomBytes(16).toString('hex');
  hash = crypto.pbkdf2Sync(password, salt, 1000, 64, 'sha512').toString('hex');
  console.log(salt, hash);
};

exports.validPassword = function (password, hash, salt) {
  hash_to_verify = crypto.pbkdf2Sync(password, salt, 1000, 64, 'sha512').toString('hex');
  return hash === hash_to_verify;
};

exports.generateJwt = function (user) {
  var expiry = new Date();
  expiry.setDate(expiry.getDate() + 7);

  return jwt.sign({
    _id: user.id,
    username: user.username,
    name: user.first_name,
    exp: parseInt(expiry.getTime() / 1000),
  }, "MY_SECRET"); // DO NOT KEEP YOUR SECRET IN THE CODE!
};


