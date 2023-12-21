import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const DigitalClockApp());
}

class DigitalClockApp extends StatelessWidget {
  const DigitalClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Digital Clock App',
            style: TextStyle(color: Colors.white),  // Set the app title color
          ),
          backgroundColor: Colors.blue,  // Set the app bar background color
        ),
        body: const Center(
          child: DigitalClock(),
        ),
        backgroundColor: Colors.grey[200],  // Set the background color of the app
      ),
    );
  }
}

class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  String _time = '';
  List<Color> clockColors = [Colors.black, Colors.blue, Colors.red, Colors.green, Colors.teal];  // List of colors for the clock display
  int currentColorIndex = 0;  // Index of the current color

  @override
  void initState() {
    super.initState();

    // Update the time every second using a Timer
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _updateTime();  // Call the _updateTime function to update the time
    });
  }

  void _updateTime() {
    setState(() {
      // Get the current time and format it as a string
      _time = DateTime.now().toString().split(' ')[1].split('.')[0];
    });
  }

  void _changeColor() {
    setState(() {
      // Change the color of the clock display
      currentColorIndex = (currentColorIndex + 1) % clockColors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _time,  // Display the current time using a Text widget
          style: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            color: clockColors[currentColorIndex],  // Set the color of the clock display
          ),
        ),
        const SizedBox(height: 16.0),  // Add some spacing between the clock and the button
        ElevatedButton(
          onPressed: _changeColor,
          child: const Text('Change Color'),  // Button to change the color of the clock
        ),
      ],
    );
  }
}
