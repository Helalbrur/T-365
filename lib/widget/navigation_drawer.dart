import '../pages/AdminPage.dart';
import 'package:flutter/material.dart';
class NavigationDrawerWidget extends StatelessWidget{
  final padding =EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: Material(
        color: Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          padding: padding,
          children: <Widget>[
             const SizedBox(height: 48),
             buildMenuItem(
               text: 'Admin',
               icon: Icons.people,
               context: context
             ),
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
    required String text,
    required IconData icon,
    required BuildContext context
}){
  final color=Colors.white;
  return ListTile(
    leading: Icon(icon,color: color),
    title: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    hoverColor: Colors.white70,
    onTap: ()=>selectedItem(context,0),
    onLongPress: (){

    },
  );

}
  void selectedItem(BuildContext context,int index){
      switch (index) {
        case 0:
          Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=>AdminPage(),
                                ));
          
          break;
        default:
      }
  }
