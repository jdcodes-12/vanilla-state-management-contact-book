import 'package:flutter/material.dart';
import 'contact_model.dart';

/*
 * Because ValueNotifier<T> is a class that has constructor
 * ValueNotifier(this._value), we must pass a value to super().
 * The value passed to super is what is initially tracked (e.g. setting
 * the intial state for the class). 
 * 
 * Because Contactbook inherits ValueNotifier, the parent constructor must
 * be called w/ super() & all required parameters.
 */
class ContactBook extends ValueNotifier<List<Contact>> {
  // Allow us to track changes
  ContactBook._sharedInstance() : super([]);

  // create private variable to hold singleton
  static final ContactBook _shared = ContactBook._sharedInstance();

  // public factory constructor - only return a private singleton
  factory ContactBook() => _shared;

  // getters (public)
  int get length => value.length;

  void addContact({required Contact contact}) {
    final contacts = value; // grab value
    contacts.add(contact); // use List.add() to add to List
    notifyListeners(); // Trigger listeners in ValueNotifier
  }

  void removeContact({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? getContactAtIndex({required int index}) {
    return value.length > index ? value[index] : null;
  }
}
