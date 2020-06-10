import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(child: CuadradoAnimado()),
    );
  }
}

class _Rectangulo extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  // ANimation controller
  AnimationController controller;

  // Animaciones
  Animation<double> rotacion;

  // Ciclo vida 
  @override
  void initState() {
    // Vertical sync.
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000)
    );

    // Grado de rotacion en tiempo estipulado por animation controller
    rotacion = Tween(begin: 0.0, end: 2.0).animate(controller);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      // child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {

        return Transform.rotate(
          angle: rotacion.value,
          child: _Rectangulo());
      
      },
  );
  }
}