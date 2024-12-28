import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../todo_app/model/todo_model.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> todos = [];

  TodoBloc() : super(TodoInitial()) {
    on<AddTodo>((event, emit) {
      todos.add(event.todo);
      emit(TodoLoaded(todos));
    });
    on<DeleteTodo>((event, emit) {
      todos.remove(event.todo);
      emit(TodoLoaded(todos));
    });
    on<EditTodo>((event, emit) {
      final index = todos.indexWhere((todo) => todo.id == event.todo.id);

      // print(event.todo.toJson());
      // TodoModel todo = todos.firstWhere((element) => element.id == event.todo.id);
      // print(todo..toJson());
      // print(todos);
      emit(TodoLoaded(todos));
    });
  }

  @override
  void onChange(Change<TodoState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(todos.map((e) => e.toJson()));
  }
}
