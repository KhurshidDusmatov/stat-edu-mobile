import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class UzbekistanOTMMap extends StatelessWidget {
  UzbekistanOTMMap({super.key});

  final List<Map<String, dynamic>> regions = [
    {"name": "Qoraqalpog‘iston", "lat": 42.4610, "lng": 59.6170, "otm": 12},
    {"name": "Navoiy", "lat": 40.0844, "lng": 65.3792, "otm": 3},
    {"name": "Xorazm", "lat": 41.3565, "lng": 60.8567, "otm": 8},
    {"name": "Buxoro", "lat": 39.7686, "lng": 64.4556, "otm": 11},
    {"name": "Qashqadaryo", "lat": 38.8610, "lng": 65.7847, "otm": 9},
    {"name": "Surxondaryo", "lat": 37.9405, "lng": 67.5707, "otm": 6},
    {"name": "Samarqand", "lat": 39.6542, "lng": 66.9756, "otm": 14},
    {"name": "Jizzax", "lat": 40.1250, "lng": 67.8800, "otm": 5},
    {"name": "Sirdaryo", "lat": 40.4973, "lng": 68.7803, "otm": 3},
    {"name": "Toshkent viloyati", "lat": 41.2000, "lng": 69.7000, "otm": 14},
    {"name": "Namangan", "lat": 41.0000, "lng": 71.6000, "otm": 9},
    {"name": "Andijon", "lat": 40.7833, "lng": 72.3500, "otm": 9},
    {"name": "Farg‘ona", "lat": 40.3864, "lng": 71.7864, "otm": 13},
    {"name": "Toshkent", "lat": 41.2995, "lng": 69.2401, "otm": 92},
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("OTMlar joylashish hududi bo'yicha", style: TextStyle(fontSize: 13)),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(39.900, 69.2401), // Janubga siljigan markaz
                    initialZoom: 6.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: regions.map((region) {
                        return Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(region["lat"], region["lng"]),
                          child: Column(
                            children: [
                              Icon(Icons.location_on, color: Colors.red, size: 30),
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                                ),
                                child: Text(
                                  "${region["name"]}\nOTM: ${region["otm"]}",
                                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
