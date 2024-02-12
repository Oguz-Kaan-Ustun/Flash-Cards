import 'package:flash_cards/screens/new_folder_screen.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey[50]),
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
                        child: NewFolderScreen(parentContext: context),
                      ),
                    ),
                  );
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
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

// SizedBox(height: 15),
// ElevatedButton(
//   style: ButtonStyle(
//     backgroundColor: MaterialStateProperty.all(Colors.blueGrey[50]),
//     iconColor: MaterialStateProperty.all(Colors.black),
//   ),
//     onPressed: (){
//       Navigator.pushNamed(context, FlashCardLearningScreen.id);
//     },
//     child: Container(
//       height: 60,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(Icons.filter_none),
//           SizedBox(width: 15),
//           Text(
//               'Add Flash Card',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     ),
// ),