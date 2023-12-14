import 'notemodel.dart';

abstract class NoteState{

}
class InitialState extends NoteState{}
class LoadingState extends NoteState{}
class LoadedState extends NoteState{
  List<NoteModel> mnotes;
  LoadedState({required this.mnotes});
}
class ErrorState extends NoteState{
  String errormsg;
  ErrorState({required this.errormsg});
}