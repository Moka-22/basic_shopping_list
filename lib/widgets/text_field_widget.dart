import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required TextEditingController text,
  }) : _text = text;

  final TextEditingController _text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _text,
      decoration: InputDecoration(
        labelText: 'Add Item',
        hintText: 'Item',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
