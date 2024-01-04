import 'package:flutter/material.dart';
import '../../model/message_model.dart';

class MessageLeftWidget extends StatelessWidget {
  final Message message;

  MessageLeftWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            message.textMessage,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
