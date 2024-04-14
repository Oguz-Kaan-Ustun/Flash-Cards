import 'package:flash_cards/data/database.dart';
import 'package:flash_cards/models/flash_card_model.dart';
import 'package:flash_cards/screens/folder_main_screen.dart';
import 'package:flash_cards/screens/home_screen.dart';
import 'package:flash_cards/screens/profile_screen.dart';
import 'package:flash_cards/providers/card_provider.dart';
import 'package:flash_cards/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/tabs/build_navigation_bar.dart';
import 'package:flash_cards/screens/flash_card_learning_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {

  await Hive.initFlutter();

  Hive.registerAdapter(FlashModelAdapter());

  var box = await Hive.openBox(AppConstants.flashCardBoxName);

  print(box.keys.toList());
  print(box.get('Math'));

  runApp(FlashCards());
}

class FlashCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CardProvider(),
        ),
        ChangeNotifierProvider(
           create: (context) => CardsDataBase(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          FlashCardLearningScreen.id: (context) => FlashCardLearningScreen(),
          FolderMainScreen.id: (context) => FolderMainScreen(),
        },
        home: BuildNavBar(),
      ),
    );
  }
}