import 'package:flutter/material.dart';
import 'package:gym_app/constants/colors.dart';
import 'package:gym_app/views/home_page.dart';
import 'package:gym_app/views/profile_page.dart';
import 'package:gym_app/views/training_page.dart';

import '../components/default_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final List<Widget> _telas = [
    const HomePage(),
    const TrainingPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      body: _telas[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kSecondaryColor,
        currentIndex: _index,
        onTap: toggleClick,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _index == 0
              ? BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/home.png',
                    scale: 20,
                  ),
                  label: '',
                )
              : BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/home_outlined.png',
                    scale: 20,
                  ),
                  label: '',
                ),
          _index == 1
              ? BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/halter.png',
                    scale: 20,
                  ),
                  label: '',
                )
              : BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/halter_outlined.png',
                    scale: 20,
                  ),
                  label: '',
                ),
          _index == 2
              ? BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/avatar.png',
                    scale: 20,
                  ),
                  label: '',
                )
              : BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/avatar_outlined.png',
                    scale: 20,
                  ),
                  label: '',
                ),
        ],
      ),
    );
  }

  void toggleClick(int index) {
    setState(() {
      _index = index;
    });
  }
}
