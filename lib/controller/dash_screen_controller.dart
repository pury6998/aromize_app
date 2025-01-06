import 'package:aromize_app/views/dashboard/home_screen.dart';
import 'package:aromize_app/views/dashboard/my_cart_screen.dart';
import 'package:aromize_app/views/dashboard/profile_screen.dart';
import 'package:aromize_app/views/dashboard/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashScreenController extends GetxController {
  final dashKey = GlobalKey<ScaffoldState>();
  RxList<Widget> pages = RxList([
    HomeScreen(), 
    ShopScreen(), 
    MyCartScreen(),
    ProfileScreen(),
    
    ]);
  RxInt currentIndex = RxInt(0);

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
