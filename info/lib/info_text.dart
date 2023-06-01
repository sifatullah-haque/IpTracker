import 'package:flutter/material.dart';

class infoText extends StatelessWidget {
  final text;
  const infoText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        "$text",
        style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 18.0),
      ),
    );
  }
}
