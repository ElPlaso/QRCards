import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/services/secure_storage.dart';

class Cards with ChangeNotifier {
  final SecureStorage storage = SecureStorage();
  List<BusinessCard> _cards = [];

  List<BusinessCard> get cards => _cards;

  void add(BusinessCard b) {
    _cards.add(b);
    storage.writeCard(b);
    notifyListeners();
  }

  void delete(BusinessCard b) {
    _cards.remove(b);
    storage.deleteCard(b.id);
    notifyListeners();
  }

  void deleteAll(List<BusinessCard> del) {
    del.forEach((element) {
      storage.deleteCard(element.id);
      _cards.remove(element);
    });
    notifyListeners();
  }

  void clear() {
    _cards.clear();
    storage.clear();
    notifyListeners();
  }

  void loadFromStorage() async {
    _cards = await storage.readCards();
    notifyListeners();
  }

  //read list with context.watch<Cards>().cards
  //call other methods with context.read<Cards>().method()
  //eg context.read<Cards>().add(card)
}
