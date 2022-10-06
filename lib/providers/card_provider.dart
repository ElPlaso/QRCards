import 'package:flutter/material.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/services/secure_storage.dart';

class Cards with ChangeNotifier {
  final SecureStorage storage = SecureStorage();
  List<BusinessCard> _personalcards = [];
  List<BusinessCard> _collectedcards = [];
  List<BusinessCard> get personalcards => _personalcards;
  List<BusinessCard> get collectedcards => _collectedcards;

  /// adds only new cards to the provided list
  ///
  /// * Example usage
  ///  context.read<Cards>()
  ///  .add(BusinessCard.fromJson(
  ///            jsonDecode(element.get('card'))),
  ///            context.read<Cards>().personalcards);
  ///
  /// * this adds a decoded card from a JSON query
  /// * to the personalcards array
  /// /
  void add(BusinessCard b, List<BusinessCard> list) {
    if (list.contains(b)) {
      return;
    }
    list.add(b);
    storage.writeCard(b);
    notifyListeners();
  }

  void delete(BusinessCard b, List<BusinessCard> list) {
    list.remove(b);
    storage.deleteCard(b.id);
    notifyListeners();
  }

  void deleteAll(List<BusinessCard> del, List<BusinessCard> list) {
    del.forEach((element) {
      storage.deleteCard(element.id);
      list.remove(element);
    });
    notifyListeners();
  }

  void clear() {
    _collectedcards.clear();
    _personalcards.clear();
    storage.clear();
    notifyListeners();
  }

  void loadFromStorage() async {
    _personalcards = await storage.readCards();
    // TODO load  _collectedcards = await storage.readCards();
    notifyListeners();
  }

  //read list with context.watch<Cards>().cards
  //call other methods with context.read<Cards>().method()
  //eg context.read<Cards>().add(card)
}
