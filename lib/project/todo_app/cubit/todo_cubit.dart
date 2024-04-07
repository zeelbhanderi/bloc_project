import 'package:bloc_project/project/todo_app/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {

  TodoCubit() : super([]);

  void addTodo(TodoModel todo) {
    emit([...state,todo]);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(state);
  }

  // void updateTodo(TodoModel todo) async {
  //   await repository.updateTodo(todo);
  //   fetchTodos();
  // }
  //
  // void deleteTodo(TodoModel todo) async {
  //   await repository.deleteTodo(todo);
  //   fetchTodos();
  // }
}