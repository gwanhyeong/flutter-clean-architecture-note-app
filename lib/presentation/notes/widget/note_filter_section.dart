import 'package:flutter/material.dart';
import 'package:note_app/domain/util/note_order.dart';
import 'package:note_app/domain/util/note_order_type.dart';

class NoteFilterSection extends StatelessWidget {
  final NoteOrderType noteOrder;
  final Function(NoteOrderType orderType) onChanged;

  const NoteFilterSection(
      {Key? key, required this.noteOrder, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ...(_buildRadioTile<NoteOrderType>(
              'Date',
              NoteOrderType.date(noteOrder.order),
              noteOrder,
            )),
            ...(_buildRadioTile<NoteOrderType>(
              'Title',
              NoteOrderType.title(noteOrder.order),
              noteOrder,
            )),
            ...(_buildRadioTile<NoteOrderType>(
              'Color',
              NoteOrderType.color(noteOrder.order),
              noteOrder,
            )),
          ],
        ),
        Row(
          children: [
            ...(_buildRadioTile<NoteOrder>(
              'Descending',
              const NoteOrder.descending(),
              noteOrder.order,
            )),
            ...(_buildRadioTile<NoteOrder>(
              'Ascending',
              const NoteOrder.ascending(),
              noteOrder.order,
            )),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildRadioTile<T>(String text, T value, T groupValue) {
    return [
      Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: (T? v) {
          if (v is NoteOrder) {
            onChanged(noteOrder.copyWith(order: (value! as NoteOrder)));
          } else if (v is NoteOrderType) {
            onChanged((value! as NoteOrderType));
          }
        },
      ),
      Text(text)
    ];
  }
}
