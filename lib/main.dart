import 'package:disenios_avanzados/pages/animaciones_page.dart';
import 'package:disenios_avanzados/pages/graficas_circulas_page.dart';

import 'package:disenios_avanzados/pages/headers_page.dart';
import 'package:disenios_avanzados/retos/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: GraficasCircularesPage()
    );
  }
}