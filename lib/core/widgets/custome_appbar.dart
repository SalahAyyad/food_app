// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_app/core/colors.dart';

class CustomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
    title: Column(
          children:  [
            Text('Current location ', style: TextStyle(color:AppColor.greyColor,fontSize: 14),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.location_on, color: AppColor.greenColor,)
            ,
             Text('Nablus, Palestine')],
           )
      
        ]),
       actions: [Icon(Icons.notifications, )],
   );
  }
  
  @override
 
  Size get preferredSize => Size.fromHeight(80);
}