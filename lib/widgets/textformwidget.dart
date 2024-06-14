import 'package:flutter/material.dart';

class TextformfieldWidget extends StatelessWidget {
  const TextformfieldWidget({
    super.key,
    required this.amtController,
  });

  final TextEditingController amtController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      autofocus: false,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Enter amount to be paid',
        labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
      ),
      controller: amtController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the amount to be paid';
        }
        if (int.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );
  }
}
