// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/core/models/food_model.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:food_app/core/widgets/AppDrawer.dart';
import 'package:food_app/core/widgets/custome_appbar.dart';

class ProductDetails extends StatelessWidget {


  final FoodItem product;
  const ProductDetails({super.key, required this.product});
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Appdrawer(),
      appBar: CustomeAppbar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                product.name,
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(product.imgUrl),
                radius: 80,
                
                
                
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '\$  ${product.price}',
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                product.description,
                style: TextStyle(color: AppColor.greyColor, fontSize: 16),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                ),
                child: Text(
                  'Nice!',
                  style: TextStyle(color: AppColor.whiteColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
