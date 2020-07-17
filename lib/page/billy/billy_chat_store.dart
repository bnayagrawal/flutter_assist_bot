import 'dart:async';

import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/billy_bot.dart';
import 'package:flutter_assist_bot/core/model/bot_response.dart';
import 'package:flutter_assist_bot/core/model/iresponse.dart';
import 'package:flutter_assist_bot/core/model/user_response.dart';
import 'package:mobx/mobx.dart';

part 'billy_chat_store.g.dart';

class BillyChatStore = _BillyChatStore with _$BillyChatStore;

abstract class _BillyChatStore with Store implements BillyBotAdapter {

  static const int _simulate_response_delay_millis = 250;

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
    // Add user action message to chat
    _responseStreamController.sink.add(UserResponse(data.actionLabel));
    // Get bot response
    BotResponse response = _getBillyBot().processAction(data);
    // Simulate network response delay
    Future.delayed(Duration(milliseconds: _simulate_response_delay_millis),(){
      _responseStreamController.sink.add(response);
    });
  }

  sendUserResponse(String message) {
    // Add user action message to chat
    _responseStreamController.sink.add(UserResponse(message));
    // todo: Ask billy bot to process user response
  }

  dispose() {
    _responseStreamController?.close();
  }
}