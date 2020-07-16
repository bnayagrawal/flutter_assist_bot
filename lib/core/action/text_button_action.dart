import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/action/iaction.dart';

class TextButtonAction implements IAction {
  final String actionLabel;

  // Callback
  final VoidCallback callback;

  TextButtonAction(this.actionLabel, this.callback);

  @override
  Widget render() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orange[100]),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: callback,
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                actionLabel,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
