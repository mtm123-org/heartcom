import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heartcom/services/chat/chat_services.dart';
import 'package:heartcom/services/auth/auth_service.dart';

class chatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  chatPage({super.key, required this.receiverEmail, required this.receiverID});

  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth services
  final ChatService _chatService = ChatService();
  final authService _authService = authService();

  //method for send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);

      //clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail)),
      body: Column(
        children: [
          // Display all messages
          Expanded(child: _buildMessageList()),

          // Display user input
          _buildMessageInput(),
        ],
      ),
    );
  }

// Build message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No messages yet"));
        }

        // Debugging snapshot data
        print("Snapshot Data: ${snapshot.data!.docs}");

        return ListView(
          children: snapshot.data!.docs
              .map(
                (doc) => _buildMessageItem(doc),
              )
              .toList(),
        );
      },
    );
  }

// Build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Text(data["message"]);
  }

  // build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: "Enter Message",
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                sendMessage();
              },
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}
