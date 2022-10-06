import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:swen325_assignment_3/data/business_card.dart';
import 'package:swen325_assignment_3/providers/user_provider.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  // Write a single card into secure storage.
  void writeCard(BusinessCard card, bool personal, String uid) async {
    String key = uid + (personal ? "-personal-" : "-collected-") + card.id;
    await storage.write(
        key: key, value: jsonEncode(card), aOptions: _getAndroidOptions());
  }

  // Write a list of cards into secure storage.
  void writeCards(List<BusinessCard> cards, bool personal, String uid) {
    cards.forEach((element) {
      String key = uid + (personal ? "-personal-" : "-collected-") + element.id;
      storage.write(
          key: key, value: jsonEncode(element), aOptions: _getAndroidOptions());
    });
  }

  // Read a single card of a given id.
  Future<BusinessCard> readCard(String id, bool personal, String uid) async {
    String key = uid + (personal ? "-personal-" : "-collected-") + id;
    var data = await storage.read(key: key, aOptions: _getAndroidOptions());
    return BusinessCard.fromJson(jsonDecode(data!));
  }

  // Get list of all cards.
  Future<List<BusinessCard>> readCards(bool personal, String uid) async {
    var data = await storage.readAll(aOptions: _getAndroidOptions());
    String start = uid + (personal ? "-personal-" : "-collected-");
    List<BusinessCard> result = data.entries
        .map((card) => BusinessCard.fromJson(jsonDecode(card.value)))
        .where((element) => element.id.startsWith(start, 0))
        .toList();
    return result;
  }

  // Delete a single card of a given id.
  void deleteCard(String id, bool personal, String uid) async {
    String key = uid + (personal ? "-personal-" : "-collected-") + id;
    await storage.delete(key: key, aOptions: _getAndroidOptions());
  }

  // Delete all cards.
  void clear(bool personal, String uid) async {
    List<BusinessCard> cards = await readCards(personal, uid);
    cards.forEach((element) {
      String key = uid + (personal ? "-personal-" : "-collected-") + element.id;
      storage.delete(key: key, aOptions: _getAndroidOptions());
    });
  }
}
