import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_notes/app/screens/home/home_screen.dart';
import 'package:flutter_notes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  navigateToHome(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  navigateNamedToHome(context) {
    Navigator.pushNamedAndRemoveUntil(context, kHomeRoute, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // le scaffold est un widget spécial primordial pour l'utilisation des widgets dans chaque écran
      body: Column(
        //le column sert à organiser les widgets fils verticaelement
        mainAxisAlignment: MainAxisAlignment.center,
        //ici les fils sont centrer veriticalement
        children: [
          Padding(
            //le padding crée un espace autour du widget
            padding: const EdgeInsets.all(8.0),
            child: Center(
              //le widget image est un widget qui affiche les images depuis l'application ou depuis un network
              child: InkWell(
                onTap: () => navigateNamedToHome(context),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                ),
              ),
            ),
          ),
          const Padding(
            // un padding peut avoir plusieurs parametre : exemple ici le padding est seulement horizontale
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'Notes',
              style: TextStyle(
                  fontSize: 30, height: 1, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
