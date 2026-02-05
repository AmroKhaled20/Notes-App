part of 'read_notes_cubit.dart';

@immutable
abstract class ReadNotesState {}

class ReadNotesInitial extends ReadNotesState {}

class ReadNotesLoading extends ReadNotesState {}

class ReadNotesSuccess extends ReadNotesState {
  final List<NoteModel> notes;

  ReadNotesSuccess(this.notes);
}

class ReadNotesFailure extends ReadNotesState {
  final String errorMessage;

  ReadNotesFailure(this.errorMessage);
}
