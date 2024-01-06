import 'package:firebasexchatapp/pages/login_page.dart';
import 'package:firebasexchatapp/pages/register_page.dart';
import 'package:flutter/material.dart';
class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showLogin=true;
  void togglePages(){
    setState(() {
      showLogin=!showLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLogin){
      return LoginPage(onTap: togglePages,);
    }
    else{
      return RegisterPage(onTap:  togglePages,);
    }
  }
}
