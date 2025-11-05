part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class LoadingState extends SearchState {}

final class SuccessState extends SearchState {
  final List<Articles> articles;

  SuccessState(this.articles);
}

final class ErrorState extends SearchState {
  final String error;

  ErrorState(this.error);
}

final class EmptyState extends SearchState {
  final String empty;

  EmptyState(this.empty);
}
