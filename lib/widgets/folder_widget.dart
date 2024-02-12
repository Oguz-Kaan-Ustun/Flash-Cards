import 'package:flash_cards/screens/add_flash_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/models/folder_model.dart';
import 'package:flash_cards/providers/card_provider.dart';
import '../screens/flash_card_learning_screen.dart';


class FolderWidget extends StatelessWidget {

  FolderWidget({required this.folderModel});

  final FolderModel folderModel;

  @override
  Widget build(BuildContext context) {

    CardProvider cardProvider = CardProvider();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 14,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlue[50]),
                  iconColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, FlashCardLearningScreen.id);
                  cardProvider.giveListName(folderModel.name);
                },
                child: Container(
                  height: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.filter_none),
                      SizedBox(width: 15),
                      Text(
                        folderModel.name,
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
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.lightBlue[50]),
                iconColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: (){
                showModalBottomSheet(
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                  ),
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child:Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddFlashCardScreen(listName: folderModel.name),
                    ),
                  ),
                );
              },
              child: Container(
                height: 60,
                child: Icon(Icons.more_horiz),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

