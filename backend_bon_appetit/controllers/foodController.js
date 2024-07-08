const Food = require('../models/food');

module.exports = {
    addFood: async (req, res) => {
        const { title, foodTags, category, code, restaurant, description, time, price, additives, imageUrl } = req.body;

        if (!title || !foodTags || !category || !code || !restaurant || !description || !time || !price || !additives || !imageUrl) {
            return res.status(400).json({ status: false, message: "You have a missing field" });
        }

        try {
            const newFood = new Food(req.body);

            await newFood.save();

            res.status(201).json({ status: true, message: "Food has been successfully added" });
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },

    getFoodById: async (req, res) => {
        const id = req.params.id;
        try {
            const food = await Food.findById(id);

            res.status(200).json(food);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },

    getRandomFood: async (req, res) => {
        const code = req.params.code;
        let randomFoods=[];
        try {
            if (code) {
                randomFoods = await Food.aggregate([
                    { $match: { code: code, isAvailable: true } },
                    { $sample: { size: 5 } },
                    { $project: { __v: 0 } }
                ])
            }

            if (randomFoods.length === 0) {
                randomFoods = await Food.aggregate([
                    { $match: { isAvailable: true } },
                    { $sample: { size: 5 } },
                    { $project: { __v: 0 } }
                ])
            }
            if (randomFoods.length === 0) {
                randomFoods = await Food.aggregate([
                    { $sample: { size: 5 } },
                    { $project: { __v: 0 } }
                ])
            }

            if(randomFoods.length){
                res.status(200).json(randomFoods);
            }else{
                res.status(404).json({status:false, message: 'No Food is avilable right now'})
            }
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },

    getAllFoodsByCode: async (req, res) => {
        const code = req.params.code;

        try {
            const foodList = await Food.find({code : code});

            res.status(200).json(foodList);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },


    //Restaurant Menu
    getFoodsByRestaurant: async (req, res) => {
        const id = req.params.id;

        try {
            const foods = await Food.find({ restaurant: id , isAvailable: true});

            res.status(200).json(foods);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },

    getFoodsByCategoryAndCode: async (req, res) => {
        const { category, code } = req.params;
        try {
            let foods = [];
            foods = await Food.aggregate([
                { $match: { category: category, code: code, isAvailable: true } },
                { $project: { __v: 0 } }
            ]);

            res.status(200).json(foods);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },


    searchFoods: async (req, res) => {
        const search = req.params.search;

        try {
            const results = await Food.aggregate([
                {
                    $search:{
                        index: "foods",
                        text: {
                            query: search,
                            path: {
                                wildcard: "*"
                            }
                        }
                    }
                }
            ])

            res.status(200).json(results);
        } catch (error) {
            res.status(500).json({ status: false, message: error.message });
        }
    },

    getRandomFoodsByCategoryAndCode: async (req, res) => {
        const {category, code} = req.params;

        try {
            let foods;

            foods = await Food.aggregate([
                {$match: {category: category, code: code, isAvailable: true}},
                {$sample: {size: 10}},
            ])

            if(!foods || foods.length === 0){
                foods = await Food.aggregate([
                    {$match: {code: code, isAvailable: true}},
                    {$sample: {size: 10}},
                ])
            }else if(!foods || foods.length === 0){
                foods = await Food.aggregate([
                    {$match: {isAvailable: true}},
                    {$sample: {size: 10}},
                ])
            }
            res.status(200).json(foods);
        } catch (error) {
           res.status(500).json({status: false, message: error.message}) 
        }
    }
};