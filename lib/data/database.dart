import 'package:flash_cards/models/flash_card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flash_cards/utilities/constants.dart';

class CardsDataBase extends ChangeNotifier {
  // List<FlashModel> cardsList = [];

  // reference our box
  Box _myBox = Hive.box(AppConstants.flashCardBoxName);
  Box get myBox => _myBox;

  // //Update the value '_myBox' for provider
  // void updateBox() {
  //   _myBox = Hive.box(AppConstants.flashCardBoxName);
  // }

  //run this method if creating new list
  void createInitialData(String listName) {
    _myBox.put(listName, []);
    notifyListeners();
  }

  // load the data from database
  dynamic loadData(String listName) {
    return _myBox.get(listName);
  }

  // update the database
  void updateDataBase(String listName, List listContent) {
    _myBox.put(listName, listContent);
  }

  // add flash card to database
  void addToDataBase(String listName, FlashModel flashModel){
    List newList = _myBox.get(listName);
    newList.add(flashModel);
    _myBox.put(listName, newList);
  }

  void updateFlashCard(int listIndex, bool? isKnown, String listName) {
     print(listIndex);
    List listFromBox = _myBox.get(listName);
    FlashModel flashModelFromList = listFromBox[listIndex];
     print(_myBox.get(listName)[listIndex].isKnown);
    flashModelFromList.isKnown = isKnown;
    listFromBox[listIndex] = flashModelFromList;
     print(_myBox.get(listName)[listIndex].isKnown);
    updateDataBase(listName, listFromBox);
  }
}