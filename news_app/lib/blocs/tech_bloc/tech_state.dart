part of 'tech_bloc.dart';

@immutable
abstract class TechState {}

class TechInitialState extends TechState {}
class TechLoadingState extends TechState {}
class TechLoadedState extends TechState {
  MainModel mainModel;

  TechLoadedState({required this.mainModel});
}
class TechErrorState extends TechState {
  String errorMsg;

  TechErrorState({required this.errorMsg});
}
