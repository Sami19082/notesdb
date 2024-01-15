part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}
class SearchWall extends SearchEvent{
  String query;
  String colorCode;
  int? page;
  SearchWall({required this.query, required this.colorCode,this.page = 1});
}