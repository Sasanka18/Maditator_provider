import 'package:flutter/material.dart';
import 'package:flutter_meditator/pages/main_screens/create_custom_exerice_page.dart';
import 'package:flutter_meditator/pages/main_screens/custom_exerice_page.dart';
import 'package:flutter_meditator/pages/main_screens/home_page.dart';
import 'package:flutter_meditator/pages/main_screens/mindfull_exerices_page.dart';
import 'package:flutter_meditator/pages/main_screens/profile_page.dart';
import 'package:flutter_meditator/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _Pages = [
    HomePage(),
    MindfullExericePage(),
    CreateCustomExericePage(),
    CustomExericePage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items:  [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg',
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0 ?
                   AppColors.primaryPurple 
                  : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/brain.svg',
              colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ?
                   AppColors.primaryPurple 
                  : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),),
              label: 'Mindfull',
            ),
             BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/circle-plus.svg',
              colorFilter: ColorFilter.mode(
                  _selectedIndex == 2 ?
                   AppColors.primaryPurple 
                  : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Create',
            ),
             BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/file-plus-2.svg',
              colorFilter: ColorFilter.mode(
                  _selectedIndex == 3 ?
                   AppColors.primaryPurple 
                  : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Custom',
            ),
             BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/user-round-cog.svg',
              colorFilter: ColorFilter.mode(
                  _selectedIndex == 4 ?
                   AppColors.primaryPurple 
                  : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
        ),
      ),
      body: _Pages[_selectedIndex],
    );
  }
}