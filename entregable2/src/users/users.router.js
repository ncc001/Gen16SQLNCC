const router = require('express').Router();

const usersServices = require('./users.services');

router.get('/users', usersServices.getUsers);

router.post('/users', usersServices.createNewUser);

router.get('/users/:id', usersServices.getOneUser);

module.exports = router;
