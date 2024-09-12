import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/cubits/shopping_list_cubit.dart';
import 'package:shopping_list/widgets/custom_button_widget.dart';
import 'package:shopping_list/widgets/text_field_widget.dart';
import 'package:shopping_list/widgets/text_widget.dart';

class ShoppingListViewWidget extends StatefulWidget {
  ShoppingListViewWidget({super.key});

  @override
  State<ShoppingListViewWidget> createState() => _ShoppingListViewWidgetState();
}

class _ShoppingListViewWidgetState extends State<ShoppingListViewWidget> {
  final TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextFieldWidget(text: _text),
              ),
              const SizedBox(
                width: 5,
              ),
              CustomButton(text: _text),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<ShoppingListCubit, List<String>>(
            builder: (context, shoppingList) {
              if (shoppingList.isEmpty) {
                return const TextWidget();
              }
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: shoppingList.length,
                  itemBuilder: (context, index) {
                    final item = shoppingList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        key: Key(item),
                        onDismissed: (DismissDirection direction) {
                          if (shoppingList.contains(item)) {
                            setState(() {
                              shoppingList.removeAt(index);
                            });
                          }
                          ;
                        },
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              shoppingList[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
