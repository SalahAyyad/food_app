import 'package:flutter/material.dart';
import 'package:food_app/core/models/catergory_model.dart';

class FoodItem{

  final String id;
  final String name;
  final String imgUrl;
  final double price;
  final String description;
  final CategoryModel category;
   final ValueNotifier<bool> isFavorite;
  
  

  FoodItem({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.price,
    this.description = 'this whole paragraph is the description for this imaginary food that dont exist in the real world and no matter how much you pay you will not get it , its will never be atainable and you can waste your whole life in the chase , just forget it and give up , and focus on coding your only hungry cuz its late in the night and you stare to a screen while being lost in your thoughts why this code isnt working ',
    required this.category,
    required bool isFavorite,
     
  }): isFavorite = ValueNotifier<bool>(isFavorite);
}

List<FoodItem> food = [
  FoodItem(
    id: '1',
    name: 'Beef Burger',
    imgUrl:
        'https://www.freepnglogos.com/uploads/burger-png/download-hamburger-burger-png-image-png-image-pngimg-15.png',
    price: 8.5,
    category: Categories[0],
    isFavorite : false,
  ),
  FoodItem(
    id: '2',
    name: 'Chicken Burger',
    imgUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
    price: 9.5,
    category: Categories[0],
    isFavorite : false,
  ),
  FoodItem(
    id: '3',
    name: 'Cheese Burger',
    imgUrl: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png',
    price: 8,
    category: Categories[0],
    isFavorite : false,
  ),
  FoodItem(
    id: '4',
    name: 'Chicken Pizza',
    imgUrl:
        'https://graficsea.com/wp-content/uploads/2021/12/Chicken-Supreme-Pizza-.png',
    price: 9,
    category: Categories[1],
    isFavorite : false,
  ),
  FoodItem(
    id: '5',
    name: 'Pasta',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    isFavorite : false,
  ),
  FoodItem(
    id: '6',
    name: 'Pasta2',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    isFavorite : false,
  ),
  FoodItem(
    id: '7',
    name: 'Pasta3',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    isFavorite : false,
  ),
  FoodItem(
    id: '8',
    name: 'Pasta4',
    imgUrl:
        'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png',
    price: 7,
    category: Categories[2],
    isFavorite : false,
  ),
];
