import 'package:flutter/material.dart';
import 'package:kafkamessaging/view_model/message_view_model.dart';
import 'package:provider/provider.dart';

import './view/pages/messaging_view.dart';
import './view/pages/register_view.dart';
import './view/pages/splash_view.dart';

void main() {
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MessageViewModel>(
          create: (_) => MessageViewModel())
    ],
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const Splash(),
          '/register': (context) => Register(),
          '/messaging': (context) => Messaging(),
        }),
  ));
}
