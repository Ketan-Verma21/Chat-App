import 'package:firebasexchatapp/components/custom_button.dart';
import 'package:firebasexchatapp/components/custom_text_feild.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final void Function()? onTap;
  LoginPage({Key? key,required this.onTap}) : super(key: key);
  void login(BuildContext context) async{
    final authService =  AuthService();
      try{
        await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
      }catch(e){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text(e.toString()),
        ));
      }
  }
  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.message,size: 60,color:color.primary,),
              SizedBox(height: 50,),
              Text("Welcome Back, you've been missed",style: TextStyle(
                color: color.primary,
                fontSize: 16
              ),),
              SizedBox(height: 25,),
              CustomTextField(text: "Email", pass: false, controller: _emailController,),
              SizedBox(height: 10,),
              CustomTextField(text: "Password", pass: true, controller: _passwordController,),
              SizedBox(height: 25,),
              CustomButton(text: "Login", onTap: ()=>login(context)),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member? ",
                  style: TextStyle(
                    color: color.primary
                  ),),
                  GestureDetector(
                    onTap: onTap,
                    child: Text("Register Now",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color.primary
                    ),),
                  ),

                ],

              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
