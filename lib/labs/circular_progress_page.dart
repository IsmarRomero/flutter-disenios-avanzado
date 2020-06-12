import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {

  AnimationController controller;
  double porcentaje = 10;
  double nuevoporcentaje = 0.0;

  @override
  void initState() {
    controller = new AnimationController(vsync: this, 
    duration: Duration(milliseconds: 800));

    controller.addListener(() {
      // Interporlar dos numeros
      // print('valor controller: ${controller.value}');
      setState(() {
       porcentaje = lerpDouble(porcentaje, nuevoporcentaje, controller.value);
      });
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
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgressPainter(porcentaje)
          ),
        ),
      ),
      floatingActionButton: 
      FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          porcentaje = nuevoporcentaje;
          nuevoporcentaje += 10;
          if(nuevoporcentaje > 100) {
            porcentaje = 0;
            nuevoporcentaje = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        ),
    );
  }
}

class _MiRadialProgressPainter extends CustomPainter {

  final porcentaje;

  _MiRadialProgressPainter(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    
    // Circulo completado

    final paint = new Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width / 2, size.height / 2);
    final radio = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radio, paint);

    // arco

    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // PArte que se debera de ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco);




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}