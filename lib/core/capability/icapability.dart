// Defines a generic capability

import 'dart:isolate';

import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';

abstract class ICapability {

  bool get requiresTextInput;

  bool get removeActionsOnClick;

  Capability get capability;

  List<String> get messages;

  List<IMedia> get medias;

  List<IAction> get actions;
}

// Capabilities of billy bot
enum Capability {
  UNSUPPORTED,
  WELCOME,
  WHO_IS_BILLY,
  RECIPE_SEARCH_BY,
  RECIPE_BY_CUISINE,
  RECIPE_BY_TYPE,
}
