//import 'package:flash_cards/models/flash_card_model.dart';
import 'package:flash_cards/data/database.dart';
import 'package:flash_cards/widgets/flash_card_widget.dart';
import 'package:flutter/material.dart';
//import 'package:flash_cards/widgets/flash_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:flash_cards/providers/card_provider.dart';
// import 'dart:math';

class FlashCardLearningScreen extends StatefulWidget {
  static const String id = 'flash_card_screen';

  @override
  State<FlashCardLearningScreen> createState() =>
      _FlashCardLearningScreenState();
}

class _FlashCardLearningScreenState extends State<FlashCardLearningScreen> {
  late bool isFront;

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final cards = provider.cards;
    final listName = provider.listName;

    CardsDataBase dataBase = CardsDataBase();

    return !dataBase.loadData(listName).isEmpty
        ? cards.isEmpty
            ? Center(
                child: ElevatedButton(
                  child: Text('Restart'),
                  onPressed: () {
                    final provider =
                        Provider.of<CardProvider>(context, listen: false);
                    provider.resetUsers();
                  },
                ),
              )
            : Stack(
                children: cards
                    .map((e) => FlashCardWidget(
                          flashModel: e,
                          isfront: cards.last == e,
                        ))
                    .toList())
        : Center(
            child: Container(
              child: Text('Add flash cards first'),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Learning Screen',
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            buildCards(),
          ],
        ),
      ),
    );
  }
}
