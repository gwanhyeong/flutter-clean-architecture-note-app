import 'package:freezed_annotation/freezed_annotation.dart';

import 'note_order.dart';

part 'note_order_type.freezed.dart';

@freezed
class NoteOrderType with _$NoteOrderType {
  const factory NoteOrderType.title(NoteOrder order) = NoteOrderTypeTitle;
  const factory NoteOrderType.date(NoteOrder order) = NoteOrderTypeDate;
  const factory NoteOrderType.color(NoteOrder order) = NoteOrderTypeColor;
}
