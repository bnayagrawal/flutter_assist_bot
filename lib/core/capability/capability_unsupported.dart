
import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/action/text_button_action.dart';
import 'package:flutter_assist_bot/core/capability/icapability.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';
import 'package:flutter_assist_bot/core/util/types.dart';

class CapabilityUnsupported implements ICapability {
  // Unique ID of a capability
  static const Capability _capability = Capability.UNSUPPORTED;

  final bool removeActionsOnClick = true;

  // Action callback handle
  final ActionCallback actionCallback;

  Capability get capability => _capability;

  final List<String> messages = const ['Sorry!\nI did not understand that!', 'Do you need help?'];

  CapabilityUnsupported(this.actionCallback)
      : this.actions = [
    TextButtonAction('Help me!', () {
      actionCallback(ActionData('Help me!', Capability.WELCOME, {}));
    }),
    TextButtonAction('Who is Billy?', () {
      actionCallback(ActionData('Who is Billy?', Capability.WHO_IS_BILLY, {}));
    }),
  ];

  final List<IMedia> medias = const [];

  final List<IAction> actions;

  final bool requiresTextInput = false;
}