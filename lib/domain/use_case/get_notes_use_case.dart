import 'package:note_app/common/use_case.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/interface/repository/note_repository.dart';
import 'package:note_app/domain/util/note_order_type.dart';

class GetNotesUseCase extends UseCase<List<Note>, NoteOrderType> {
  NoteRepository repository;

  GetNotesUseCase(this.repository);

  @override
  Future<List<Note>> call(NoteOrderType params) async {
    List<Note> notes = await repository.getNotes();

    if (notes.isNotEmpty) {
      params.when(
        title: (order) {
          order.when(ascending: () {
            notes.sort((Note a, Note b) => a.title.compareTo(b.title));
          }, descending: () {
            notes.sort((Note a, Note b) => b.title.compareTo(a.title));
          });
        },
        date: (order) {
          order.when(ascending: () {
            notes.sort((Note a, Note b) => a.timestamp.compareTo(b.timestamp));
          }, descending: () {
            notes.sort((Note a, Note b) => b.timestamp.compareTo(a.timestamp));
          });
        },
        color: (order) {
          order.when(ascending: () {
            notes.sort((Note a, Note b) => a.color.compareTo(b.color));
          }, descending: () {
            notes.sort((Note a, Note b) => b.color.compareTo(a.color));
          });
        },
      );
    }

    return notes;
  }
}
