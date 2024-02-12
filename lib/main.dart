import 'package:flash_cards/screens/home_screen.dart';
import 'package:flash_cards/screens/profile_screen.dart';
import 'package:flash_cards/providers/card_provider.dart';
// import 'package:flash_cards/providers/folder_provider.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/tabs/build_navigation_bar.dart';
import 'package:flash_cards/screens/flash_card_learning_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  print(box.keys.toList());


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
        // ChangeNotifierProvider(
        //   create: (context) => FolderProvider(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          FlashCardLearningScreen.id: (context) => FlashCardLearningScreen(),
        },
        home: BuildNavBar(),
      ),
    );
  }
}