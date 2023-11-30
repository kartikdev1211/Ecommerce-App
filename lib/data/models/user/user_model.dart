// ignore_for_file: no_leading_underscores_for_local_identifiers

class UserModel {
  String? sId;
  String? fullName;
  String? email;
  String? password;
  String? phoneNumber;
  String? city;
  String? state;
  String? address;
  int? profileProgress;
  String? id;
  String? updatedOn;
  String? createdOn;

  UserModel({
    this.sId,
    this.fullName,
    this.email,
    this.password,
    this.phoneNumber,
    this.city,
    this.state,
    this.address,
    this.profileProgress,
    this.id,
    this.updatedOn,
    this.createdOn,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      sId = json["_id"];
    }
    if (json["fullName"] is String) {
      fullName = json["fullName"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    if (json["city"] is String) {
      city = json["city"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["profileProgress"] is int) {
      profileProgress = json["profileProgress"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["updatedOn"] is String) {
      updatedOn = json["updatedOn"];
    }
    if (json["createdOn"] is String) {
      createdOn = json["createdOn"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = sId;
    _data["fullName"] = fullName;
    _data["email"] = email;
    _data["password"] = password;
    _data["phoneNumber"] = phoneNumber;
    _data["city"] = city;
    _data["state"] = state;
    _data["address"] = address;
    _data["profileProgress"] = profileProgress;
    _data["id"] = id;
    _data["updatedOn"] = updatedOn;
    _data["createdOn"] = createdOn;
    // _data["__v"] = v;
    return _data;
  }
}
