import 'package:flutter/material.dart';
import 'package:kafkamessaging/view/pages/messaging_view.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Controllers for the text forms
  TextEditingController sourceFormController = TextEditingController();
  TextEditingController destFormController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  redirectToMessaging() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Messaging(
              source: sourceFormController.text,
              dest: destFormController.text,
            ),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First Text Form
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a source';
                  }
                  return null; // Return null for valid input
                },
                controller: sourceFormController,
                decoration: const InputDecoration(
                  labelText: 'Source number',
                ),
              ),
              const SizedBox(height: 16.0),

              // Second Text Form
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a destination';
                  }
                  return null; // Return null for valid input
                },
                controller: destFormController,
                decoration: const InputDecoration(
                  labelText: 'Destination number',
                ),
              ),
              const SizedBox(height: 32.0),

              // Button to reach messaging view
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  TextButton(
                      onPressed: () => redirectToMessaging(),
                      child: const Text('Chat'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
