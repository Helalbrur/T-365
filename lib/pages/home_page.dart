import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mydoctor/healthservice.dart';
//import '../widget/navigation_drawer.dart';
import 'AdminPage.dart';
import 'Moderator.dart';
import 'MemberPage.dart';
import 'member_register.dart';
class homepage extends StatelessWidget {
  const homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text(''),
          centerTitle: true,
          backgroundColor: Color(0x44FAFAFA),
          elevation: 0,
          backwardsCompatibility: true,
        ),
       // drawer: NavigationDrawerWidget(),
        body: Center(
            child: Column(
              children: [
                   
                    Text(
                      'SIM',
                       style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                            fontSize: 20,
                          ),
                    ),
                     Text(
                      'আমরা আছি রোগীর পাশে',
                       style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      'T-365 Group',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.4,
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      
                      color: Color(0xff343143),
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      width: 250,
                      child: Column(
                          children: [
                            Text(
                                'Founder and CEO',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.5,
                                    fontSize: 20,
                                    
                                    
                                  ),
                              ),
                               Text(
                                'Dr. Md. Mahfuzzaman(DIP)',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.5,
                                    fontSize: 15,
                                  ),
                              ),
                          ],
                        ),
                    ),
                    const SizedBox(height: 35),
                    
                      Container(
                          width: 250,
                          alignment: Alignment.center,
                          child: Column(

                            children: [
                               
                                // ignore: deprecated_member_use
                                FlatButton(
                                     color: Colors.white,
                                     
                                     child: Text('Admin'),
                                     textColor: Colors.black,
                                     splashColor: Colors.red,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       side: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ), 
                                     ),
                                     
                                     highlightColor: Colors.red,
                                     
                                     minWidth: 250,
                                     onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context)=>AdminPage(),
                                      ));
                                    },
                                ),
                                // ignore: deprecated_member_use
                                FlatButton(
                                     color: Colors.white,
                                     
                                     child: Text('Moderator'),
                                     textColor: Colors.black,
                                     splashColor: Colors.red,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       side: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ), 
                                     ),
                                     
                                     highlightColor: Colors.red,
                                     
                                     minWidth: 250,
                                     onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context)=>Moderator(),
                                      ));
                                    },
                                ),
                                 // ignore: deprecated_member_use
                                 FlatButton(
                                     color: Colors.white,
                                     
                                     child: Text('Member'),
                                     textColor: Colors.black,
                                     splashColor: Colors.red,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       side: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ), 
                                     ),
                                     
                                     highlightColor: Colors.red,
                                     
                                     minWidth: 250,
                                     onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context)=>MemberPage(),
                                      ));
                                    },
                                ),

                              // ignore: deprecated_member_use
                                 FlatButton(
                                     color: Colors.white,
                                     
                                     child: Text('Supporter'),
                                     textColor: Colors.black,
                                     splashColor: Colors.red,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       side: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ), 
                                     ),
                                     
                                     highlightColor: Colors.red,
                                     
                                     minWidth: 250,
                                     onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context)=>HealthService(),
                                      ));
                                    },
                                ),
                                 SizedBox(height: 100),
                                // ignore: deprecated_member_use
                                 FlatButton(
                                     color: Colors.red,
                                     
                                     child: Text('Join us'),
                                     textColor: Colors.white,
                                     splashColor: Colors.red,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       side: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ), 
                                     ),
                                     
                                     highlightColor: Colors.red,
                                     
                                     minWidth: 250,
                                     onPressed: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context)=>memberRegister(),
                                      ));
                                    },
                                ),
                            ],
                          ),
                      ),
                ],
            ),
          ),
        );
  }
}

