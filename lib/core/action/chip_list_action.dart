import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/action/iaction.dart';

class ChipListAction implements IAction {
  final List<String> items;
  final Function(String) callback;

  ChipListAction(this.items, this.callback);

  @override
  Widget render() {
    // Build cards
    final List<Widget> chips = [];
    for (String item in items) {
      chips.add(
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: ActionChip(
            onPressed: () => callback(item),
            label: Text(item, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.deepPurple)),
            backgroundColor: Colors.white,
            pressElevation: 2,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.deepPurple[50]),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      );
    }

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: chips,
        ),
      ),
    );
  }
}
