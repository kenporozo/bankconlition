const { response, request } = require("express");
const bcryptjs = require("bcryptjs");
const db = require("../database/config");

const getUsers = (req = request, res = response) =>{
    db.getConnection((err, connection) => {
        if (err) {
          console.log(`Connection error: ${err.sqlMessage}`);
          connection.release();
          return res.json({
            codRsp : 1,
            msgRsp : `There's was an error in the connection to the DB: ${err.sqlMessage}`
          });
        }
        
        connection.query("CALL sp_sel_usuario()", (err, rows)=>{
            if(err){
                console.log(`Error executing the SP: ${err.sqlMessage}`);
                return res.json({
                    codRsp : 1,
                    msgRsp : `There's was an error executing the SP: ${err.sqlMessage}`
                  });
            };
            res.json({
               users : rows[0]
              });
            console.log(`Response = ${JSON.stringify(rows[0])}`);
        });
        connection.release();
      });
      /**
       * #swagger.tags = ["Users"]
       * #swagger.description = "Endpoint para obtener una lista con todos los usuarios del sistema"
       */
}

module.exports = {
    getUsers
}
