const { Router } = require("express");
const { check } = require("express-validator");
const {validation} = require("../middlewares/validations");

const controller = require("../controllers/users");
const validateToken = require("../middlewares/validateJWT");

const router = Router();

router.get("/users",[
    validateToken
],controller.getUsers)

module.exports = router;