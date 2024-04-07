import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
      if (index != -1) {
        todos[index] = event.todo;
        emit(TodoLoaded(List.from(todos)));
      }
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
