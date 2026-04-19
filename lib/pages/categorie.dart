// import 'package:flutter/material.dart';
// import 'widget/widgetCategorie.dart';
//
// class Categorie extends StatefulWidget {
//   const Categorie({super.key});
//
//   @override
//   State<Categorie> createState() => _CategorieState();
// }
//
// class _CategorieState extends State<Categorie> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         leading: IconButton(
//             onPressed: (){
//               Navigator.pushNamed(context, '/home');
//             },
//             icon: Icon(Icons.arrow_back_ios,
//               color: Colors.white,
//               size: 30,
//             )
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(padding: EdgeInsets.all(10)),
//             Text('Choissiez une categorie',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 )
//             ),
//             SizedBox(height: 20,),
//             WidgetCategorie(
//               color: const Color.fromARGB(255, 39, 107, 137),
//               image: "assets/images/drapeau.png",
//               type: "Independance",
//               nbreQuestion: "10",
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   '/quiz',
//                   arguments:"Independance", // ✅ envoie la catégorie au quiz
//                 );
//               },
//             ),
//             WidgetCategorie(
//               color: const Color.fromARGB(255, 209, 93, 10),
//               image: "assets/images/his.jpg",
//               type: "Grandes Figures Historique",
//               nbreQuestion: "15",
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   '/quiz',
//                   arguments: " Figures Historique", // ✅ envoie la catégorie au quiz
//                 );
//               },
//             ),
//             WidgetCategorie(
//               color: const Color.fromARGB(255, 37, 88, 27),
//               image: "assets/images/hou.jpg",
//               type: "Periode Colonial",
//               nbreQuestion: "12",
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   '/quiz',
//                   arguments:  "Periode Colonial", // ✅ envoie la catégorie au quiz
//                 );
//               },
//             ),
//             WidgetCategorie(
//               color: const Color.fromARGB(255, 203, 193, 6),
//               image: "assets/images/boo.jpg",
//               type: "Histoire Politique",
//               nbreQuestion: "12",
//               onTap: () {
//                 Navigator.pushNamed(
//                   context,
//                   '/quiz',
//                   arguments:  "Histoire Politique", // ✅ envoie la catégorie au quiz
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }