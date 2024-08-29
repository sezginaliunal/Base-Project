import 'package:equatable/equatable.dart';
import 'package:test_project/core/models/todo.dart';

abstract class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchTodoById extends TodoEvent {
  FetchTodoById(this.id);
  final int id;

  @override
  List<Object?> get props => [id];
}

class FetchAllTodos extends TodoEvent {}

class CreateTodo extends TodoEvent {
  CreateTodo(this.todo);
  final Todo todo;

  @override
  List<Object?> get props => [todo];
}

class UpdateTodo extends TodoEvent {
  UpdateTodo(this.id, this.todo);
  final int id;
  final Todo todo;

  @override
  List<Object?> get props => [id, todo];
}

class DeleteTodoById extends TodoEvent {
  DeleteTodoById(this.id);
  final int id;

  @override
  List<Object?> get props => [id];
}
