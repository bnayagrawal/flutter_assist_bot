import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/action/text_button_action.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';
import 'package:flutter_assist_bot/core/util/types.dart';

import 'icapability.dart';

class CapabilityWelcome implements ICapability {
  // Unique ID of a capability
  static const Capability _capability = Capability.WELCOME;

  final bool removeActionsOnClick = true;

  // Action callback handle
  final ActionCallback actionCallback;

  Capability get capability => _capability;

  final List<String> messages = const ['Hi! 👋', 'Are you looking for some recipe?'];

  CapabilityWelcome(this.actionCallback)
      : this.actions = [
          TextButtonAction('Suggest Recipe!', () {
            actionCallback(ActionData('Suggest Recipe!', Capability.RECIPE_SEARCH_BY, {}));
          }),
          TextButtonAction('Who is Billy?', () {
            actionCallback(ActionData('Who is Billy?', Capability.WHO_IS_BILLY, {}));
          }),
        ];

  final List<IMedia> medias = const [];

  final List<IAction> actions;

  final bool requiresTextInput = false;
}
