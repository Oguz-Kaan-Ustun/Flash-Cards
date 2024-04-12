import 'package:flash_cards/data/database.dart';
import 'package:flash_cards/models/folder_model.dart';
import 'package:flash_cards/widgets/folder_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    CardsDataBase().addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<CardsDataBase>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
            children: provider.myBox.keys.toList().map((e) =>
                FolderWidget(folderModel: FolderModel(name: e))).toList()
        ),
      ),
    );
  }
}
