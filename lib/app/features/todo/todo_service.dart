import 'package:test_project/core/config/constants/api_urls.dart';
import 'package:test_project/core/models/todo.dart';
import 'package:test_project/core/services/api/base_network.dart';
import 'package:vexana/vexana.dart';

class TodoService extends BaseNetwork<Todo> {
  TodoService({
    super.baseUrl = ApiUrls.baseUrl,
    super.isEnableLogger = false,
  });

  Future<Todo?> fetchTodoById(int id) async {
    final response = await networkManager.send<Todo, Todo>(
      '/todos/$id', // API endpoint, /todos/id şeklinde
      parseModel: Todo(),
      method: RequestType.GET,
    );

    if (response.data != null) {
      return response.data!;
    }
    return null;
  }

  Future<List<Todo>?> fetchAllTodos() async {
    final response = await networkManager.send<Todo, List<Todo>>(
      '/todos', // API endpoint, /todos şeklinde
      parseModel: Todo(), // parseModel olarak bir Todo nesnesi kullanıyoruz
      method: RequestType.GET,
    );

    if (response.data != null) {
      return response.data!;
    }
    return null;
  }

  Future<Todo?> createTodo(Todo todo) async {
    final response = await networkManager.send<Todo, Todo>(
      '/todos', // API endpoint, /todos şeklinde
      parseModel: todo,
      method: RequestType.POST,
      data: todo.toJson(),
    );

    if (response.data != null) {
      return response.data!;
    }
    return null;
  }

  Future<Todo?> updateTodo(int id, Todo todo) async {
    final response = await networkManager.send<Todo, Todo>(
      '/todos/$id', // API endpoint, /todos/id şeklinde
      parseModel: todo,
      method: RequestType.PUT,
      data: todo.toJson(),
    );

    if (response.data != null) {
      return response.data!;
    }
    return null;
  }

  Future<bool> deleteTodoById(int id) async {
    final response = await networkManager.send<Todo, Todo>(
      '/todos/$id', // API endpoint, /todos/id şeklinde
      parseModel: Todo(),
      method: RequestType.DELETE,
    );

    return response.data != null;
  }
}
