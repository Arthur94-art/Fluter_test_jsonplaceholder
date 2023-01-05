import 'package:jsonplaceholder/feature/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel(
      {required super.name, required super.catchPhrase, required super.bs});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
        name: json['name'], catchPhrase: json['catchPhrase'], bs: json['bs']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}
