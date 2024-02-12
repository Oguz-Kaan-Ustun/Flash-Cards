import 'package:flash_cards/models/flash_card_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CardsDataBase {
  // List<FlashModel> cardsList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  //run this method if creating new list
  void createInitialData(String listName) {
    _myBox.put(listName, []);
  }

  // load the data from database
  dynamic loadData(String listName) {
    return _myBox.get(listName);
    // if(cardsList != null){
    //   return cardsList;
    // } else {
    //   return [
    //     FlashModel(back: "test 1", front: "test 2")
    //   ];
    // }
  }

  // update the database
  void updateDataBase(String listName, List listContent) {
    _myBox.put(listName, listContent);
  }

  void addToDataBase(String listName, FlashModel flashModel){
    List<FlashModel> newList = _myBox.get(listName).add(flashModel);
    _myBox.put(listName, newList);
  }
}