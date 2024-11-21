part of 'models_bloc.dart';

abstract class ModelsEvent extends Equatable {
  const ModelsEvent();

  @override
  List<Object> get props => [];
}

class SelectModelEvent extends ModelsEvent {
  final IChatbot model;

  const SelectModelEvent({required this.model});

  @override
  List<Object> get props => [model];
}
