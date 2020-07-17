import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/action/text_button_action.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';
import 'package:flutter_assist_bot/core/util/types.dart';
import 'package:flutter_assist_bot/core/capability/capabilities.dart';

class CapabilitySuggestRecipe implements ICapability {
  // Unique ID of a capability
  static const Capability _capability = Capability.SUGGEST_RECIPE;

  final bool removeActionsOnClick = false;

  // Action callback handle
  final ActionCallback actionCallback;

  Capability get capability => _capability;

  final List<String> messages = const ['All right!', 'Looking for recipes!'];

  CapabilitySuggestRecipe(this.actionCallback, Map<String, dynamic> data)
      : this.actions = [
    TextButtonAction('What\'s this!', () {
      // todo: fetch recipe
      actionCallback(ActionData('What\'s this!', Capability.UNSUPPORTED, {}));
    }),
  ];

  final List<IMedia> medias = const [];

  final List<IAction> actions;

  final bool requiresTextInput = false;
}