part of 'business_bloc.dart';

@immutable
abstract class BusinessState {}

class BusinessInitialState extends BusinessState {}
class BusinessLoadingState extends BusinessState {}
class BusinessLoadedState extends BusinessState {
  MainModel mainModel;

  BusinessLoadedState({required this.mainModel});
}
class BusinessErrorState extends BusinessState {
  String errorMsg;

  BusinessErrorState({required this.errorMsg});
}
