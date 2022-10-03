class BusinessCard {
  String uid;
  String name;
  String business;
  String phnum;
  String email;
  String address;
  String website;

  BusinessCard({
    required this.uid,
    required this.name,
    this.business = "",
    this.phnum = "",
    this.email = "",
    this.address = "",
    this.website = "",
  });
}
