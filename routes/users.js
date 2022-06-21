const { Router } = require("express");
const { check } = require("express-validator");
const {validation} = require("../middlewares/validations");

const controller = require("../controllers/users");

const router = Router();

router.get("/users", controller.getUsers)

module.exports = router;