import 'package:flutter/material.dart';

class CardCreator with ChangeNotifier {
  String _name = '';
  String get name => _name;
  void setName(String name) {
    _name = name;
  }

  String _position = '';
  String get postion => _position;
  void setPostion(String temp) {
    _position = temp;
  }

  String _email = '';
  String get email => _email;
  void setEmail(String temp) {
    _email = temp;
  }

  String _cellphone = '';
  String get cellphone => _cellphone;
  void setCellphone(String temp) {
    _cellphone = temp;
  }

  String _website = '';
  String get website => _website;
  void setWebsite(String temp) {
    _website = temp;
  }

  String _company = '';
  String get company => _company;
  void setCompany(String temp) {
    _company = temp;
  }

  String _companyAddress = '';
  String get companyAddress => _companyAddress;
  void setCompanyAddress(String temp) {
    _companyAddress = temp;
  }

  String _companyPhone = '';
  String get companyPhone => _companyPhone;
  void setCompanyPhone(String temp) {
    _companyPhone = temp;
  }
}
