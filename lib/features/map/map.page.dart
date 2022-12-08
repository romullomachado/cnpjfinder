import 'package:cnpj_finder/core/cnpj_finder_colors.dart';
import 'package:cnpj_finder/features/home/models/company.model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  static const routeName = '/map';

  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late CompanyModel selectedCompany;
  late Marker _marker;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final selectedCompany = ModalRoute.of(context)!.settings.arguments as CompanyModel;
    _marker = Marker(
      markerId: MarkerId(selectedCompany.name),
      position: LatLng(selectedCompany.lat ?? 0, selectedCompany.lng ?? 0),
      infoWindow: InfoWindow(
        title: selectedCompany.name,
        snippet: selectedCompany.address,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: CnpjFinderColors.Primary,
        title: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    selectedCompany.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: CnpjFinderColors.White),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  selectedCompany.document,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: CnpjFinderColors.White),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: CnpjFinderColors.White,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(selectedCompany.lat ?? 0, selectedCompany.lng ?? 0),
            zoom: 15.0,
          ),
          markers: {_marker},
        ),
      ),
    );
  }
}
