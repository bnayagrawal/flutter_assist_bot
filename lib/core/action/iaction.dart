// Defines a generic action

import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/capability/icapability.dart';

abstract class IAction {
  Widget render();
}

class ActionData {
  final Capability capability;

  final Map<String, dynamic> data;

  const ActionData(this.capability, this.data) : assert(null != capability && null != data);
}
