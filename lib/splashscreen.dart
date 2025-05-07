import 'package:flutter/material.dart';
import 'dart:async';

import 'package:muevelo/home.dart'; // Para manejar el temporizador

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Temporizador de 5 segundos para ir a la pantalla principal
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5B000B),
      body: GestureDetector(
        onTap: () {
          // Navegar a la pantalla principal al hacer clic
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        child: Center(
          child: Image.asset(
            'imagenes/LogoMuevelo.png', // Ruta de la imagen en los assets
            width: 200, // Tamaño personalizado de la imagen
            height: 200,
          ),
        ),
      ),
    );
  }
}


