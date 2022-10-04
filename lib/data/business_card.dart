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

  BusinessCard.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        business = json["business"],
        phnum = json["phnum"],
        email = json["email"],
        address = json["address"],
        website = json["website"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "business": business,
        "phnum": phnum,
        "email": email,
        "address": address,
        "website": website,
      };
}
