import 'package:flutter/material.dart';
import '../models/contact_book_singleton_model.dart';
import '../models/contact_model.dart';

class NewContactRoute extends StatefulWidget {
  const NewContactRoute({super.key});

  @override
  State<NewContactRoute> createState() => _NewContactRouteState();
}

class _NewContactRouteState extends State<NewContactRoute> {
  // Text Controllers needed to control text input
  late final TextEditingController _controller;

  // Set initial state for the NewContactRoute
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  // Discard state of our controller.
  // Let's us reset the value for each render
  // of our route.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new contact'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter a new contact name here...',
            ),
          ),
          TextButton(
            onPressed: () {
              final contact = Contact(name: _controller.text); // create contact
              ContactBook().addContact(contact: contact); // add contact
              Navigator.of(context).pop(); // go back to previous route
            },
            child: const Text('Add Contact'),
          ),
        ],
      ),
    );
  }
}
