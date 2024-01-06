import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
import '../pages/setting_page.dart';
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  void logout() {
    final _authService =AuthService();
    _authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    final color=Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: color.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(child: Center(
                child: Icon(Icons.message,color: color.primary,size: 40,),
              )),
               Padding(
                padding:  EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
               Padding(
                padding:  EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Icon(Icons.settings),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
                  },
                ),
              ),
            ],
          ),
           Padding(
            padding:  EdgeInsets.only(left: 25.0,bottom: 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap:logout,
            ),
          )
        ],
      ),
    );
  }
}
