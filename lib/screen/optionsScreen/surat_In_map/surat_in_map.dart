import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SuratInMap extends StatefulWidget {
  const SuratInMap({super.key});

  @override
  State<SuratInMap> createState() => _SuratInMapState();
}

final CameraPosition _GoogleFlex =
    CameraPosition(target: LatLng(21.167444745068266, 72.83532277494429),zoom: 10);

class _SuratInMapState extends State<SuratInMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Surat in Map',style: TextStyle(color: Colors.white),),
      ),
        body: GoogleMap(
      initialCameraPosition: _GoogleFlex,
          mapType: MapType.hybrid,
    ));
  }
}
