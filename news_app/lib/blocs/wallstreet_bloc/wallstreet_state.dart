part of 'wallstreet_bloc.dart';

@immutable
abstract class WallstreetState {}

class WallstreetInitialState extends WallstreetState {}
class WallstreetLoadingState extends WallstreetState {}
class WallstreetLoadedState extends WallstreetState {
  MainModel mainModel;

  WallstreetLoadedState({required this.mainModel});
}
class WallstreetErrorState extends WallstreetState {
  String errorMsg;

  WallstreetErrorState({required this.errorMsg});
}
