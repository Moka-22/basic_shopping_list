import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<List<String>> {
  ShoppingListCubit() : super([]);

  void addItem(String item){
    state.add(item);
    emit(List.from(state));
  }
  void removeItem(int index){
    state.remove(index);
    emit(List.from(state));
  }
}
