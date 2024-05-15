import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final Timestamp timeStamp;

  final String message;

  Message(
      {required this.senderID,
      required this.senderEmail,
      required this.receiverID,
      required this.timeStamp,
      required this.message});

  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'timestamp': timeStamp,
      'message': message,
    };
  }
}
