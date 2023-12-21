import 'package:flutter_first_app/currency_converter_material_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Types of Widgets
// 1. StatelessWidget  is a widget that does not have any mutable state. Once it is created, its properties cannot change,
//                     It is used for parts of the user interface that do not change dynamically.
//                     used to display static text, images, icons, or any other elements that do not need to be updated based on user.
// 2. StatefulWidget  is a widget that can change dynamically. It has mutable state, and when the state changes, the widget is rebuilt,
//                    usage include forms, animations, and any UI element that needs to respond to user input.

// State

// 1. Material Design (Android)
// 2. Cupertino Design (IOS)

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {  // build: is responsible for constructing and returning the widget tree based on the current configuration and state of the widget.
    return const MaterialApp(
      home: CurrencyConverterMaterialPage(),
      title: 'Currency Converter',
    );
  }
}
// class MyCupertinoApp extends StatelessWidget {
//   const MyCupertinoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//       home: CurrencyConverterCupertinoPage(),
//     );
//   }
// }