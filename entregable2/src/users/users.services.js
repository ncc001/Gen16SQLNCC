const {
	getAllUsers,
	getUsersById,
	createUser,
} = require('./users.controllers');

const getUsers = (req, res) => {
	const data = getAllUsers();
	res.status(200).json(data);
};

const getOneUser = (req, res) => {
	const id = req.params.id;
	const data = getUsersById(id);
	if (data) {
		res.status(200).json(data);
	} else {
		res.status(200).json({ id: id, message: 'invalid ID' });
	}
};

const createNewUser = (req, res) => {
	const { name } = req.body;
	if (name) {
		const data = createUser(name);
		res.status(201).json(data);
	} else {
		res.status(400).json({ message: 'Missing Data' });
	}
};

module.exports = { getUsers, getOneUser, createNewUser };
