// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:food_app/core/models/food_model.dart';
import 'package:food_app/core/utils/navigator.dart';
import 'package:food_app/features/product_details.dart';

class FavoriatePage extends StatefulWidget {
  const FavoriatePage({super.key});

  @override
  State<FavoriatePage> createState() => _FavoriatePageState();
}

class _FavoriatePageState extends State<FavoriatePage> {
   List<FoodItem> favoritedProducts = food.where((item) {
    return item.isFavorite.value == true;
  }).toList();
  bool favedclick = true;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: favoritedProducts.length,
        itemBuilder: (context, index) {
          return ValueListenableBuilder<bool>(
            valueListenable: favoritedProducts[index].isFavorite,
            builder: (context, isFavorite, _) {
              return  GestureDetector(
                onTap: () {
                        pushTo(context, ProductDetails(product: food[index],));


                    },
                child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              favoritedProducts[index].imgUrl,
                              width: 80,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(favoritedProducts[index].name),
                            SizedBox(
                              height: 5,
                            ),
                            Text('\$${favoritedProducts[index].price}')
                          ])),
                  Positioned(
                    top: -5,
                    left: 130,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          favoritedProducts[index].isFavorite.value = !favedclick;
                          favedclick = !favedclick;
                          favoritedProducts = food.where((item) {
                              return item.isFavorite.value == true;
                            }).toList();
                        });
                      },
                      icon: Icon(
                        favoritedProducts[index].isFavorite.value
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: favoritedProducts[index].isFavorite.value
                            ? AppColor.primaryColor
                            : AppColor.greyColor,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  )
                ],
                            ),
              );} 
          );
        },
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      ),
    );
  }
}
