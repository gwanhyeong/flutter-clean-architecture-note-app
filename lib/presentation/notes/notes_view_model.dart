import 'package:flutter/material.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/use_case/note_use_cases.dart';
import 'package:note_app/domain/util/note_order_type.dart';
import 'package:note_app/presentation/notes/notes_event.dart';
import 'package:note_app/presentation/notes/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final NoteUseCases _useCases;

  NotesState _state = NotesState();

  NotesState get state => _state;

  Note? _recentlyDeletedNote;

  bool _isOpenedFilter = false;
  bool get isOpenedFilter => _isOpenedFilter;

  NotesViewModel(this._useCases) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
      changeOrderType: _changeOrderType,
    );
  }

  void toggleFilter() {
    _isOpenedFilter = !_isOpenedFilter;
    notifyListeners();
  }

  void _loadNotes() async {
    List<Note> notes = await _useCases.getNotes(_state.orderType);
    _state = state.copyWith(
      notes: notes,
    );
    notifyListeners();
  }

  void _deleteNote(Note note) async {
    await _useCases.deleteNote(note);
    _recentlyDeletedNote = note;

    _loadNotes();
  }

  void _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await _useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }

  void _changeOrderType(NoteOrderType orderType) {
    _state = state.copyWith(
      orderType: orderType,
    );

    _loadNotes();
  }
}
