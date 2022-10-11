const { DataTypes } = require('sequelize');
const db = require('../utils/database');

const Products = db.define('products', {
	id: {
		primaryKey: true,
		type: DataTypes.UUID,
		allowNull: true,
	},
	name: {
		type: DataTypes.STRING(),
	},
	category: {
		type: DataTypes.STRING,
		allowNull: false,
	},
	price: {
		type: DataTypes.INTEGER,
		allowNull: false,
	},
	isAvailable: {
		type: DataTypes.BOOLEAN,
	},
});

module.exports = Products;
