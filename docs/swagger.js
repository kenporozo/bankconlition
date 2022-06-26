const swaggerAutogen = require("swagger-autogen")();

const outputFile = "./docs/swagger_output.json";
const endpointFiles = ["./routes/*.js"];

const doc = {
    info: {
        version : "1.0.0",
        title : "Bankconlition API",
        description : "Documentación de los endpoints creados para ser consumidos por el equipo de front-end de Bankconliton"
    },
    host: "localhost:3000",
    basePath: "/api/bankconlition",
    schms: ["http"],
    consumes: ["application/json"],
    produces: ["application/json"],
    tags: [
        {
            "name" : "Users",
            "description" : "CRUD de usuarios"
        },
        {
            "name" : "Login",
            "description" : "Autenticación de usuarios del sistema"
        }
    ],
    definitions: {
        RequestLogin :{
            usuario : "pperes",
            password : "pperez"
        }
    }
}

swaggerAutogen(outputFile, endpointFiles, doc).then(() =>{
    require("../app.js");
})