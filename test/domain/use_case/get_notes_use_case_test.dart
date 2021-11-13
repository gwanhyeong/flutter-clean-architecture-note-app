import 'package:flutter_test/flutter_test.dart';
import 'package:note_app/core/result.dart';
import 'package:note_app/domain/model/note.dart';
import 'package:note_app/domain/repository/note_repository.dart';
import 'package:note_app/domain/use_case/get_notes_use_case.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/note_order_type.dart';

void main() {
  final repository = FakeNoteRepository();
  final useCase = GetNotesUseCase(repository);

  group('노트 가져오기', () {
    test('모든 노트 목록을 가져와야 한다', () async {
      final List<Note> result =
          await useCase(const NoteOrderType.date(NoteOrder.descending()));

      expect(result, isA<List<Note>>());
      expect(result.length, 2);
    });

    test('정렬 조건에 알맞게 정렬되어야 한다.', () async {
      List<Note> result =
          await useCase(const NoteOrderType.date(NoteOrder.descending()));
      expect(result[0].timestamp > result[1].timestamp, true);

      result = await useCase(const NoteOrderType.date(NoteOrder.ascending()));
      expect(result[0].timestamp > result[1].timestamp, false);

      result = await useCase(const NoteOrderType.title(NoteOrder.descending()));
      expect(result[0].title, 'title2');

      result = await useCase(const NoteOrderType.title(NoteOrder.ascending()));
      expect(result[0].title, 'title');

      result = await useCase(const NoteOrderType.color(NoteOrder.descending()));
      expect(result[0].color > result[1].color, true);

      result = await useCase(const NoteOrderType.color(NoteOrder.ascending()));
      expect(result[0].color > result[1].color, false);
    });
  });
}

class FakeNoteRepository implements NoteRepository {
  @override
  Future<void> deleteNote(Note note) {
    throw UnimplementedError();
  }

  @override
  Future<Result<Note>> getNoteById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes() async {
    return [
      Note(title: 'title', content: 'content', timestamp: 0, color: 1),
      Note(title: 'title2', content: 'content2', timestamp: 2, color: 2),
    ];
  }

  @override
  Future<void> insertNote(Note note) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(Note note) {
    throw UnimplementedError();
  }
}
