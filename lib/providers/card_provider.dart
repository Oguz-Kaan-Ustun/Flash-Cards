// import 'package:flash_cards/widgets/flash_card_widget.dart';
import 'package:flash_cards/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/models/flash_card_model.dart';

enum CardStatus {right, wrong}


class CardProvider extends ChangeNotifier{

  CardsDataBase dataBase = CardsDataBase();

  String _listName = '';

  List<FlashModel> _cards = [];
  bool _isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<FlashModel> get cards => _cards;
  Offset get position => _position;
  bool get isDragging => _isDragging;
  double get angle => _angle;

  CardProvider() {
    resetUsers();
  }

  void giveListName(String listName){
    _listName = listName;
  }

  void setScreenSize(Size screenSize) => _screenSize = screenSize;

  void startPosition(DragStartDetails details) {
    _isDragging = true;

    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x =_position.dx;
    _angle = 30*x/_screenSize.width;

    notifyListeners();
  }

  void endPosition() {
    _isDragging = false;
    notifyListeners();

    final status = getStatus();

    _angle = 0;

    switch (status){
      case CardStatus.right:
        right();
        break;
      case CardStatus.wrong:
        wrong();
        break;
      default:
        resetPosition();
    }
  }

  CardStatus? getStatus(){
    final x = _position.dx;

    final delta = 100;

    if (x >= delta){
      return CardStatus.right;
    } else if (x <= -delta){
      return CardStatus.wrong;
    }
  }

  void right(){
    _angle = 20;
    _position += Offset(_screenSize.width *2 , 0);
    _nextCard();

    notifyListeners();
  }

  void wrong(){
    _angle = -20;
    _position -= Offset(_screenSize.width * 2, 0);
    _nextCard();

    notifyListeners();
  }

  Future _nextCard() async{
    if(_cards.isEmpty) return;

    await Future.delayed(Duration(milliseconds: 200));
    _cards.removeLast();
    resetPosition();
  }

  void resetPosition() {
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  void resetUsers() {
    if(dataBase.loadData(_listName) != null){
      _cards = dataBase.loadData(_listName).reversed.toList();
    } else {
      _cards = [
        FlashModel(back: "Test 1", front: "Test 2"),
        FlashModel(back: "Test 3", front: "Test 4")
      ];
    }

    notifyListeners();
  }
}