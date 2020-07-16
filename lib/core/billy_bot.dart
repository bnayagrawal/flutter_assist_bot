import 'package:flutter/cupertino.dart';
import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/capability/capabilities.dart';
import 'package:flutter_assist_bot/core/model/bot_response.dart';

import 'capability/capability_who_is_billy.dart';

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
    switch (data.capability) {
      case Capability.WELCOME:
        return _getBotResponse(CapabilityWelcome(_adapter.onAction));
        break;
      case Capability.WHO_IS_BILLY:
        return _getBotResponse(CapabilityWhoIsBilly());
        break;
      case Capability.RECIPE_SEARCH_BY:
        return _getBotResponse(CapabilityRecipeSearchBy(_adapter.onAction));
        break;
      case Capability.RECIPE_BY_CUISINE:
        return _getBotResponse(CapabilityRecipeByCuisine(_adapter.onAction));
        break;
      case Capability.RECIPE_BY_TYPE:
        return _getBotResponse(CapabilityRecipeByType(_adapter.onAction));
        break;
      default:
        return _getBotResponse(CapabilityUnsupported(_adapter.onAction));
        break;
    }
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
    return BotResponse(messages, medias, actions, capability.removeActionsOnClick);
  }
}

abstract class BillyBotAdapter {
  onAction(ActionData actionData);
}
