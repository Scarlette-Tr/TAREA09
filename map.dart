import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final double latitude;
  final double longitude;

  MapScreen(
      {required this.firstName,
      required this.lastName,
      required this.latitude,
      required this.longitude});

  void _showMarkerInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Informacion del marcador'),
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre: $firstName $lastName'),
              Text('latitud: $latitude'),
              Text('Longitud: $longitude'),
            ]),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cerrar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mapa')),
      body: FlutterMap(
        options: MapOptions(center: LatLng(latitude, longitude), zoom: 15.0),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(markers: [
            Marker(
              width: 40.0,
              height: 40.0,
              point: LatLng(latitude, longitude),
              builder: (ctx) => GestureDetector(
                onTap: () => _showMarkerInfo(
                    context), // Llamar a la función auxiliar con el contexto
                child: Icon(Icons.location_on, color: Colors.red),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
