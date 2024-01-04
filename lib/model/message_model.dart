class Message {
  final String textMessage;
  final String source;
  final String dest;

  Message(
      {required this.textMessage, required this.source, required this.dest});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        textMessage: json['textMessage'],
        source: json['source'],
        dest: json['dest']);
  }

  Map toJson() => {'textMessage': textMessage, 'source': source, 'dest': dest};

  @override
  String toString() {
    // TODO: implement toString
    return 'Message: $textMessage';
  }
}
