import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';

class Cards with ChangeNotifier {
  List<BusinessCard> _cards = [];

  List<BusinessCard> get cards => _cards;

  void add(BusinessCard b) {
    _cards.add(b);
    notifyListeners();
  }

  void delete(BusinessCard b) {
    _cards.remove(b);
    notifyListeners();
  }

  void deleteAll(List<BusinessCard> del) {
    del.forEach((element) {
      _cards.remove(element);
    });
    notifyListeners();
  }

  void clear() {
    _cards.clear();
    notifyListeners();
  }

  //read list with context.watch<Cards>().cards
  //call other methods with context.read<Cards>().method()
  //eg context.read<Cards>().add(card)
}
