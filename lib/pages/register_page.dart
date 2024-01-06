import 'package:firebasexchatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../components/custom_text_feild.dart';
class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confpasswordController=TextEditingController();
  final void Function()? onTap;

  RegisterPage({Key? key,required this.onTap}) : super(key: key);
  void register(BuildContext context){
      final _auth =AuthService();
      if(_passwordController.text==_confpasswordController.text){
        try{
          _auth.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);
        }catch(e){
          showDialog(context: context, builder: (context)=>AlertDialog(
            title: Text(e.toString()),
          ));
        }
      }else{
        showDialog(context: context, builder: (context)=>const AlertDialog(
          title:  Text("Passwords don't match !!"),
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
              Text("Lets create an account for you",style: TextStyle(
                  color: color.primary,
                  fontSize: 16
              ),),
              SizedBox(height: 25,),
              CustomTextField(text: "Email", pass: false, controller: _emailController,),
              SizedBox(height: 10,),
              CustomTextField(text: "Password", pass: true, controller: _passwordController,),
              SizedBox(height: 10,),
              CustomTextField(text: "Confirm Password", pass: true, controller: _confpasswordController,),
              SizedBox(height: 25,),
              CustomButton(text: "Register", onTap: ()=>register(context)),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                    style: TextStyle(
                        color: color.primary
                    ),),
                  GestureDetector(
                    onTap: onTap,
                    child: Text("Login Now",style: TextStyle(
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
