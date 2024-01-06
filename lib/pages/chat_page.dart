import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasexchatapp/components/chat_bubble.dart';
import 'package:firebasexchatapp/components/custom_text_feild.dart';
import 'package:firebasexchatapp/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;
  ChatPage({Key? key, required this.receiverEmail, required this.receiverId})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();
  FocusNode myFocusNode= FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode.addListener(() {
      if(myFocusNode.hasFocus){
        Future.delayed(const Duration(milliseconds: 500),()=>scrollDown());
      }
    });
    Future.delayed(const Duration(milliseconds:500),()=>scrollDown());
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    myFocusNode.dispose();
  }
  final ScrollController _scrollController=ScrollController();
  void scrollDown() {
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn);
  }
  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _chatServices.sendMessage(widget.receiverId, _controller.text);
      _controller.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(child: buildMessageList()),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget buildMessageList() {
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatServices.getMessages(widget.receiverId, senderId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading..");
          }
          return ListView(
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser =data['senderId']==_authService.getCurrentUser()!.uid;
    var alignment = isCurrentUser ?Alignment.centerRight:Alignment.centerLeft;
    return Container(
      alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end:CrossAxisAlignment.start,
          children: [
            ChatBubble(message: data['message'], isCurrentUser: isCurrentUser)
          ],
        ));
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: [
          Expanded(
              child: CustomTextField(
            text: "Type a Message",
            pass: false,
            controller: _controller,
                focusNode: myFocusNode,
          )),
          Container(
            margin: EdgeInsets.only(right: 25),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle
            ),
              child: IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward,color: Colors.white,)))
        ],
      ),
    );
  }
}
