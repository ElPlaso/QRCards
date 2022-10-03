import 'dart:collection';

class BusinessCard {
  String cellphone;
  String company;
  Map companyaddress;
  String companyphone;
  String email;
  String name;
  String position;
  String website;

  BusinessCard({
    this.cellphone = '',
    this.company = '',
    this.companyaddress = const {
      'city': '',
      'country': '',
      'streetname': '',
      'streetnumber': ''
    },
    this.companyphone = '',
    this.email = '',
    required this.name,
    this.position = '',
    this.website = '',
  });
}
