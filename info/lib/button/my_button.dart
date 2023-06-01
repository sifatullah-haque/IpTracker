import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final text;
  final icon;
  final onPress;
  const myButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(
          Color(0xff886AE2),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: .0),
        child: Row(
          children: [
            Text(
              "$text",
              style: const TextStyle(color: Color(0xff481E71), fontSize: 15.0),
            ),
            const SizedBox(
              width: 4.0,
            ),
            icon
          ],
        ),
      ),
    );
  }
}
