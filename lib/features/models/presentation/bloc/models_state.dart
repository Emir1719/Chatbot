part of 'models_bloc.dart';

abstract class ModelsState extends Equatable {
  const ModelsState();

  @override
  List<Object> get props => [];
}

class ModelsInitial extends ModelsState {}

class ModelsLoading extends ModelsState {}

class ModelsLoaded extends ModelsState {
  final IChatbot model;

  const ModelsLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class ModelsError extends ModelsState {
  final String message;

  const ModelsError({required this.message});

  @override
  List<Object> get props => [message];
}
