import express from 'express';
import { createConnection } from 'mysql2';
import bodyParser from 'body-parser';
import { config } from 'dotenv';
config()

const app = express()
app.use(bodyParser.json())

const PORT = 3001

const conexion = createConnection(
    {
        host: process.env.DB_HOST,
        database: process.env.DB_NAME,
        user: process.env.DB_USER,
        password: process.env.DB_PASSWORD,
        port: process.env.DB_PORT
    }
)

app.listen(PORT, () => {
    console.log("Server running on: http://localhost:" + PORT)
})


conexion.connect(error => {
    if (error) throw error
    console.log("Conexión a la base de datos fue exitosa")
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