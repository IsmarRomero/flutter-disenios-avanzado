import 'package:disenios_avanzados/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Slideshow(
          bulletPrimario: 15.0,
          bulletSecundario: 12.0,
          colorPrimario: Colors.red,
          colorSecundario: Colors.grey,
          puntosArriba: false,
          slides: <Widget>[
          SvgPicture.asset('assets/svgs/1.svg'),
          SvgPicture.asset('assets/svgs/2.svg'),
          SvgPicture.asset('assets/svgs/3.svg'),
          SvgPicture.asset('assets/svgs/4.svg'),
          SvgPicture.asset('assets/svgs/5.svg'),
        ],),
      )
    );
  }
}
