import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const InsertData());
}

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  InsertDataState createState() => InsertDataState();
}

class InsertDataState extends State<InsertData> {
  final formKey = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  LatLng selectedLocation = LatLng(51.5074, -0.1278);

  Future<void> insert() async {
    final Uri url = Uri.parse("http://127.0.0.1/flutter_final_03/insert.php");

    final response = await http.post(
      url,
      body: {
        "first_name": firstName.text,
        "last_name": lastName.text,
        "phone_number": phoneNumber.text,
        "latitude": selectedLocation.latitude,
        "longtitude": selectedLocation.longitude,
      },
    );

    if (!mounted) return;

    var data = json.decode(response.body);
    if (data == 'Success') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$data : Data inserted successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$data : Data failed to insert')));
    }
  }

  void updateLocation(LatLng newLocation) {
    setState(() {
      selectedLocation = newLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Data"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: firstName,
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  TextFormField(
                    controller: lastName,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                  ),
                  TextFormField(
                    controller: phoneNumber,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                  ),
                  const SizedBox(height: 20),
                  // OpenStreetMap
                  SizedBox(
                    height: 300,
                    child: FlutterMap(
                      options: MapOptions(
                        center: selectedLocation, // Initial location
                        zoom: 13.0, // Initial zoom level
                        onTap: (tapPosition, point) {
                          updateLocation(point); // Update location on tap
                        },
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate:
                              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayerOptions(
                          markers: [
                            Marker(
                              point:
                                  selectedLocation, // Display selected location
                              builder: (context) => const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 40),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: insert,
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
