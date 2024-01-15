part of 'newsbloc_bloc.dart';

@immutable
abstract class NewsblocState {}

class NewsblocInitialState extends NewsblocState {}
class NewsblocLoadingState extends NewsblocState {}
class NewsblocLoadedState extends NewsblocState {
  MainModel mainModel;

  NewsblocLoadedState({required this.mainModel});
}
class NewsblocErrorState extends NewsblocState {
  String errorMsg;

  NewsblocErrorState({required this.errorMsg});
}
