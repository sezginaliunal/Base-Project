import 'package:equatable/equatable.dart';
import 'package:test_project/core/models/todo.dart';

abstract class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  TodoLoaded({this.todo, this.todos});
  final Todo? todo;
  final List<Todo>? todos;

  @override
  List<Object?> get props => [todo, todos];
}

class TodoError extends TodoState {
  TodoError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}

class TodoDeleted extends TodoState {}
