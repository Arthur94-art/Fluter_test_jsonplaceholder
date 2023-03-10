import 'package:jsonplaceholder/feature/domain/entities/geo_entity.dart';

class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geo;

  const AddressEntity(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});
}
