import 'dart:collection';

class BusinessCard {
  String id;
  String cellphone;
  String company;
  Map companyaddress;
  String companyphone;
  String email;
  String name;
  String position;
  String website;

  BusinessCard({
    required this.id,
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
        cellphone = json["cellphone"],
        company = json["company"],
        companyaddress = json["companyaddress"],
        companyphone = json["companyphone"],
        email = json["email"],
        name = json["name"],
        position = json["position"],
        website = json["website"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "cellphone": cellphone,
        "company": company,
        "companyaddress": companyaddress,
        "companyphone": companyphone,
        "email": email,
        "name": name,
        "position": position,
        "website": website,
      };
}
