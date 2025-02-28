import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_note_event.freezed.dart';

@freezed
abstract class AddEditNoteEvent with _$AddEditNoteEvent {
  const factory AddEditNoteEvent.loadNote(int noteId) = LoadNote;
  const factory AddEditNoteEvent.saveNote(
      int? id, String title, String content) = SaveNote;
  const factory AddEditNoteEvent.changeColor(int color) = ChangeColor;
}
