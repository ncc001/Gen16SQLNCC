const Ingredients = require('../models/ingredients.models')
const uuid = require('uuid')

const getAllIngredients = async () => {
    const data = await Ingredients.findAll()
    return data
}

const getIngredientsById = async (id) => {
    const data = await Ingredients.findOne({
        where: {
            id
        }
    })
    return data
}

const createIngredients = async (data) => {
    const newIngredients = await Ingredients.create({
        id: uuid.v4(),
        name: data.name,
        typeId: data.typeId,
        urlImg: data.urlImg
    })
    return newIngredients
}


const updateIngredients = async (id, data) => {
    const response = await Ingredients.update(data, {
        where: {
            id
        }
    })
    return response
}


const deleteIngredients = async (id) => {
    const data = await Ingredients.destroy({
        where: {
            id
        }
    })
    return data
}



module.exports = {
    getAllIngredients,
    getIngredientsById,
    createIngredients,
    deleteIngredients,
    updateIngredients
}