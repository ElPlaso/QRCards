class BusinessCard {
  String id;
  String name;
  String business;
  String phnum;
  String email;
  String address;
  String website;

  BusinessCard({
    required this.id,
    required this.name,
    this.business = "",
    this.phnum = "",
    this.email = "",
    this.address = "",
    this.website = "",
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
