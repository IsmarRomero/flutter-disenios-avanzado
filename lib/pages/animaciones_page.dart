import 'package:flutter/material.dart';
import 'dart:math' as math;

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
  Animation<double> opacidad;
  Animation<double> moverDerecha;
  Animation<double> agrandar;
  Animation<double> opacidadOut;

  // Ciclo vida 
  @override
  void initState() {
    // Vertical sync.
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000)
    );


    // Grado de rotacion en tiempo estipulado por animation controller
    rotacion = Tween(begin: 0.0, end: 2.0 * math.pi).animate(
      CurvedAnimation(curve: Curves.easeOut, parent: controller)
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(curve: Interval(0, 0.25, curve: Curves.easeOut), parent: controller)
    );

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(curve: Interval(0.75, 1, curve: Curves.easeOut), parent: controller)
    );


    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(curve: Curves.easeOut, parent: controller)
    );

     agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(curve: Curves.easeOut, parent: controller)
    );


    controller.addListener(() {
      if ( controller.status == AnimationStatus.completed){
         controller.repeat();
        // controller.reset();
      }
      // } else if (controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
    });

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
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {

        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
           child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity:  opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: child),)),
        );
      
      },
  );
  }
}