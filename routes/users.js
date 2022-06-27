const { Router } = require("express");
const { check } = require("express-validator");
const {validation} = require("../middlewares/validations");

const controller = require("../controllers/users");
const validateToken = require("../middlewares/validateJWT");

const router = Router();

router.get("/users",[
    validateToken
],controller.getUsers)

router.post("/users",[
    check("idTipoUsuario")
    .isNumeric()
    .withMessage("El tipo de usuario debe ser numerico")
    .bail()
    .custom(idTipoUsuario => idTipoUsuario > 0)
    .withMessage("El tipo de usuario debe ser mayor a 0")
    .bail(),
    check("username")
    .notEmpty()
    .withMessage("El username es obligatorio")
    .bail()
    .isLength({min: 3, max: 45})
    .withMessage("El username debe llevar entre 3 y 45 caracteres")
    .bail()
    .custom(username => /^([a-zA-Z0-9_])*$/.test(username))
    .withMessage("El username no puede llevar caracteres especiales")
    .bail(),
    check("password")
    .notEmpty()
    .withMessage("La password es obligatoria")
    .bail()
    .custom(password => /([\S])+/.test(password))
    .withMessage("La contraseña no puede llevar espacios en blanco")
    .bail(),
    check("rut")
    .notEmpty()
    .withMessage("El rut es obligatorio")
    .bail(),
    check("nombres")
    .notEmpty()
    .withMessage("Al menos un nombre es obligatorio")
    .bail()
    .isLength({min: 3, max: 45})
    .withMessage("El nombre debe llevar entre 3 y 45 caracteres")
    .bail()
    .custom(nombres => /^([a-zA-Z])+(?:\s[a-zA-Z]+)*$/.test(nombres))
    .withMessage("Los nombres no pueden contener caracteres especiales")
    .bail(),
    check("apellidos")
    .notEmpty()
    .withMessage("Al menos un apellido es obligatorio")
    .bail()
    .isLength({min: 3, max: 45})
    .withMessage("El apellido debe llevar entre 3 y 45 caracteres")
    .bail()
    .custom(apellidos => /^([a-zA-Z])+(?:\s[a-zA-Z]+)*$/.test(apellidos))
    .withMessage("Los apellidos no pueden contener caracteres especiales")
    .bail(),
    check("correo")
    .isEmail()
    .withMessage("El correo debe llevar un formato valido")
    .bail(),
    validateToken,
    validation
],controller.insertUser)

module.exports = router;