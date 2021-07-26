const express = require('express');
const app = express();

app.get('/', (req, res) => res.send("Hola desde Olías del Rey"));
app.listen(3000, () => console.log("Servidor iniciado"));