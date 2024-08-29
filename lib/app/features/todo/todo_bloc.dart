import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/features/todo/todo_event.dart';
import 'package:test_project/app/features/todo/todo_service.dart';
import 'package:test_project/app/features/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required this.todoService}) : super(TodoInitial()) {
    on<FetchTodoById>(_onFetchTodoById);
    on<FetchAllTodos>(_onFetchAllTodos);
    on<CreateTodo>(_onCreateTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodoById>(_onDeleteTodoById);
  }
  final TodoService todoService;

  Future<void> _onFetchTodoById(
    FetchTodoById event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoLoading());
    final todo = await todoService.fetchTodoById(event.id);
    if (todo != null) {
      emit(TodoLoaded(todo: todo));
    } else {
      emit(TodoError('Todo not found'));
    }
  }

  Future<void> _onFetchAllTodos(
    FetchAllTodos event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoLoading());
    final todos = await todoService.fetchAllTodos();
    if (todos != null && todos.isNotEmpty) {
      emit(TodoLoaded(todos: todos));
    } else {
      emit(TodoError('No todos found'));
    }
  }

  Future<void> _onCreateTodo(CreateTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final todo = await todoService.createTodo(event.todo);
    if (todo != null) {
      emit(TodoLoaded(todo: todo));
    } else {
      emit(TodoError('Failed to create todo'));
    }
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final todo = await todoService.updateTodo(event.id, event.todo);
    if (todo != null) {
      emit(TodoLoaded(todo: todo));
    } else {
      emit(TodoError('Failed to update todo'));
    }
  }

  Future<void> _onDeleteTodoById(
    DeleteTodoById event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoLoading());
    final success = await todoService.deleteTodoById(event.id);
    if (success) {
      emit(TodoDeleted());
    } else {
      emit(TodoError('Failed to delete todo'));
    }
  }
}
