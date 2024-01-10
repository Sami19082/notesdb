part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}
class SearchWall extends SearchEvent{
  String query;

  SearchWall({required this.query, required String colorcode});
}