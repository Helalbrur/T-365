import 'package:flutter/material.dart';
class MemberHome extends StatefulWidget {
  const MemberHome({ Key? key }) : super(key: key);

  @override
  _MemberHomeState createState() => _MemberHomeState();
}

class _MemberHomeState extends State<MemberHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('Member Home Page'),
    );
  }
}