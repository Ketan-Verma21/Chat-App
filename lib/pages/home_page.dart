import 'package:firebasexchatapp/services/auth/auth_service.dart';
import 'package:firebasexchatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

import '../components/custom_drawer.dart';
import '../components/user_tile.dart';
import 'chat_page.dart';
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
  final ChatServices _chatServices =  ChatServices();
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,


      ),
      drawer: const CustomDrawer(),
      body: _buildUserList(),
    );
  }
  Widget _buildUserList() {
    return StreamBuilder(stream: _chatServices.getUsersStream(), builder: (context,snapshot){
      if(snapshot.hasError){
        return const Text("Error");
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Text("Waiting");
      }
      return ListView(
        children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData,context)).toList(),
      );
    });
  }
  Widget _buildUserListItem(Map<String,dynamic> userData,BuildContext context) {
      if(userData['email']!=_authService.getCurrentUser()!.email){
        return UserTile(
          text: userData['email'],
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(
              receiverEmail: userData['email'], receiverId: userData['uid'],
            )));
          },
        );
      }else{
        return Container();
      }
  }
}
