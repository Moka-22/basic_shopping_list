import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/cubits/shopping_list_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required TextEditingController text,
  }) : _text = text;

  final TextEditingController _text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<ShoppingListCubit>().addItem(_text.text);
        _text.clear();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        backgroundColor: Colors.lightBlueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
