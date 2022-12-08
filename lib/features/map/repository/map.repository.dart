import 'package:cnpj_finder/features/home/models/company.model.dart';
import 'package:cnpj_finder/features/map/models/geocoderesult.model.dart';
import 'package:http/http.dart' as http;

//https://maps.googleapis.com/maps/api/geocode/json?address=74650140&key=AIzaSyDzzQokf2PHwi_Z1manSutf1nBHhgqGe7Q
class MapRepository {
  static const String baseUrl = 'maps.googleapis.com';
  static const String googleMapsApiKey = 'AIzaSyDzzQokf2PHwi_Z1manSutf1nBHhgqGe7Q';
  Future<CompanyModel> getLocationFromAddress(CompanyModel company) async {
    var url = Uri.https(
      baseUrl,
      'maps/api/geocode/json',
      {'key': googleMapsApiKey, 'address': company.address},
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var geocodeResponse = GeocodeResult.fromJson(response.body);
      if (geocodeResponse.results.isNotEmpty) {
        return company.copyWith(
          lat: geocodeResponse.results[0].geometry.location.lat,
          lng: geocodeResponse.results[0].geometry.location.lng,
        );
      }
    }

    return company;
  }
}
