import 'package:flutter/material.dart';
import 'package:mydoctor/healthservice.dart';
import 'package:mydoctor/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MemberPage.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);
  
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Color(0x44FAFAFA),
        elevation: 0,
        backwardsCompatibility: true,
       
        leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () async {
                  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                  var obtianId=sharedPreferences.getString('id') ?? '';
                  if(obtianId.isNotEmpty)
                  {
                    Navigator.of(context).pop();
                  }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>homepage(),
                      ));
                  }
                },
                padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
              ), 
        
        actions: [
                IconButton(
                    visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    icon: Icon(
                      Icons.notifications_active,
                      color: Colors.red,
                    ),
                    iconSize: 40,
                    
                    onPressed: null,
                  ),
                IconButton(
                    visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    icon: Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    iconSize: 40,
                    onPressed: () async {
                      SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
                      if(sharedPreferences.getString('id')!.isNotEmpty)
                      {
                        sharedPreferences.remove('id');
                        sharedPreferences.remove('name');
                        sharedPreferences.remove('role');
                         Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=>MemberPage(),
                        ));
                      }
                    },
                  ),
                
               
          
        ],
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical:5, horizontal: 50),
          child: Column(
            
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                     Text('T-365 Group                       ',textAlign: TextAlign.left,style: TextStyle(fontSize: 25),),
                    Text('প্রয়োজনে আমরা আছি আপনার পাশে',textAlign: TextAlign.left,style: TextStyle(fontSize: 18,),),
                    
                  ],
                ),
              ),
             
              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/project.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/membership.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),

                   
              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/DoctorAppoinmentService.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => HealthService(),
                                          ));
                                
                              },
                              child: Image(image: AssetImage('assets/HealthService.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),

              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/EducationalService.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/BusinessService.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),


              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/PregnancyCareService.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/bloodDonationService.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),


              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/MedicinePriceCheckList.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/HealthAskingAndAnswer.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),

              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/EducationalAskingAndAnswer.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/VisualLearningMethodChild.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),

              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/VisualLearningMethodAdult.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/RecentJobSolution.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),

              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/JobAdvertisement.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/StoryOfBrilliantStudent.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),

              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/SuccessfulAliveGreatMan.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/ShortcutTechnicForStudy.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),

              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/InvestmentAndBenefits.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/AboutT365.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),
              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/EducationalService.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/GoalsandTarget.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),

              Stack(
                children: <Widget>[
                  
                  SizedBox(height: 30),
                  Row(
                    
                    children: [
                     
                      
                      Container(
                         // ignore: deprecated_member_use
                         child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/ContactWithUs.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                        
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: FlatButton(
                              onPressed: () {
                                print('I got clicked');
                              },
                              child: Image(image: AssetImage('assets/EducationalService.png'),width: MediaQuery.of(context).size.width,),
                              
                            ),
                        padding: EdgeInsets.fromLTRB(5, 5, 1, 5),
                        width:MediaQuery.of(context).size.width/2-50 ,
                      ),
                    ],
                    
                  ),
                 
                  
                ],
              ),


             

            ],
          ),
      ),
    );
  }
}

mixin ZERO {
}
