const express = require('express');
const db = require('./utils/database');
const initModels = require('./models/initModels');
const config = require('./config');
const productsRouter = require('./products/products.router');

const app = express();

db.authenticate() //? verificacion de la DB
	.then(() => console.log('DB Authentication Succesfullly'))
	.catch((err) => console.log(err));

db.sync() //? sincroniza los modelos con la DB, creando las tablas que esta en models.
	.then(() => console.log('Database Synced'))
	.catch((err) => console.log(err));

initModels();

app.use(express.json());

app.get('/', (req, res) => {
	res.status(200).json({ message: 'ok!' });
});

app.use('/products', productsRouter);

app.listen(config.port, () => {
	console.log(`served started at port ${config.port}`);
});
