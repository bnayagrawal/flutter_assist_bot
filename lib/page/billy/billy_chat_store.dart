import 'dart:async';

import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/billy_bot.dart';
import 'package:flutter_assist_bot/core/model/bot_response.dart';
import 'package:flutter_assist_bot/core/model/iresponse.dart';
import 'package:mobx/mobx.dart';

part 'billy_chat_store.g.dart';

class BillyChatStore = _BillyChatStore with _$BillyChatStore;

abstract class _BillyChatStore with Store implements BillyBotAdapter {

  _BillyChatStore() {
    BotResponse response = _getBillyBot().welcome();
    _responseStreamController.sink.add(response);
  }

  BillyBot _billyBot;

  BillyBot _getBillyBot() {
    _billyBot = _billyBot ?? BillyBot(this);
    return _billyBot;
  }

  final StreamController<IResponse> _responseStreamController = StreamController<IResponse>();
  // Can only be listened to once
  Stream<IResponse> get responseStream => _responseStreamController.stream;

  @override
  onAction(ActionData data) {
    _getBillyBot().processAction(data);
  }

  dispose() {
    _responseStreamController?.close();
  }
}