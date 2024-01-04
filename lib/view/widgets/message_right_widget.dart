import 'package:flutter/material.dart';
import '../../model/message_model.dart';

class MessageRightWidget extends StatelessWidget {
  final Message message;

  MessageRightWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
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
