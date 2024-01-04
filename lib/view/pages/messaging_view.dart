import 'package:flutter/material.dart';
import 'package:kafkamessaging/view_model/message_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:html';

import '../../model/message_model.dart';
import '../widgets/message_left_widget.dart';
import '../widgets/message_right_widget.dart';

class Messaging extends StatefulWidget {
  final String? source;
  final String? dest;

  Messaging({this.source, this.dest});

  @override
  State<Messaging> createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  final TextEditingController _textController = TextEditingController();
  // List<Message> _messages = [];
  // late List<Message> mess;
  final MessageViewModel _messageViewModel = MessageViewModel();

  Future<void> _postMessage(Message newMessage) async {
    try {
      await _messageViewModel.postMessage(newMessage);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error posting message: $e'),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<MessageViewModel>(context).getMessage();
    List<Message> mess = Provider.of<MessageViewModel>(context).messages;

    print(mess);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kafka messaging'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: mess.length,
                itemBuilder: (context, index) {
                  // if (widget.source != null &&
                  //     widget.dest != null &&
                  //     widget.source == mess[index].source &&
                  //     widget.dest == mess[index].dest) {
                  // if (widget.source == mess[index].source) {
                  //   return MessageLeftWidget(mess[index]);
                  // } else {
                  //   return MessageRightWidget(mess[index]);
                  // }

                  if (widget.source == mess[index].source) {
                    return MessageLeftWidget(mess[index]);
                  } else {
                    return MessageRightWidget(mess[index]);
                  }
                  // }
                },
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      color: Colors.grey[300],
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                  hintText: ('Type your message...'),
                  hintStyle: TextStyle(color: Colors.black)),
            ),
          ),
          IconButton(
            icon: const Icon(color: Colors.black, Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    if (widget.source != null && widget.dest != null) {
      Message message = Message(
        textMessage: _textController.text,
        source: widget.source!,
        dest: widget.dest!,
      );

      if (message.textMessage.isNotEmpty) {
        await _postMessage(message);
        setState(() {
          _textController.clear();
        });
      }
    } else {
      // Handle the case where source or dest is null
      print('Source or dest is null');
    }
  }
}
