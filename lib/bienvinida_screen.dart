// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'login.dart';

class BienvenidScreen extends StatefulWidget {
  const BienvenidScreen({Key? key}) : super(key: key);

  @override
  BienvenidScreenState createState() => BienvenidScreenState();
}

class BienvenidScreenState extends State<BienvenidScreen> {
  double _opacity = 0.0; // Inicialmente, la opacidad es 0 (invisible)
  bool _animationForward = true; // Indica si la animación va hacia adelante

  @override
  void initState() {
    super.initState();

    // Agregar un retardo para que la imagen aparezca después de un tiempo
    Future.delayed(Duration(seconds: 2), () {
      _startAnimation();
    });
  }

  // Método para iniciar o invertir la animación
  void _startAnimation() {
    setState(() {
      _opacity = _animationForward ? 1.0 : 0.0; // Cambiar la opacidad
      _animationForward =
          !_animationForward; // Invertir la dirección de la animación
    });

    // Programar la próxima ejecución de la animación
    Future.delayed(Duration(seconds: 2), () {
      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/pantalla.png', // Ruta de la imagen de bienvenida
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
          ),
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 1), // Duración de la animación
            child: Image.asset(
              'assets/images/mono.png', // Ruta de la imagen PNG
              width: 800,
              height: 800,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xFF00BF63)),
                child: const Text(
                  "Ingresar",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 249, 250, 249)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
