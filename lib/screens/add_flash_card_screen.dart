import 'package:flutter/material.dart';
import 'package:flash_cards/models/flash_card_model.dart';
import '../data/database.dart';

class AddFlashCardScreen extends StatefulWidget {

  AddFlashCardScreen({required this.listName});

  String listName;

  @override
  State<AddFlashCardScreen> createState() => _AddFlashCardScreenState();
}

class _AddFlashCardScreenState extends State<AddFlashCardScreen> {
  FlashModel flashModel = FlashModel(back: 'Enter answer', front: 'Enter question');

  CardsDataBase dataBase = CardsDataBase();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Question',
              ),
              onSubmitted: (String value) {
                setState(() {
                  flashModel.front = value;
                });
              },
            ),
            SizedBox(height: 15),
            TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Answer',
              ),
              onSubmitted: (String value) {
                setState(() {
                  flashModel.back = value;
                });
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey[50]),
                  iconColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: (){
                  if(flashModel.front != 'Enter question' && flashModel.back != 'Enter answer'){
                    dataBase.addToDataBase(widget.listName, flashModel);
                  } else {
                    throw('Please fill in the required fields');
                  }
                },
                child: Container(
                  height: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.folder_outlined),
                      SizedBox(width: 15),
                      Text(
                        'New Folder',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            SizedBox(height: 25)
          ],
        ),
      ),
    );
  }
}