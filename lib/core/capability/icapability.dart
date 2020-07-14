// Defines a generic capability

import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';

abstract class ICapability {

  List<String> get messages;

  List<IMedia> get medias;

  List<IAction> get actions;
}