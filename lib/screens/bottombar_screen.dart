import 'package:alisons_mt/screens/Cart_screen.dart';
import 'package:alisons_mt/screens/category_screen.dart';
import 'package:alisons_mt/screens/home_screen.dart';
import 'package:alisons_mt/screens/profile_screen.dart';
import 'package:alisons_mt/utils/constent/appcolors.dart';
import 'package:flutter/material.dart';

class BottombarScreens extends StatefulWidget {
  const BottombarScreens({super.key});

  @override
  __BottombarScreensState createState() => __BottombarScreensState();
}

class __BottombarScreensState extends State<BottombarScreens> {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Appcolors.primaryColor,
        backgroundColor: Colors.white60,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.apps_outlined),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_currentPageIndex],
    );
  }
}
