import 'package:jsonplaceholder/feature/data/models/geo_model.dart';
import 'package:jsonplaceholder/feature/domain/entities/adress_entity.dart';

class AddressModel extends AddressEntity {
  const AddressModel(
      {required street,
      required suite,
      required city,
      required zipcode,
      required geo})
      : super(
          street: street,
          suite: suite,
          city: city,
          zipcode: zipcode,
          geo: geo,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: json['geo'] != null ? GeoModel.fromJson(json['geo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    data['geo'] = geo;

    return data;
  }
}
