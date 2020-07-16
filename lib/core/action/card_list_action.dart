import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/action/iaction.dart';

class CardListAction implements IAction {
  static const double _card_item_width = 96;

  final List<String> items;
  final Function(String) callback;

  CardListAction(this.items, this.callback);

  @override
  Widget render() {
    // Build cards
    final List<Widget> cards = [];
    for (String item in items) {
      cards.add(
        Container(
          width: _card_item_width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.deepPurple[50],
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(0, 1),
              )
            ],
          ),
          margin: EdgeInsets.only(right: 6),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => callback(item),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    item,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.deepPurple[800],
                      fontSize: 14.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(4),
        child: IntrinsicHeight(
          child: Row(
            children: cards,
          ),
        ),
      ),
    );
  }
}
