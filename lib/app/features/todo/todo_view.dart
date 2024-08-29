import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/features/todo/todo_bloc.dart';
import 'package:test_project/app/features/todo/todo_event.dart';
import 'package:test_project/app/features/todo/todo_state.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoaded) {
            if (state.todos != null) {
              return ListView.builder(
                itemCount: state.todos!.length,
                itemBuilder: (context, index) {
                  final todo = state.todos![index];
                  return ListTile(
                    title: Text(todo.title ?? ''),
                  );
                },
              );
            } else if (state.todo != null) {
              return ListTile(
                title: Text(state.todo!.title ?? ''),
              );
            }
          } else if (state is TodoError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          return const Center(child: Text('No Todos'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoBloc>().add(FetchAllTodos());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
