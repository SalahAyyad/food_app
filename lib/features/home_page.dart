// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:food_app/core/models/catergory_model.dart';
import 'package:food_app/core/models/food_model.dart';
import 'package:food_app/core/utils/navigator.dart';
import 'package:food_app/features/product_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;
  late List<FoodItem> fliteredProducts;
  bool favedclick   = false;

  @override
  void initState() {
    super.initState();
    fliteredProducts = food;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/images/classic_burger.jpg'),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Categories.length,
                itemBuilder: (context, index) {
                  var category = Categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryId = category.id;
                          fliteredProducts = food.where((item) {
                            return item.category.id == selectedCategoryId;
                          }).toList();
                        });
                      },
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: category.id == selectedCategoryId
                                ? AppColor.primaryColor
                                : AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(children: [
                              Image.asset(
                                category.imageUrl,
                                width: 50,
                              ),
                              Text(
                                category.name,
                                style: TextStyle(
                                  color: category.id == selectedCategoryId
                                      ? AppColor.whiteColor
                                      : AppColor.blackColor,
                                ),
                              )
                            ]),
                          )),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 16,
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: fliteredProducts.length,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                        pushTo(context, ProductDetails(product: food[index],));


                    },
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                fliteredProducts[index].imgUrl,
                                width: 80,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(fliteredProducts[index].name),
                              SizedBox(
                                height: 5,
                              ),
                              Text('\$${fliteredProducts[index].price}')
                            ])),
                  ),
                  Positioned(
                    top: -5,
                    left: 130,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          fliteredProducts[index].isFavorite.value = !favedclick;
                          favedclick = !favedclick;
                        });
                      },
                      icon: Icon(fliteredProducts[index].isFavorite.value?
                        Icons.favorite:   Icons.favorite_border,
                        color: fliteredProducts[index].isFavorite.value
                            ? AppColor.primaryColor
                            : AppColor.greyColor,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                  )
                ],
              );
            },
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          )
        ]),
      ),
    );
  }
}
