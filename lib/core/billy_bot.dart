import 'package:flutter/cupertino.dart';
import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/capability/capability_welcome.dart';
import 'package:flutter_assist_bot/core/capability/icapability.dart';
import 'package:flutter_assist_bot/core/model/bot_response.dart';

// Singleton
class BillyBot {
  BillyBotAdapter _adapter;

  BillyBot._privateConstructor();

  static final BillyBot _instance = BillyBot._privateConstructor();

  factory BillyBot(BillyBotAdapter adapter) {
    _instance.adapter = adapter;
    return _instance;
  }

  set adapter(BillyBotAdapter adapter) {
    _adapter = adapter;
  }

  BotResponse welcome() {
    var capability = CapabilityWelcome(_adapter.onAction);
    return _getBotResponse(capability);
  }

  BotResponse processAction(ActionData data) {
    //Todo: Implement
    throw UnimplementedError('processAction');
  }

  BotResponse _getBotResponse(ICapability capability) {
    final List<String> messages = capability.messages;
    final List<Widget> medias = List<Widget>.generate(
      capability.medias.length,
      (index) => capability.medias[index].render(),
    );
    final List<Widget> actions = List<Widget>.generate(
      capability.actions.length,
          (index) => capability.actions[index].render(),
    );
    return BotResponse(messages, medias, actions);
  }
}

abstract class BillyBotAdapter {
  onAction(ActionData actionData);
}
