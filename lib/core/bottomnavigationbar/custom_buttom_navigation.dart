
import 'package:flutter/material.dart';
import 'package:WhatsUp/core/resource/constants/my_colors.dart';
class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});
  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}
class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _currentIndex = 1;
  List<Widget> body=[
    // EstekhareScreen(),
    // HomeScreen(),
    // GhazaliatFavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex = 0;
          });
          return false; // Prevent default back navigation
        }
        return true; // Allow default back navigation
      },
      child: Scaffold(
        body: Center(child: body[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:MyColors.selectedButtonNavBarColor,
          backgroundColor: MyColors.bottomNavigationBarBackgroundColor,
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items:  [
            BottomNavigationBarItem(
              label: 'استخاره',
              icon: Image.asset('assets/icons/list.png'),
            ),
            BottomNavigationBarItem(
              label: 'خانه',
              icon: Image.asset('assets/icons/home.png'),
            ), 
            BottomNavigationBarItem(
              label: 'مورد علاقه',
              icon: Image.asset('assets/icons/heart.png'),
            ),
          ],
        ),
      ),
    );
  }
}