import 'dart:convert';

import 'package:flutter/foundation.dart';

class GeocodeResult {
  GeocodeResult({
    required this.results,
    required this.status,
  });

  final List<Result> results;
  final String status;

  GeocodeResult copyWith({
    List<Result>? results,
    String? status,
  }) {
    return GeocodeResult(
      results: results ?? this.results,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'results': results.map((x) => x.toMap()).toList()});
    result.addAll({'status': status});

    return result;
  }

  factory GeocodeResult.fromMap(Map<String, dynamic> map) {
    return GeocodeResult(
      results: List<Result>.from(map['results']?.map((x) => Result.fromMap(x))),
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GeocodeResult.fromJson(String source) => GeocodeResult.fromMap(json.decode(source));

  @override
  String toString() => 'GeocodeResult(results: $results, status: $status)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GeocodeResult && listEquals(other.results, results) && other.status == status;
  }

  @override
  int get hashCode => results.hashCode ^ status.hashCode;
}

class Result {
  Result({
    required this.addressComponents,
    required this.formattedAddress,
    required this.geometry,
    required this.placeId,
    required this.types,
  });

  final List<AddressComponent> addressComponents;
  final String formattedAddress;
  final Geometry geometry;
  final String placeId;
  final List<String> types;

  Result copyWith({
    List<AddressComponent>? addressComponents,
    String? formattedAddress,
    Geometry? geometry,
    String? placeId,
    List<String>? types,
  }) {
    return Result(
      addressComponents: addressComponents ?? this.addressComponents,
      formattedAddress: formattedAddress ?? this.formattedAddress,
      geometry: geometry ?? this.geometry,
      placeId: placeId ?? this.placeId,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'addressComponents': addressComponents.map((x) => x.toMap()).toList()});
    result.addAll({'formattedAddress': formattedAddress});
    result.addAll({'geometry': geometry.toMap()});
    result.addAll({'placeId': placeId});
    result.addAll({'types': types});

    return result;
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      addressComponents: <AddressComponent>[],
      formattedAddress: map['formattedAddress'] ?? '',
      geometry: Geometry.fromMap(map['geometry']),
      placeId: map['placeId'] ?? '',
      types: List<String>.from(map['types']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) => Result.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Result(addressComponents: $addressComponents, formattedAddress: $formattedAddress, geometry: $geometry, placeId: $placeId, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Result &&
        listEquals(other.addressComponents, addressComponents) &&
        other.formattedAddress == formattedAddress &&
        other.geometry == geometry &&
        other.placeId == placeId &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode {
    return addressComponents.hashCode ^
        formattedAddress.hashCode ^
        geometry.hashCode ^
        placeId.hashCode ^
        types.hashCode;
  }
}

class AddressComponent {
  AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  final String longName;
  final String shortName;
  final List<String> types;

  AddressComponent copyWith({
    String? longName,
    String? shortName,
    List<String>? types,
  }) {
    return AddressComponent(
      longName: longName ?? this.longName,
      shortName: shortName ?? this.shortName,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'longName': longName});
    result.addAll({'shortName': shortName});
    result.addAll({'types': types});

    return result;
  }

  factory AddressComponent.fromMap(Map<String, dynamic> map) {
    return AddressComponent(
      longName: map['longName'] ?? '',
      shortName: map['shortName'] ?? '',
      types: List<String>.from(map['types']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressComponent.fromJson(String source) => AddressComponent.fromMap(json.decode(source));

  @override
  String toString() => 'AddressComponent(longName: $longName, shortName: $shortName, types: $types)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressComponent &&
        other.longName == longName &&
        other.shortName == shortName &&
        listEquals(other.types, types);
  }

  @override
  int get hashCode => longName.hashCode ^ shortName.hashCode ^ types.hashCode;
}

class Geometry {
  Geometry({
    required this.bounds,
    required this.location,
    required this.locationType,
    required this.viewport,
  });

  final Bounds bounds;
  final Location location;
  final String locationType;
  final Bounds viewport;

  Geometry copyWith({
    Bounds? bounds,
    Location? location,
    String? locationType,
    Bounds? viewport,
  }) {
    return Geometry(
      bounds: bounds ?? this.bounds,
      location: location ?? this.location,
      locationType: locationType ?? this.locationType,
      viewport: viewport ?? this.viewport,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'bounds': bounds.toMap()});
    result.addAll({'location': location.toMap()});
    result.addAll({'locationType': locationType});
    result.addAll({'viewport': viewport.toMap()});

    return result;
  }

  factory Geometry.fromMap(Map<String, dynamic> map) {
    return Geometry(
      bounds: Bounds.fromMap(map['bounds']),
      location: Location.fromMap(map['location']),
      locationType: map['locationType'] ?? '',
      viewport: Bounds.fromMap(map['viewport']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Geometry.fromJson(String source) => Geometry.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Geometry(bounds: $bounds, location: $location, locationType: $locationType, viewport: $viewport)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Geometry &&
        other.bounds == bounds &&
        other.location == location &&
        other.locationType == locationType &&
        other.viewport == viewport;
  }

  @override
  int get hashCode {
    return bounds.hashCode ^ location.hashCode ^ locationType.hashCode ^ viewport.hashCode;
  }
}

class Bounds {
  Bounds({
    required this.northeast,
    required this.southwest,
  });

  final Location northeast;
  final Location southwest;

  Bounds copyWith({
    Location? northeast,
    Location? southwest,
  }) {
    return Bounds(
      northeast: northeast ?? this.northeast,
      southwest: southwest ?? this.southwest,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'northeast': northeast.toMap()});
    result.addAll({'southwest': southwest.toMap()});

    return result;
  }

  factory Bounds.fromMap(Map<String, dynamic> map) {
    return Bounds(
      northeast: Location.fromMap(map['northeast']),
      southwest: Location.fromMap(map['southwest']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bounds.fromJson(String source) => Bounds.fromMap(json.decode(source));

  @override
  String toString() => 'Bounds(northeast: $northeast, southwest: $southwest)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Bounds && other.northeast == northeast && other.southwest == southwest;
  }

  @override
  int get hashCode => northeast.hashCode ^ southwest.hashCode;
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  Location copyWith({
    double? lat,
    double? lng,
  }) {
    return Location(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'lat': lat});
    result.addAll({'lng': lng});

    return result;
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      lat: map['lat']?.toDouble() ?? 0.0,
      lng: map['lng']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source));

  @override
  String toString() => 'Location(lat: $lat, lng: $lng)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Location && other.lat == lat && other.lng == lng;
  }

  @override
  int get hashCode => lat.hashCode ^ lng.hashCode;
}
