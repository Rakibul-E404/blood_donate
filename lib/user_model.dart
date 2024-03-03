// class UserModel{
//   late String _uid;
//   late String _name;
//   late String _mobileNumber;
//   late String _bloodGroup;
//   late String _cityLocation;
//   late String _dob;
//
//   UserModel(this._uid, this._name);
//
//   Map<String, dynamic> toJson(){
//     return {
//       "uid" : _uid,
//       "name" : _name,
//     };
//   }
//   String get dob => _dob;
//
//   set dob(String value) {
//     _dob = value;
//   }
//
//   String get cityLocation => _cityLocation;
//
//   set cityLocation(String value) {
//     _cityLocation = value;
//   }
//
//   String get bloodGroup => _bloodGroup;
//
//   set bloodGroup(String value) {
//     _bloodGroup = value;
//   }
//
//   String get mobileNumber => _mobileNumber;
//
//   set mobileNumber(String value) {
//     _mobileNumber = value;
//   }
//
//   String get name => _name;
//
//   set name(String value) {
//     _name = value;
//   }
//
//   String get uid => _uid;
//
//   set uid(String value) {
//     _uid = value;
//   }
//
//
//
// }


class UserModel {
  late String _uid;
  late String _name;
  late String _email;
  late String _mobileNumber;
  late String _bloodGroup;
  late String _division;
  late String _district;
  late String _upazila;
  late String _dob;
  late String _cityLocation;
  late bool _willingToDonate;
  late int _accountOpeningDate;

  UserModel(this._uid, this._name, this._email, this._mobileNumber, this._bloodGroup, this._division, this._district, this._upazila, this._dob,this._cityLocation,this._willingToDonate, this._accountOpeningDate);

  UserModel.fromJson(Map<String, dynamic> json){
    _name = json['name'];


  }
  Map<String, dynamic> toJson() {
    return {
      "uid": _uid,
      "name": _name,
      "email": _email,
      "mobileNumber": _mobileNumber,
      "bloodGroup": _bloodGroup,
      "division": _division,
      "district": _district,
      "upazila": _upazila,
      "dob": _dob,
      "cityLocation": _cityLocation,
      "willingToDonate": _willingToDonate,
      "accountOpeningDate":_accountOpeningDate,
    };
  }

  bool get willingToDonate => _willingToDonate;

  set willingToDonate(bool value) {
    _willingToDonate = value;
  }

  String get dob => _dob;

  set dob(String value) {
    _dob = value;
  }

  String get cityLocation => _cityLocation;

  set cityLocation(String value) {
    _cityLocation = value;
  }

  String get bloodGroup => _bloodGroup;

  set bloodGroup(String value) {
    _bloodGroup = value;
  }

  String get mobileNumber => _mobileNumber;

  set mobileNumber(String value) {
    _mobileNumber = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }

  String get division => _division;

  set division(String value) {
    _division = value;
  }

  String get district => _district;

  set district(String value) {
    _district = value;
  }

  String get upazila => _upazila;

  set upazila(String value) {
    _upazila = value;
  }

  int get accountOpeningDate => _accountOpeningDate;

  set accountOpeningDate(int value) {
    _accountOpeningDate = value;
  }
}
