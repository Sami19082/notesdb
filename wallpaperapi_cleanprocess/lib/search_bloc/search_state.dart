part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchLoadedState extends SearchState {
  WallpaperDataModel mData;

  SearchLoadedState({required this.mData});
}
class SearchErrorState extends SearchState {
  String errorMsg;

  SearchErrorState({required this.errorMsg});
}
