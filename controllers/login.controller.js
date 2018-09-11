const loginController = {};

loginController.loginUser = (req, res) => {
  console.log("Inside POST /login callback function");
  console.log(req.body);
  res.send('You posted to the login page!¡');
}

module.exports = loginController;