import 'notemodel.dart';

abstract class NoteState{}

class NoteInitiated extends NoteState{}


class NoteLoading extends NoteState{}


class NoteLoaded extends NoteState{
List<NoteModel> allnotes;
NoteLoaded({required this.allnotes});
}

class NoteError extends NoteState{
String errormsg;
NoteError({required this.errormsg});
}