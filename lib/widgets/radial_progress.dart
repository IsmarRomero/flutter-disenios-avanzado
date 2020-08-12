import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  RadialProgress(
    {
      @required this.porcentaje,
     this.colorPrimario = Colors.blue,
     this.colorSecundario = Colors.grey,
      this.grosorSecundario = 4, 
      this.grosorPrimario = 10
     });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
 
  AnimationController controller;
  double porcentajeAnterior;
  

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(vsync: this,
    duration: Duration(milliseconds: 200));

     super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
     super.dispose();

  }
  
  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,

      builder: (BuildContext context, Widget child) {
       return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MiRadialProgressPainter( (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
         widget.colorPrimario,
         widget.colorSecundario,
         widget.grosorSecundario,
         widget.grosorPrimario
         )
      ),
      );
    },
    );
  }
}

class _MiRadialProgressPainter extends CustomPainter {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosoSecundario;
  final double grosorPrimario;

  _MiRadialProgressPainter(
    this.porcentaje, 
    this.colorPrimario,
    this.colorSecundario,
     this.grosoSecundario, this.grosorPrimario
    );

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset(0,0),
      radius: 180
    );

    final Gradient gradiente = new LinearGradient(colors: [
      Color(0xffC012FF),
      Color(0xff6D05E8),
      Colors.red
    ]);
    
    // Circulo completado

    final paint = new Paint()
      ..strokeWidth = grosoSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width / 2, size.height / 2);
    final radio = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radio, paint);

    // arco

    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
   // ..color = colorPrimario
   ..shader = gradiente.createShader(
     rect
   )
      ..strokeCap = StrokeCap.round
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