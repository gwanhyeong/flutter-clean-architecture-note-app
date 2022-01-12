import 'package:note_app/common/use_case.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/interface/repository/note_repository.dart';

class DeleteNoteUseCase extends UseCase<void, Note> {
  NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  @override
  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}
