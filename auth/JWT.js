const jwt = require("jsonwebtoken");

// const createJWT = (user) => {
//   return new Promise((resolve, reject) => {
//     jwt.sign(
//       user,
//       process.env.SECRETORPRIVATEKEY,
//       {
//         expiresIn: "4h",
//       },
//       (error, token) => {
//         if (error) {
//           console.log(error);
//           reject("Error al generar el token");
//         } else {
//           resolve(token);
//         }
//       }
//     );
//   });
// };
const createJWT = (user, callback) => {
  jwt.sign(
    JSON.parse(JSON.stringify(user)),
    process.env.SECRETORPRIVATEKEY,
    {
      expiresIn: "1h",
    },
    (error, token) => {
      callback(error, token);
    }
  );
};

module.exports = createJWT;
