import 'package:flutter/cupertino.dart';
import 'package:flutter_assist_bot/core/model/iresponse.dart';

class BotResponse implements IResponse {
  final List<String> messages;
  final List<Widget> medias;
  final List<Widget> actions;
  final bool removeActionsOnClick;

  final DateTime timeStamp;

  BotResponse(this.messages, this.medias, this.actions, this.removeActionsOnClick) : timeStamp = DateTime.now();
}
