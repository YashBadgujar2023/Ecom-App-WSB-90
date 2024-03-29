


import 'package:e_commerce/Screen/home/favorite.dart';
import 'package:e_commerce/Screen/home/homescreen.dart';
import 'package:e_commerce/Screen/home/order.dart';
import 'package:e_commerce/Screen/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
   var _widget =[
     homescreen(),
     favorite(),
     order(),
     profile(),
   ];
   var _icon = [
     Iconsax.home,
     Icons.shopping_cart,
     Icons.person,
     Icons.access_alarms_outlined,
   ];
   int bottomindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 0,
        selectedIndex: bottomindex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        indicatorColor: Colors.black26,
        onDestinationSelected: (index){
          setState(() {
            bottomindex = index;
          });
        },
        animationDuration: Duration(milliseconds: 1500),
        destinations: const [
          NavigationDestination(
              icon: Icon(Iconsax.home),
              label: "Home",
          ),
          NavigationDestination(
              icon: Icon(Iconsax.favorite_chart),
              label: "Favorite"
          ),
          NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: "Order",
          ),
          NavigationDestination(
              icon: Icon(Iconsax.user),
              label: "Profile"
          ),
        ],
      ),
      body: Center(
        child: _widget[bottomindex],
      ),
    );
  }
}
