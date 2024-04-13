import 'package:flutter/material.dart';

class SmallPagePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Step 1
    final paintgrey = Paint()..color = Colors.grey;
    var rrectRed =
    RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(8.0));
    canvas.drawRRect(rrectRed, paintgrey);

    //Step 2
    final paintWhite = Paint()..color = Color(0xFFFBF287);
    var rrectWhite =
    RRect.fromLTRBR(5, 0, size.width, size.height, Radius.circular(8.0));
    canvas.drawRRect(rrectWhite, paintWhite);

    //Step 3
    final int numOfLines = (size.height/30).round();
    final double linePlacementRatio = 1/numOfLines;
    final paintDarkgrey = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 1.0;
    for (var i = 1; i < numOfLines; i++){
      print(size.height);
      print(linePlacementRatio);
      canvas.drawLine(Offset(0, size.height * linePlacementRatio*i),
          Offset(size.width, size.height * linePlacementRatio*i), paintDarkgrey);
    }
    // canvas.drawLine(Offset(0, size.height * .2),
    //     Offset(size.width, size.height * .2), paintDarkgrey);
    // canvas.drawLine(Offset(0, size.height * .4),
    //     Offset(size.width, size.height * .4), paintDarkgrey);
    // canvas.drawLine(Offset(0, size.height * .6),
    //     Offset(size.width, size.height * .6), paintDarkgrey);
    // canvas.drawLine(Offset(0, size.height * .8),
    //     Offset(size.width, size.height * .8), paintDarkgrey);
    // canvas.drawLine(Offset(0, size.height * .5),
    //     Offset(size.width, size.height * .5), paintDarkgrey);
    // canvas.drawLine(Offset(0, size.height * .6),
    //     Offset(size.width, size.height * .6), paintDarkgrey);
    // canvas.drawLine(Offset(0, size.height * .7),
    //     Offset(size.width, size.height * .7), paintDarkgrey);
    // canvas.drawLine(Offset(0, size.height * .8),
    //     Offset(size.width, size.height * .8), paintDarkgrey);
    // canvas.drawLine(Offset(0, size.height * .9),
    //     Offset(size.width, size.height * .9), paintDarkgrey);



    //Step 4
    final paintPink = Paint()
      ..color = Colors.pinkAccent
      ..strokeWidth = 2.5;
    canvas.drawLine(Offset(size.width * .1, 0),
        Offset(size.width * .1, size.height), paintPink);
  }

  @override
  bool shouldRepaint(SmallPagePainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRebuildSemantics(SmallPagePainter oldDelegate) {
    return false;
  }
}