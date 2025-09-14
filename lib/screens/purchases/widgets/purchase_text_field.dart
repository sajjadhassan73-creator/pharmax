import 'package:flutter/material.dart';

class PurchaseTextField extends StatelessWidget {
  const PurchaseTextField({
    Key? key,
    required this.controller,
    this.label,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final String? label;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        onChanged: onChanged,
      ),
    );
  }
}