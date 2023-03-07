// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_cubit/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_cubit/cubits/todo_search/todo_search_cubit.dart';

import '../../models/todo_model.dart';

part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  late StreamSubscription todoFilterSubsription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoListSubscription;

  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;
  FilteredTodosCubit({
    required this.todoFilterCubit,
    required this.todoSearchCubit,
    required this.todoListCubit,
  }) : super(FilteredTodosState.initial()) {
    todoFilterSubsription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFilteredtodos();
    });

    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFilteredtodos();
    });

    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      setFilteredtodos();
    });
  }

  void setFilteredtodos() {
    List<Todo> _filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        _filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        _filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => todo.completed)
            .toList();
        break;
      default:
        _filteredTodos = todoListCubit.state.todos;
        break;
    }

    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where((Todo todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm))
          .toList();
    }

    emit(state.copyWith(filteredTodos: _filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterSubsription.cancel();
    todoSearchSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
