import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit {
  ReadNotesCubit() : super(ReadNotesInitial());

  fetchAllNotes() {
    emit(ReadNotesLoading());

    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      final List<NoteModel> notes = notesBox.values.toList();
      emit(ReadNotesSuccess(notes));
    } catch (e) {
      emit(ReadNotesFailure(e.toString()));
    }
  }
}
