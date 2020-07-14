
import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/capability/icapability.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';

class CapabilityRecipeType implements ICapability {

  // Unique ID of a capability
  static const Capability _capability = Capability.RECIPE_TYPE;

  Capability get capability => _capability;

  final List<String> messages = const [
    'Thats great! 😃',
    'Select your recipe type to procceed.',
  ];

  final List<IMedia> medias = const [];

  final List<IAction> actions = const [];

  final bool requiresTextInput = false;
}