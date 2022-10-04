const uuid = require('uuid');

const userDB = [
	{
		id: '1',
		first_name: 'Juan',
		last_name: 'Contreras',
		email: 'juan@gmail.com',
		password: 'root',
		birthday: '1995/02/14',
	},
	{
		id: '2',
		first_name: 'Jose',
		last_name: 'Positivo',
		email: 'jose12@gmail.com',
		password: 'root',
		birthday: '1995/12/15',
	},
];
const getAllUsers = () => {
	return userDB;
};

const getUsersById = (id) => {
	const data = userDB.find((task) => task.id === id);
	return data;
};

const createUser = (name) => {
	const newUser = {
		id: uuid.v4(),
		name,
	};
	userDB.push(newUser);
	return newUser;
};

module.exports = { getAllUsers, getUsersById, createUser };
