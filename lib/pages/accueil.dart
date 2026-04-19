import 'package:flutter/material.dart';
import 'package:quizapp/pages/profil.dart';

import '../theme/colors.dart';
import 'historique.dart';
import 'homePage.dart';


class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
    const Profil(),
    const Historique(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primaryColor
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Welcome to you Safi',
            style: TextStyle(fontSize: 18, color: AppColors.secondaryColor, fontWeight: FontWeight.bold),
          ),
        ),

        body: _pages[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Historique',
            ),
          ],
          selectedItemColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
