import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:swen325_assignment_3/data/business_card.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  // Write a single card into secure storage.
  void writeCard(BusinessCard card) async {
    await storage.write(
        key: card.id, value: jsonEncode(card), aOptions: _getAndroidOptions());
  }

  // Write a list of cards into secure storage.
  void writeCards(List<BusinessCard> cards) {
    cards.forEach((element) {
      storage.write(
          key: element.id,
          value: jsonEncode(element),
          aOptions: _getAndroidOptions());
    });
  }

  // Read a single card of a given id.
  Future<BusinessCard> readCard(String id) async {
    var data = await storage.read(key: id, aOptions: _getAndroidOptions());
    return BusinessCard.fromJson(jsonDecode(data!));
  }

  // Get list of all cards.
  Future<List<BusinessCard>> readCards() async {
    var data = await storage.readAll(aOptions: _getAndroidOptions());
    List<BusinessCard> result = data.entries
        .map((card) => BusinessCard.fromJson(jsonDecode(card.value)))
        .toList();
    return result;
  }

  // Delete a single card of a given id.
  void deleteCard(String id) async {
    await storage.delete(key: id, aOptions: _getAndroidOptions());
  }

  // Delete all cards.
  void clear() async {
    await storage.deleteAll(aOptions: _getAndroidOptions());
  }
}
