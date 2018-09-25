const methodsController = {};

methodsController.isError = (error, res) => {
  if (error) {
    res.status(500);
    res.json({
      "status": 500, "error": error, "response": null
    });
  } else {
    return false;
  }
};

module.exports = methodsController;