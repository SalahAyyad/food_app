// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:food_app/core/widgets/AppDrawer.dart';
import 'package:food_app/core/widgets/custome_appbar.dart';
import 'package:food_app/features/favoriate.dart';
import 'package:food_app/features/home_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  List<Widget> bodyOptions = [
    HomePage(),
    FavoriatePage(),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Appdrawer(),
      appBar: CustomeAppbar(),
      body: bodyOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.primaryColor,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedLabelStyle: TextStyle(color: AppColor.whiteColor, fontSize: 14),
        unselectedLabelStyle: TextStyle(color: AppColor.greyColor, fontSize: 10),
        selectedItemColor: AppColor.whiteColor,
        unselectedItemColor: AppColor.greyColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: selectedIndex,
      ),
    );
  }
}
