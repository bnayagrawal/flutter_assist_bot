
import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';

import 'icapability.dart';

class CapabilityWelcome implements ICapability {

  final List<String> messages = const [
    'Hi! 👋',
    'Are you looking for some recipe?'
  ];

  const CapabilityWelcome();

  final List<IMedia> medias = const [];

  final List<IAction> actions = const [];
}