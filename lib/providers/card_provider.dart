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
  void add(BusinessCard b, bool personal, String uid) async {
    List<BusinessCard> list = personal ? _personalcards : _collectedcards;
    if (list.remove(b)) {
      await delete(b, personal, uid);
    }
    list.add(b);
    storage.writeCard(b, personal, uid);
    notifyListeners();
  }

  Future<void> delete(BusinessCard b, bool personal, String uid) async {
    List<BusinessCard> list = personal ? _personalcards : _collectedcards;
    list.remove(b);
    storage.deleteCard(b.id, personal, uid);
    notifyListeners();
  }

  void deleteAll(List<BusinessCard> del, bool personal, String uid) async {
    List<BusinessCard> list = personal ? _personalcards : _collectedcards;
    del.forEach((element) {
      storage.deleteCard(element.id, personal, uid);
      list.remove(element);
    });
    notifyListeners();
  }

  void clear(bool personal, String uid) async {
    List<BusinessCard> list = personal ? _personalcards : _collectedcards;
    list.clear();
    storage.clear(personal, uid);
    notifyListeners();
  }

  void loadFromStorage(bool personal, String uid) async {
    List<BusinessCard> list = personal ? _personalcards : _collectedcards;
    list = await storage.readCards(personal, uid);
    notifyListeners();
  }

  bool isEmpty(bool personal) {
    List<BusinessCard> list = personal ? _personalcards : _collectedcards;
    return list.isEmpty;
  }

  //read list with context.watch<Cards>().cards
  //call other methods with context.read<Cards>().method()
  //eg context.read<Cards>().add(card)
}
