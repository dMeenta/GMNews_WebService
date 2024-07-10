const express = require('express')
const mysql = require('mysql2')
const bodyParser = require('body-parser')

const app = express()
app.use(bodyParser.json())

const PUERTO = 3001

const conexion = mysql.createConnection(
    {
        host: 'localhost',
        database: 'Proyectofinal',
        user: 'root',
        password: 'DM12345**',
        port: 3307
    }
)

app.listen(PUERTO, () => {
    console.log("Servidor corriendo en el puerto http://localhost:" + PUERTO)
})


conexion.connect(error => {
    if (error) throw error
    console.log("Conexión a la base de datos fue exitosa")
})


app.get("/", (req, res) => {
    res.send("Web service funcionado...")
})

app.get("/news", (req, res) => {
    const query = "SELECT * FROM NoticiasVista"
    conexion.query(query, (err, resultado) => {
        if (err) return console.error(err.message)

        const objeto = {}
        if (resultado.length > 0) {
            objeto.listaNoticia = resultado
            res.json(objeto)
        } else {
            res.json("No hay registros")
        }
    })
})

app.get("/games", (req, res) => {
    const query = "SELECT * FROM juegos"
    conexion.query(query, (err, resultado) => {
        if (err) return console.error(err.message)

        const objeto = {}
        if (resultado.length > 0) {
            objeto.listaJuegos = resultado
            res.json(objeto)
        } else {
            res.json("No hay registros")
        }
    })
})