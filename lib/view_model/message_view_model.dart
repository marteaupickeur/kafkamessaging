import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kafkamessaging/model/message_model.dart';

class MessageViewModel with ChangeNotifier {
  final String apiUrl = 'http://localhost:8081/mobile';
  List<Message> messages = [];
  final Dio _dio = Dio(); // Create Dio instance
  Message m = Message(textMessage: "", source: "", dest: "");

  Future<void> getMessage() async {
    try {
      final response = await _dio.get("$apiUrl/getMessage");
      if (response.statusCode == 200) {
        final Message message = Message.fromJson(response.data);

        if (m.textMessage != message.textMessage) {
          m = message;
          messages.add(m);
        }
        notifyListeners();
      } else {
        throw Exception('Failed to load message');
      }
    } catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }

  Future<void> postMessage(Message newMessage) async {
    try {
      final response =
          await _dio.post("$apiUrl/sendMessage", data: newMessage.toJson());
      if (response.statusCode != 200) {
        print(response.statusCode);
        throw Exception('Failed to post message');
      }
    } catch (e) {
      print(e);
      throw Exception('Error: $e');
    }
  }
}
