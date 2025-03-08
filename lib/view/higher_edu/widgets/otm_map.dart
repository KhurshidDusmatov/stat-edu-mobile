import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rttrm_task_app/controller/higher_edu/general/general_controller.dart';

class UzbekistanOTMMap extends StatelessWidget {
  final GeneralController controller;

  const UzbekistanOTMMap({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height / 2.3,
      width: MediaQuery
          .of(context)
          .size
          .width - 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("OTMlar joylashish hududi bo'yicha",
                style: TextStyle(fontSize: 13)),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(39.900, 69.2401),
                  // Janubga siljigan markaz
                  initialZoom: 6.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: controller.regions.map((region) {
                      return Marker(
                        width: 80.0,
                        height: 80.0,
                        point: LatLng(region["lat"], region["lng"]),
                        child: Column(
                          children: [
                            Icon(
                                Icons.location_on, color: Colors.red, size: 30),
                            Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26, blurRadius: 4)
                                  ],
                                ),
                                child: Text(
                                  "${region["name"]
                                      .replaceAll(" viloyati", "")
                                      .replaceAll(
                                      " shahri", " sh")}\nOTM: ${region["otm"]}",
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.bold),
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
