import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widget/text.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/drapeau.png',
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'G-Quizz',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.secondaryColor,
                      ),
                    )
                  ],
                ),

              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text('Veillez choisir une Categorie pour JOUER',
                  style: TextStyle(fontSize: 14, color: AppColors.secondaryColor, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              GridView.count(
                padding: const EdgeInsets.all(16),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  BlurCard(
                    image: "assets/images/drapeau.png",
                    title: 'Independance',
                    subtitle: '10',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/niveau',
                        arguments:
                        "Independance", // ✅ envoie la catégorie au quiz
                      );
                    },
                  ),
                  BlurCard(
                    image: "assets/images/his.jpg",
                    title: "Grandes Figures Historique",
                    subtitle: "15",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/niveau',
                        arguments:
                        " Figures Historique", // ✅ envoie la catégorie au quiz
                      );
                    },
                  ),
                  BlurCard(
                    image: "assets/images/hou.jpg",
                    title: "Periode Colonial",
                    subtitle: "12",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/niveau',
                        arguments:
                        "Periode Colonial", // ✅ envoie la catégorie au quiz
                      );
                    },
                  ),
                  BlurCard(
                    image: "assets/images/boo.jpg",
                    title: "Histoire Politique",
                    subtitle: "12",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/niveau',
                        arguments:
                        "Histoire Politique", // ✅ envoie la catégorie au quiz
                      );
                    },
                  ),
                  BlurCard(
                    image: "assets/images/boo.jpg",
                    title: "Histoire Politique",
                    subtitle: "12",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/niveau',
                        arguments:
                        "Histoire Politique", // ✅ envoie la catégorie au quiz
                      );
                    },
                  ),
                  BlurCard(
                    image: "assets/images/boo.jpg",
                    title: "Histoire Politique",
                    subtitle: "12",
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/niveau',
                        arguments:
                        "Histoire Politique", // ✅ envoie la catégorie au quiz
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
