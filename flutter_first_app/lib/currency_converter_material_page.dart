// Importing the Flutter Material library
import 'package:flutter/material.dart';

// Defining a StatefulWidget for the Currency Converter Material Page
class CurrencyConverterMaterialPage extends StatefulWidget {
  // Constructor for the class, using the super keyword
  const CurrencyConverterMaterialPage({super.key});
  /* Steps for make Currency converted */
  // 1. Create a variable that stores the converted currency value.
  // 2. Create function that multiples the value given by textField.
  // 3. Store the value in the variable that we created.
  // 4. Display the variable.

  // Overriding the createState method to return the state of the widget
  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();   // Private class.
}

// State class for the CurrencyConverterMaterialPage widget
class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  // Variable to store the conversion result
  double result = 0;

  // Controller for the text input field
  final TextEditingController textEditingController = TextEditingController();

  // Method to perform the currency conversion
  void convert() {
    result = double.parse(textEditingController.text) * 47;
    setState(() {});    // used notify that the internal stated are changed so it want to rebuilt to share the new result to the user.
  }

  // Overriding the dispose method to clean up resources
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  // Build method to create the UI for the widget
  @override
  Widget build(BuildContext context) {
    // Defining an outline border for the text field
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    // Building the main scaffold with an app bar and body
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Setting the background color
      appBar: AppBar(  /* is header for your app */
        backgroundColor: Colors.blueGrey, // Setting app bar background color
        elevation: 0,
        title: const Text('Currency Converter', style: TextStyle(
          color: Colors.white,
        ),), // App bar title
        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),  // mean but 10 padding for each side left top right button.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            /* mainAxisAlignment is a vertical axis and crossAsisAlignment is horizontal axis */
            children: [
              /* children accept a list of widgets */
              // Displaying the conversion result with styling
              Text(
                'EGY ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              // padding
              // container
              // Text field for user input with specific decoration
              TextField(
                /* TextField used to take input from user. */
                controller: textEditingController,  /* textEditingController used to have access to user input */
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText:
                      'Please enter the amount in USD', // USD -> United State Dollar
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  /* prefix used to add from left side and suffix used to add from right */
                  prefixIconColor: Colors.black,
                  /* set black color for dollarSign */
                  filled: true,
                  /* used to make box have hinText and prefixIcon */
                  fillColor: Colors.white,
                  /* set black color for box */
                  focusedBorder: border,
                  /* border is an function we have create it above to reduce complexity in the code "make code easy to read and understand" */
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  /* Here we restrict user to input string he con only input numbers and decimal numbers */
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              // Button to trigger the conversion
              ElevatedButton(  /* Button are two types 1- button raised / 2- button like a text (always exist)  there are TextButton, EvaluatedButton, ButtonStyle */
                onPressed: convert,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Convert'),   // Text the will appear on the button.
              ),
            ], // Children
          ),
        ),
      ),
    );
  }
}
