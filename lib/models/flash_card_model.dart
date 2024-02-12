class FlashModel {
  String front;
  String back;

  FlashModel({
    required this.back,
    required this.front,
  });

  static List<FlashModel> flashModelList() {
    return[
      FlashModel(back: '1', front: '2'),
      FlashModel(back: '3', front: '4'),
      FlashModel(back: '5', front: '6'),
    ];
  }
}