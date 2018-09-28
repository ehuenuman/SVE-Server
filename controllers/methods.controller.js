const methodsController = {};

methodsController.isError = (error, res) => {
  if (error) {
    if (process.env.NODE_ENV === "production") {
      res.sendStatus(500);
    } else {
      res.status(500);
      res.json({
        "status": 500, "error": error, "response": null
      });
    }
    return true;
  } else {
    return false;
  }
};

module.exports = methodsController;