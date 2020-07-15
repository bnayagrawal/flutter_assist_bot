import 'package:flutter/cupertino.dart';
import 'package:flutter_assist_bot/core/model/iresponse.dart';

class BotResponse implements IResponse {
  final List<String> messages;
  final List<Widget> medias;
  final List<Widget> actions;

  final DateTime timeStamp;

  BotResponse(this.messages, this.medias, this.actions) : timeStamp = DateTime.now();
}
