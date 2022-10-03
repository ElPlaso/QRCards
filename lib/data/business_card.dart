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
}
