const { response, request } = require("express");
const bcryptjs = require("bcryptjs");
const db = require("../database/connection");

const getUsers = (req = request, res = response) =>{
      let sql = "CALL sp_sel_usuario()";
      db(sql, res, (result) => res.json({users : result}));
      /**
       * #swagger.tags = ["Users"]
       * #swagger.description = "Endpoint para obtener una lista con todos los usuarios del sistema"
       */
}

module.exports = {
    getUsers
}
