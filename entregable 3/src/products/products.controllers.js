const uuid = require('uuid');

const Products = require('../models/products.models');

const getAllProducts = () => {
	const data = Products.findAll();
	return data;
};

const createProduct = async (data) => {
	const newProduct = await Products.create({
		id: uuid.v4(),
		name: data.name,
		category: data.category,
		price: data.price,
		isAvailable: data.isAvailable,
	});
	return newProduct;
};

// createProduct({
// 	name: 'Iphone 14',
// 	category: 'Smartphones',
// 	price: 12220,
// 	isAvailable: true,
// })
// 	.then((response) => console.log(response))
// 	.catch((err) => console.log(err));

const getProductById = async (id) => {
	const data = await Products.findOne({
		where: {
			id,
		},
	});
	return data;
};

const editProduct = async (id, data) => {
	const response = await Products.update(data, {
		where: { id: id },
	});
	return response;
};

const deleteProduct = async (id) => {
	const data = await Products.destroy({
		where: {
			id: id,
		},
	});
	return data;
};

module.exports = {
	getAllProducts,
	getProductById,
	createProduct,
	editProduct,
	deleteProduct,
};
