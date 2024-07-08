const router = require('express').Router();
const FoodController = require('../controllers/foodController');
const {verifyVendor} = require('../middleware/verifyToken');

router.post("/", verifyVendor, FoodController.addFood);

router.get("/recommendation/:code", FoodController.getRandomFood);

router.get("/byCode/:code", FoodController.getAllFoodsByCode);

router.get("/:id", FoodController.getFoodById);

router.get("/restaurant-foods/:id", FoodController.getFoodsByRestaurant);

router.get("/search/:search", FoodController.searchFoods);

router.get("/:category/:code", FoodController.getFoodsByCategoryAndCode);

module.exports = router;