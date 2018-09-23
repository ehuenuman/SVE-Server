var crypto = require("crypto");
var jwt = require("jsonwebtoken");

const authMethods = {};

authMethods.createPassword = function (password) {
  salt = crypto.randomBytes(16).toString('hex');
  hash = crypto.pbkdf2Sync(password, salt, 1000, 64, 'sha512').toString('hex');
  //console.log(salt, hash);
};

authMethods.validPassword = function (password, hash, salt) {
  hash_to_verify = crypto.pbkdf2Sync(password, salt, 1000, 64, 'sha512').toString('hex');
  return hash === hash_to_verify;
};

authMethods.generatePayload = function (user) {
  var expiry = new Date();
  expiry.setDate(expiry.getDate() + 7);

  const payload = {
    _id: user.user_id,
    username: user.username,
    first_name: user.first_name,
    last_name: user.last_name,
    phone: user.phone,
    email: user.email,
    date_joined: user.date_joined,
    last_login: user.last_login,
    enterprise_id: user.enterprise_id,
    enterprise_name: user.enterprise_name,
    profile_id: user.profile_id,
    profile_name: user.profile_name,
    profile_description: user.profile_description,
    exp: parseInt(expiry.getTime() / 1000),
  }

  return payload;
}

authMethods.generateJwt = function (payload) {
  return jwt.sign(JSON.stringify(payload), "MY_SECRET"); 
};

module.exports = authMethods;

