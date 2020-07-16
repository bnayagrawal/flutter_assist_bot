
import 'dart:isolate';

import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';

import 'icapability.dart';

class CapabilityWhoIsBilly implements ICapability {

  // Unique ID of a capability
  static const Capability _capability = Capability.WHO_IS_BILLY;

  Capability get capability => _capability;

  final bool removeActionsOnClick = true;

  final List<String> messages = const [
    'Good Question! 💡',
    'I am Billy, an assistant bot! 🤖',
    'I can assist you on getting the food recipe you want!'
  ];

  const CapabilityWhoIsBilly();

  final List<IMedia> medias = const [];

  final List<IAction> actions = const [

  ];

  final bool requiresTextInput = false;
}