import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/note_order_type.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    @Default([]) List<Note> notes,
    @Default(NoteOrderType.date(NoteOrder.descending()))
        NoteOrderType orderType,
  }) = _NotesState;
}
