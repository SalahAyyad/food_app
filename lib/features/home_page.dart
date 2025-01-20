// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/core/models/catergory_model.dart';
import 'package:food_app/core/models/food_model.dart';
import 'package:food_app/core/widgets/AppDrawer.dart';
import 'package:food_app/core/widgets/custome_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Appdrawer(),
        appBar: CustomeAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(children: [
                            Image.asset(
                              category.imageUrl,
                              width: 50,
                            ),
                            Text(category.name)
                          ])),
                    );
                  }),
            ),
            SizedBox(
              height: 16,
            ),
            GridView.builder(
                itemCount: food.length,
                itemBuilder: (context, index) {


       return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Image.network(
                          food[0].imgUrl,
                          width: 80,
                        ),SizedBox(height: 5,),
                        Text(food[0].name),
                        SizedBox(height: 5,),
                        Text('\$${food[0].price}')
                      ]));

                 },
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
               )
          ]),
        ));
  }
}
