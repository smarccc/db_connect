import 'package:flutter/material.dart';
import '../../database/database_helper.dart';  // Import the database helper

class PlantInfoScreen extends StatelessWidget {
  final String plantName;

  const PlantInfoScreen({super.key, required this.plantName}); // Accepts the plant name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(plantName)), // Display the plant name in AppBar
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getPlantInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No information available.'));
          } else {
            final plant = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name: ${plant['name']}', // Display fetched plant name
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Description: ${plant['description']}', // Display fetched plant description
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Fetch plant info from the database based on the passed plant name
  Future<Map<String, dynamic>> _getPlantInfo() async {
    final db = await DatabaseHelper().database;
    final result = await db.query(
      'plants',
      where: 'name = ?',
      whereArgs: [plantName],  // Use the passed plantName to query
    );
    return result.isNotEmpty ? result.first : {};
  }
}
