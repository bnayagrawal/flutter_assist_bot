// Defines a generic capability

import 'dart:isolate';

import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';

abstract class ICapability {

  bool get requiresTextInput;

  Capability get capability;

  List<String> get messages;

  List<IMedia> get medias;

  List<IAction> get actions;
}

// Capabilities of billy bot
enum Capability {
  WELCOME,
  WHO_IS_BILLY,
  RECIPE_TYPE,
}
