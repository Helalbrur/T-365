import 'package:flutter/material.dart';
class Moderator extends StatefulWidget {
  const Moderator({ Key? key }) : super(key: key);

  @override
  _ModeratorState createState() => _ModeratorState();
}

class _ModeratorState extends State<Moderator> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        
        appBar: AppBar(
          title: Text(''),
          elevation: 0,
          backgroundColor: Color(0x44FAFAFA),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          actions: [
              IconButton(
                onPressed: ()=>{},
                 icon: Icon(Icons.ac_unit),
                 color: Colors.black,
                )
          ],
        ),
        // drawer: NavigationDrawerWidget(),
    );
  }
}