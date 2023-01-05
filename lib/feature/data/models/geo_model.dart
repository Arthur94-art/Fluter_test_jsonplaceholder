import 'package:jsonplaceholder/feature/domain/entities/geo_entity.dart';

class GeoModel extends GeoEntity {
  const GeoModel({required lat, required lng})
      : super(
          lat: lat,
          lng: lng,
        );

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(lat: json['lat'], lng: json['lng']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
