const { response, request } = require("express");
const bcryptjs = require("bcryptjs");
const db = require("../database/connection");

const getUsers = (req = request, res = response) => {
  let sql = "CALL sp_sel_usuario()";
  db(sql, res, (result) => res.json({ users: result }));
  /**
   * #swagger.tags = ["Users"]
   * #swagger.description = "Endpoint para obtener una lista con todos los usuarios del sistema"
   */
}

const insertUser = (req = request, res = response) => {
    const {idTipoUsuario, username, password, rut, nombres, apellidos, correo} = req.body;
    const {clienteId} = req.body.payload;
    let sql = `CALL sp_ins_usuario('${clienteId}','${idTipoUsuario}','${username}','${password}','${rut}','${nombres}','${apellidos}','${correo}')`;

    db(sql, res, (result) =>{
        if(result[0].id){
            res.json(result[0]);   
        }else{
            res.status(400).json(result[0]);
        }
    });
}

module.exports = {
  getUsers,
  insertUser,
};
