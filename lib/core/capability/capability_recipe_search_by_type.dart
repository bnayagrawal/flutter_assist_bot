
import 'package:flutter_assist_bot/core/action/card_list_action.dart';
import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/capability/icapability.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';
import 'package:flutter_assist_bot/core/util/types.dart';

class CapabilityRecipeByType implements ICapability {

  // Unique ID of a capability
  static const Capability _capability = Capability.RECIPE_BY_TYPE;

  final bool removeActionsOnClick = true;

  Capability get capability => _capability;

  final List<String> messages = const [
    'Okay!',
    'Select your recipe type to procceed.',
  ];

  // Action callback handle
  final ActionCallback actionCallback;

  final List<IMedia> medias = const [];

  final List<IAction> actions;

  final bool requiresTextInput = false;

  CapabilityRecipeByType(this.actionCallback)
      : this.actions = [
    CardListAction([
      'Snack',
      'Main course',
      'Beverage',
      'Dessert',
      'Side dish',
      'Salad',
    ], (type) {
      actionCallback(ActionData(type, Capability.SUGGEST_RECIPE, {'type': type}));
    }),
  ];
}