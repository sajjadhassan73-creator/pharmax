import 'package:flutter/material.dart';

class NotesDialog extends StatelessWidget {
  final TextEditingController controller;

  const NotesDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ملاحظات'),
      content: TextField(
        controller: controller,
        maxLines: 5,
        decoration: const InputDecoration(hintText: 'اكتب ملاحظاتك هنا...'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إغلاق'),
        ),
      ],
    );
  }
}
