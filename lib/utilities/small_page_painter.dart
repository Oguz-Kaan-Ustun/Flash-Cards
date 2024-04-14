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
      canvas.drawLine(Offset(0, size.height * linePlacementRatio*i),
          Offset(size.width, size.height * linePlacementRatio*i), paintDarkgrey);
    }



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