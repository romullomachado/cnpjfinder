import 'dart:convert';

class CompanyModel {
  final String name;
  final String document;
  final String address;
  final double? lat;
  final double? lng;
  CompanyModel({
    required this.name,
    required this.document,
    required this.address,
    this.lat,
    this.lng,
  });

  CompanyModel copyWith({
    String? name,
    String? document,
    String? address,
    double? lat,
    double? lng,
  }) {
    return CompanyModel(
      name: name ?? this.name,
      document: document ?? this.document,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'document': document});
    result.addAll({'address': address});
    if (lat != null) {
      result.addAll({'lat': lat});
    }
    if (lng != null) {
      result.addAll({'lng': lng});
    }

    return result;
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      name: map['name'] ?? '',
      document: map['document'] ?? '',
      address: map['address'] ?? '',
      lat: map['lat']?.toDouble(),
      lng: map['lng']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) => CompanyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CompanyModel(name: $name, document: $document, address: $address, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanyModel &&
        other.name == name &&
        other.document == document &&
        other.address == address &&
        other.lat == lat &&
        other.lng == lng;
  }

  @override
  int get hashCode {
    return name.hashCode ^ document.hashCode ^ address.hashCode ^ lat.hashCode ^ lng.hashCode;
  }
}
