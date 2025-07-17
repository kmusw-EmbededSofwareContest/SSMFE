import 'package:flutter/material.dart';

class GreenButtonAccessible extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GreenButtonAccessible({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00FF00),
        minimumSize: Size(width * 0.77, 50),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: width * 0.08,
          color: Colors.white,
        ),
      ),
    );
  }
}
