import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../models/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          'TODO',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        BlocListener<TodoListBloc, TodoListState>(
          listener: (context, state) {
            final int activeTodoCount = state.todos
                .where((Todo todo) => !todo.completed)
                .toList()
                .length;

            context
                .read<ActiveTodoCountBloc>()
                .add(CalculateActiveTodoCountEvent(
                  activeTodoCount: activeTodoCount,
                ));
          },
          child: BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
            builder: (context, state) {
              return Text(
                '${state.activeTodoCount} items left',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                ),
              );
            },
          ),
        ),
        // Text(
        //   '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
        //   style: const TextStyle(
        //     fontSize: 20,
        //     color: Colors.redAccent,
        //   ),
        // ),
      ],
    );
  }
}
