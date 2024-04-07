part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class AddTodo extends TodoEvent{
  final TodoModel todo;
  AddTodo(this.todo);
}

class DeleteTodo extends TodoEvent{
  final TodoModel todo;
  DeleteTodo(this.todo);
}

class EditTodo extends TodoEvent{
  final TodoModel todo;
  EditTodo(this.todo);
}