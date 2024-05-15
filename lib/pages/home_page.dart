import 'package:flutter/material.dart';
import 'package:heartcom/pages/chat_page.dart';
import 'package:heartcom/components/menu_drawer.dart';
import 'package:heartcom/components/user_tile.dart';
import 'package:heartcom/services/auth/auth_service.dart';
import 'package:heartcom/services/chat/chat_services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat and auth services
  final ChatService _chatService = ChatService();
  final authService _authservice = authService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: const myDrawer(),
      body: _biuldUserList(),
    );
  }

  //build a list of users except for the currently logged in user
  Widget _biuldUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.map((userData) {
              return _buildUserListItem(userData, context);
            }).toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authservice.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => chatPage(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                ),
              ));
        },
      );
    } else {
      return Container();
    }
  }
}
