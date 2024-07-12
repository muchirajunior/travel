import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  const CustomChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      color: Colors.amber.shade100.withOpacity(0.1),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        constraints: const BoxConstraints(
          minWidth: 70,
          maxWidth: 200
        ),
        child: Text(
          label,
          style: TextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}