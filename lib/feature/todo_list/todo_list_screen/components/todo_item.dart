import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (val) => ()),
        Column(
          children: [
            Text('Купить что-то'),
            Text('дата'),
          ],
        ),
        Icon(Icons.info_outline),
      ],
    );
  }
}
