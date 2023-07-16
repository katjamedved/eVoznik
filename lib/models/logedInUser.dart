import 'dart:convert';

class LogedInUser{
  int _userId;
  String _name;
  String _lastname;
  String _docNmb;
  String _phoneNumber;
  String _address;


  LogedInUser(this._userId, this._name, this._lastname, this._docNmb,
      this._phoneNumber, this._address);

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get docNmb => _docNmb;

  set docNmb(String value) {
    _docNmb = value;
  }

  String get lastname => _lastname;

  set lastname(String value) {
    _lastname = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }
}