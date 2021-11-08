import 'package:flutter/material.dart';
// import '../widget/navigation_drawer.dart';
class AdminPage extends StatefulWidget {
  const AdminPage({ Key? key }) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            title: Text(''),
            leadingWidth: 20,
            elevation: 0,
            backgroundColor: Color(0x44FAFAFA),
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            actions: [
                Image(image: AssetImage('assets/person.png')),
            ],
        ),
        // drawer: NavigationDrawerWidget(),
    );
  }
}