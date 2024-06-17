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


app.get("/usuarios", (req, res) => {
    const consulta = "SELECT * FROM UsuariosVista;"
    conexion.query(consulta, (err, resultado) => {
        if (err) return console.error(err.message)

        const objeto = {}
        if (resultado.length > 0) {
            objeto.listaUsuario = resultado
            res.json(objeto)
        } else {
            res.json("No hay registros")
        }
    })
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

app.post("/usuarios/registrar", (req, res) => {
    const usuarios = {
        nombre: req.body.nombre,
        email: req.body.email,
        password: req.body.password,
        idOnline: req.body.idOnline,
        genero: req.body.genero,
        edad: req.body.edad
    }
    console.log(usuarios);
    const query = "INSERT INTO usuarios SET ?"
    conexion.query(query, usuarios, (error) => {
        if (error) {
            return console.error(error.message)
        }
        res.json("Se insertó correctamente el usuario")
    })
})

app.post('/login', (req, res) => {
    const { idOnline, password } = req.body;
    if (!idOnline || !password) {
        return res.status(400).json({ message: 'Por favor proporciona ID online y contraseña' });
    }

    const query = `SELECT * FROM usuarios WHERE idOnline = '${idOnline}'`;
    conexion.query(query, (err, results) => {
        console.log(idOnline, password);
        if (err) {
            console.error('Error querying database:', err);
            return res.status(500).json({ error: 'Error de base de datos' });
        }

        if (results.length === 0) {
            return res.status(401).json({ message: 'Usuario no encontrado' });
        }

        const usuario = results[0];
        // Validación de la contraseña
        if (usuario.password !== password) {
            return res.status(401).json({ message: 'Contraseña incorrecta' });
        }

        res.status(200).json({ message: 'Inicio de sesión exitoso', usuario });
    });
});