import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:mydoctor/pages/LandingPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_service.dart';
import '../model/member_login_model.dart';

import '../ProgressHUD.dart';
import 'member_register.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  String name='';
  String role='';
  String id='';
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late MemberLoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginRequestModel = new MemberLoginRequestModel(email: '', password: '');
   // name = UserSimplePreferences.getName() ?? '' ;
   // role = UserSimplePreferences.getRole() ?? '' ;
    //id = UserSimplePreferences.getId() ?? '';
    validateUserAthentication();
  }

  Future validateUserAthentication() async {
    final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    var obtainId =sharedPreferences.getString("id");
    setState((){
      id=obtainId ?? '';
    });
    print(obtainId);
    if(id.isNotEmpty)
    {
       Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LandingPage(),
        ));
    }

  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        backgroundColor: Color(0x44FAFAFA),
        elevation: 0,
        backwardsCompatibility: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () => Navigator.of(context).pop(),
        //   padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
        // ), 
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x44dddddd),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => loginRequestModel.email = input!,
                          validator: (input) => !input!.contains('@')
                              ? "Email Id should be valid"
                              : null,
                          decoration: new InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              loginRequestModel.password = input!,
                          validator: (input) => input!.length < 3
                              ? "Password should be more than 3 characters"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).accentColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        // ignore: deprecated_member_use
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) {
                              print(loginRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = new APIService();
                              apiService.login(loginRequestModel).then((value) async {
                                // ignore: unnecessary_null_comparison
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  print(value.id.toString());
                                  if (value.id.isNotEmpty) {
                                       final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
                                        sharedPreferences.setString('name', value.name);
                                        sharedPreferences.setString('id', value.id);
                                        sharedPreferences.setString('role', value.role);
                                        print(sharedPreferences.getString('id'));
                                         // ignore: deprecated_member_use
                                         scaffoldKey.currentState!.showSnackBar(SnackBar(
                                            content: Text(
                                              'Login Successfull\nWelcome '+value.name,
                                            ),
                                            duration: Duration(seconds: 2),
                                            
                                            
                                          ));
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (context) => LandingPage(),
                                          ));
                                  } else {
                                   // ignore: deprecated_member_use
                                   scaffoldKey.currentState!.showSnackBar(SnackBar(
                                    content: Text(
                                      'User or password Not match',
                                    ),
                                    duration: Duration(seconds: 2),
                                  ));
                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(height: 30),
                        Text('Not register yet ?'),
                        // ignore: deprecated_member_use
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => memberRegister(),
                            ));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
