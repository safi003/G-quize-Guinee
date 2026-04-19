import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widget/widgetniveau.dart';


class Niveau extends StatelessWidget {
  const Niveau({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // title: Text('Niveau',style: TextStyle(color: AppColors.secondaryColor ),
        title: Text(
          'Niveau',
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choisir le niveau',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Widgetniveau(
              color: Colors.green,
              text: 'Facile',
              image: 'assets/images/facile.png',
              onTap: () {},
            ),
            SizedBox(height: 20),
            Widgetniveau(
              color: Colors.yellow,
              text: 'Moyen',
              image: 'assets/images/moyen.png',
              onTap: () {},
            ),
            SizedBox(height: 20),
            Widgetniveau(
              color: Colors.red,
              text: 'Difficile',
              image: 'assets/images/dif.png',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
