import 'package:flutter/material.dart';

import './routes/new_contact_route.dart';

import './models/contact_book_singleton_model.dart';
import './models/contact_model.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Vanilla State Management',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
      routes: {
        '/new-contact': (context) => const NewContactRoute(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vanilla State Management"),
      ),
      body: ValueListenableBuilder(
        valueListenable: ContactBook(), // listening for changes in contactbook
        builder: (contact, value, child) {
          final contacts = value as List<Contact>;
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return Dismissible(
                onDismissed: (direction) {
                  ContactBook().removeContact(contact: contact); // nofity
                },
                key: ValueKey(contact.id),
                child: Material(
                  color: Colors.white,
                  elevation: 7.5,
                  child: ListTile(
                    title: Text(contact.name),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/new-contact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
