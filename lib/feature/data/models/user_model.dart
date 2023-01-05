import 'package:jsonplaceholder/feature/data/models/adress_model.dart';
import 'package:jsonplaceholder/feature/data/models/company_model.dart';
import 'package:jsonplaceholder/feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required id,
      required name,
      required username,
      required email,
      required address,
      required phone,
      required website,
      required company})
      : super(
            id: id,
            name: name,
            username: username,
            email: email,
            address: address,
            phone: phone,
            website: website,
            company: company);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: json['address'] != null
            ? AddressModel.fromJson(json['address'])
            : null,
        phone: json['phone'],
        website: json['website'],
        company: json['company'] != null
            ? CompanyModel.fromJson(json['company'])
            : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['address'] = address;
    data['phone'] = phone;
    data['website'] = website;
    data['company'] = company;
    return data;
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
  }
}
