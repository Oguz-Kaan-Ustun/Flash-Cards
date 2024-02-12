import '../utilities/page_painter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flash_cards/models/flash_card_model.dart';
import 'package:provider/provider.dart';
import 'package:flash_cards/providers/card_provider.dart';
import 'dart:math';


class FlashCardWidget extends StatefulWidget {

  FlashCardWidget({required this.flashModel, required this.isfront});

  final FlashModel flashModel;

  final bool isfront;

  @override
  State<FlashCardWidget> createState() => _FlashCardWidgetState();
}

class _FlashCardWidgetState extends State<FlashCardWidget> {
  int cardSide = 0;

  String cardContents(int side){
    if(side == 0) {
      return widget.flashModel.front;
    } else {
      return widget.flashModel.back;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.isfront) {
      return buildFrontCard();
    } else {
      return buildNormalCard();
    }
  }

  Widget buildFrontCard(){
    return Container(
      child: GestureDetector(
        onPanStart: (details) {
          final provider =
          Provider.of<CardProvider>(context, listen: false);

          provider.startPosition(details);
        },
        onPanUpdate: (details) {
          final provider =
          Provider.of<CardProvider>(context, listen: false);

          provider.updatePosition(details);
        },
        onPanEnd: (details) {
          final provider =
          Provider.of<CardProvider>(context, listen: false);

          provider.endPosition();
        },
        onDoubleTap: (){
          setState(() {
            if(cardSide == 0){
                cardSide = 1;
            }else{
              cardSide = 0;
            };
          });
        },

        child: LayoutBuilder(
          builder: (context, constraints) {
            final provider =
            Provider.of<CardProvider>(context, listen: true);
            final position = provider.position;
            final milliseconds = provider.isDragging ? 0 : 400;

            final center = constraints.smallest.center(Offset.zero);
            final angle = provider.angle * pi / 180;
            final rotatedMatrix = Matrix4.identity()
              ..translate(center.dx, center.dy)
              ..rotateZ(angle)
              ..translate(-center.dx, -center.dy);

            return AnimatedContainer(
              child: buildNormalCard(),
              //TODO: Add a spin animation
              duration: Duration(milliseconds: milliseconds),
              curve: Curves.easeInOut,
              transform: rotatedMatrix
                ..translate(position.dx, position.dy),
            );
          },
        ),
      ),
    );
  }

  Widget buildNormalCard(){
    return CustomPaint(
      painter: PagePainter(),
      child: Container(
        width: 300,
        //TODO: MAKE THE HEIGHT DYNAMIC
        height: 500,
        child: Row(
          children: [
            SizedBox(width: 40),
            Container(
              width: 250,
              child: Center(
                child: Text(
                  cardContents(cardSide),
                  style: GoogleFonts.indieFlower(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

