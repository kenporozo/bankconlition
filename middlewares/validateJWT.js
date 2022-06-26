const { request, response } = require("express");
const jwt = require("jsonwebtoken");

const validateToken = (req = request, res = response, next) =>{

    const token = req.header("x-auth-token");
    console.log(token);
    
    if(!token){
        return res.status(401).json({
            codRsp : 401,
            msgRsp : "No hay token en la petición"
        });
    }
    try {
        
        const payload = jwt.verify(token, process.env.SECRETORPRIVATEKEY);
        console.log(payload);
        req.payload = payload;
        next()
    } catch (error) {
        console.log(error);
        res.status(401).json({
            codRsp : 401,
            msgRsp : "Token no válido" 
        })
    }
}

module.exports = validateToken;