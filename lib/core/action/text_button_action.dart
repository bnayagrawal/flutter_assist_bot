import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/util/types.dart';

class TextButtonAction implements IAction {

  final String actionLabel;

  // Callback
  final VoidCallback callback;

  TextButtonAction(this.actionLabel, this.callback);

  @override
  Widget render() {
    return FlatButton(
      onPressed: callback,
      child: Text(actionLabel),
    );
  }
}
