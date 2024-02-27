class UserModel{
  late String _uid;
  late String _name;
  late String _mobileNumber;
  late String _bloodGroup;
  late String _cityLocation;
  late String _dob;

  UserModel(this._uid, this._name);

  Map<String, dynamic> toJson(){
    return {
      "uid" : _uid,
      "name" : _name,
    };
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

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }



}