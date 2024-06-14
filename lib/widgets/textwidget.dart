import 'package:flutter/material.dart';

class Textwidget extends StatelessWidget {
  const Textwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to Razorpay Integration",
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}

