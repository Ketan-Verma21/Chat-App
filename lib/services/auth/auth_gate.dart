import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasexchatapp/services/auth/authentication.dart';
import 'package:flutter/material.dart';

import '../../pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return HomePage();
          }
          return Authentication();
        },
      ),
    );
  }
}
