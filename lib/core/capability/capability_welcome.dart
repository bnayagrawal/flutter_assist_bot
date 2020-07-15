import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/action/text_button_action.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';
import 'package:flutter_assist_bot/core/util/types.dart';

import 'icapability.dart';

class CapabilityWelcome implements ICapability {
  // Unique ID of a capability
  static const Capability _capability = Capability.WELCOME;

  // Action callback handle
  final ActionCallback actionCallback;

  Capability get capability => _capability;

  final List<String> messages = const ['Hi! 👋', 'Are you looking for some recipe?'];

  CapabilityWelcome(this.actionCallback)
      : this.actions = [
          TextButtonAction('Yes', () {
            actionCallback(ActionData('Yes', Capability.RECIPE_TYPE, {}));
          }),
          TextButtonAction('Who is Billy?', () {
            actionCallback(ActionData('Who is Billy?', Capability.WHO_IS_BILLY, {}));
          }),
        ];

  final List<IMedia> medias = const [];

  final List<IAction> actions;

  final bool requiresTextInput = false;
}
