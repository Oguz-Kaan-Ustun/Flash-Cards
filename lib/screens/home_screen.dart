// import 'package:flash_cards/providers/folder_provider.dart';
import 'package:flash_cards/models/folder_model.dart';
import 'package:flash_cards/utilities/constants.dart';
import 'package:flash_cards/widgets/folder_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flash_cards/data/database.dart';
import 'package:hive/hive.dart';
// import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    // final provider = Provider.of<FolderProvider>(context, listen: true);
    // final folders = provider.folders;
    // print(folders);
    // CardsDataBase dataBase = CardsDataBase();
    final myBox = Hive.box(AppConstants.flashCardBoxName);
    List listOfKeys = myBox.keys.toList();
    print(listOfKeys);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
            children: listOfKeys.map((e) => FolderWidget(folderModel: FolderModel(name: e))).toList()
        ),
      ),
    );
  }
}
