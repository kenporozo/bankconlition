const { response, request } = require("express");
const db = require("../database/connection");
const fs = require('fs');
const csv = require("fast-csv");

const getConciliation = (req = request, res = response) => {
    // const { rol } = req.body.payload;
    // if(rol === "Administrador" || rol === "Consultor"){

        try {
            if (req.file == undefined) {
              return res.status(400).send("Please upload a CSV file!");
            }
            let csvResult = [];
            let path = `D:\\tesis\\backend-bankconlition\\temp\\${req.file.originalname}`;
             fs.createReadStream(path)
            .pipe(csv.parse({ headers: true }))
                .on("error", (error) => {
                    throw error.message;
                })
                .on("data", (row) => {
                    csvResult.push(row);
                })
                .on("end", () => {
    
                    csvResult.forEach(row => {
                        let sql = `CALL sp_insert_csv_test('${row.nombre}', '${row.apellido}', '${row.edad}')`;
                        db(sql, res, (result) => {});
                    });
                });
            return res.json({msg : `Se insertaron ${csvResult.length} resultados`});
          } catch (error) {
            console.log(error);
            res.status(500).send({
              msg: `No se pudo descargar el archivo ${req.file.originalname}`
            });
          }
    // }else{
    //     return res.status(401).json({
    //         cod: 401,
    //         msg: "Usuario no tiene rol de administrador o consultor",
    //       });
    // }

  /**
   * #swagger.tags = ["Accounts"]
   * #swagger.description = "Endpoint para obtener una lista con todas las cuentas bancarias en el sistema"
   */
};

const getCartolas = (req = request, res = response) => {
  const { desde = 0, hasta = 0 } = req.query; 
  const {idCuenta} = req.params;
  const {idCliente} = req.body.payload
  let sql = `CALL sp_ListarCartola('${idCliente}','${idCuenta}','${desde}','${hasta}')`;
  const { rol } = req.body.payload;

  if (rol === "Administrador" || rol === "Consultor") {
    db(sql, res, (result) => {
      if (result[0]) {
        res.json(result[0]);
      } else {
        res.status(400).json({
          cod: 400,
          msg: "La cuenta que buscas no existe"
        });
      }
    });
  } else {
    return res.status(401).json({
      cod: 401,
      msg: "Usuario no tiene rol de administrador o consultor",
    });
  }
  /**
     * #swagger.tags = ["Accounts"]
     * #swagger.description = "Endpoint para obtener cuentas bancarias por id"
     * #swagger.parameters['Request'] = {
                  in: 'body',
                  schema: {}
     */
};

module.exports = {
  getConciliation,
  getCartolas,
};
