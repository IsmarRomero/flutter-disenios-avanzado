import 'package:disenios_avanzados/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100) {
              porcentaje =0;
            }
          });
        },
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: RadialProgress(porcentaje: porcentaje, colorPrimario: Colors.red,
           colorSecundario: Colors.grey, grosorSecundario: 10, grosorPrimario: 10,),
          // child:  Text('$porcentaje %', style: TextStyle(fontSize: 50.0)),
        ),)
    );
  }
}