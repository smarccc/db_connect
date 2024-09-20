import 'package:flutter/material.dart';
import 'plant_info_screen.dart'; // Import your PlantInfoScreen file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicinal Plants App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(), // Make sure your home screen is defined
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicinal Plants'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Make sure to use the correct context for navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlantInfoScreen(plantName: 'Acacia'),
                  ),
                );
              },
              child: const Text('Acacia'),
            ),
            const SizedBox(width: 20), // Space between buttons
            ElevatedButton(
              onPressed: () {
                // Navigating to Akapulko screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PlantInfoScreen(plantName: 'Akapulko'),
                  ),
                );
              },
              child: const Text('Akapulko'),
            ),
          ],
        ),
      ),
    );
  }
}
