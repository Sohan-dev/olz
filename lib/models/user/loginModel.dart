// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String name;
  final String phone;
  final String kycFront;
  final String kycBack;
  final String opportunityId;
  final String age;
  final String address;
  final String pinCode;
  final String sex;
  final String countryId;
  final String countryName;
  final String stateId;
  final String stateName;
  final String isProfileVerified;
  final String profileUpdateAllow;
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.kycFront,
    required this.kycBack,
    required this.opportunityId,
    required this.age,
    required this.address,
    required this.pinCode,
    required this.sex,
    required this.countryId,
    required this.countryName,
    required this.stateId,
    required this.stateName,
    required this.isProfileVerified,
    required this.profileUpdateAllow,
  });

  User copyWith({
    int? id,
    String? name,
    String? phone,
    String? kycFront,
    String? kycBack,
    String? opportunityId,
    String? age,
    String? address,
    String? pinCode,
    String? sex,
    String? countryId,
    String? countryName,
    String? stateId,
    String? stateName,
    String? isProfileVerified,
    String? profileUpdateAllow,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      kycFront: kycFront ?? this.kycFront,
      kycBack: kycBack ?? this.kycBack,
      opportunityId: opportunityId ?? this.opportunityId,
      age: age ?? this.age,
      address: address ?? this.address,
      pinCode: pinCode ?? this.pinCode,
      sex: sex ?? this.sex,
      countryId: countryId ?? this.countryId,
      countryName: countryName ?? this.countryName,
      stateId: stateId ?? this.stateId,
      stateName: stateName ?? this.stateName,
      isProfileVerified: isProfileVerified ?? this.isProfileVerified,
      profileUpdateAllow: profileUpdateAllow ?? this.profileUpdateAllow,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'kycFront': kycFront,
      'kycBack': kycBack,
      'opportunityId': opportunityId,
      'age': age,
      'address': address,
      'pinCode': pinCode,
      'sex': sex,
      'countryId': countryId,
      'countryName': countryName,
      'stateId': stateId,
      'stateName': stateName,
      'isProfileVerified': isProfileVerified,
      'profileUpdateAllow': profileUpdateAllow,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      phone: map['phone'] as String,
      kycFront: map['kycFront'] as String,
      kycBack: map['kycBack'] as String,
      opportunityId: map['opportunityId'] as String,
      age: map['age'] as String,
      address: map['address'] as String,
      pinCode: map['pinCode'] as String,
      sex: map['sex'] as String,
      countryId: map['countryId'] as String,
      countryName: map['countryName'] as String,
      stateId: map['stateId'] as String,
      stateName: map['stateName'] as String,
      isProfileVerified: map['isProfileVerified'] as String,
      profileUpdateAllow: map['profileUpdateAllow'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, phone: $phone, kycFront: $kycFront, kycBack: $kycBack, opportunityId: $opportunityId, age: $age, address: $address, pinCode: $pinCode, sex: $sex, countryId: $countryId, countryName: $countryName, stateId: $stateId, stateName: $stateName, isProfileVerified: $isProfileVerified, profileUpdateAllow: $profileUpdateAllow)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.kycFront == kycFront &&
        other.kycBack == kycBack &&
        other.opportunityId == opportunityId &&
        other.age == age &&
        other.address == address &&
        other.pinCode == pinCode &&
        other.sex == sex &&
        other.countryId == countryId &&
        other.countryName == countryName &&
        other.stateId == stateId &&
        other.stateName == stateName &&
        other.isProfileVerified == isProfileVerified &&
        other.profileUpdateAllow == profileUpdateAllow;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        kycFront.hashCode ^
        kycBack.hashCode ^
        opportunityId.hashCode ^
        age.hashCode ^
        address.hashCode ^
        pinCode.hashCode ^
        sex.hashCode ^
        countryId.hashCode ^
        countryName.hashCode ^
        stateId.hashCode ^
        stateName.hashCode ^
        isProfileVerified.hashCode ^
        profileUpdateAllow.hashCode;
  }
}
