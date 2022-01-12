import 'package:note_app/common/use_case.dart';
import 'package:note_app/common/result.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/interface/repository/note_repository.dart';

class GetNoteUseCase extends UseCase<Result<Note>, int> {
  NoteRepository repository;

  GetNoteUseCase(this.repository);

  @override
  Future<Result<Note>> call(int id) async {
    return await repository.getNoteById(id);
  }
}
