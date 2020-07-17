import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/action/chip_list_action.dart';
import 'package:flutter_assist_bot/core/capability/icapability.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';
import 'package:flutter_assist_bot/core/util/types.dart';

class CapabilityRecipeByCuisine implements ICapability {
  // Unique ID of a capability
  static const Capability _capability = Capability.RECIPE_BY_CUISINE;

  final bool removeActionsOnClick = true;

  Capability get capability => _capability;

  final List<String> messages = const [
    'Okay!',
    'Select your cuisine type to procceed.',
  ];

  // Action callback handle
  final ActionCallback actionCallback;

  final List<IMedia> medias = const [];

  final List<IAction> actions;

  final bool requiresTextInput = false;

  CapabilityRecipeByCuisine(this.actionCallback)
      : this.actions = [
          ChipListAction([
            'Indian',
            'Italian',
            'French',
            'Mexican',
            'Korean',
          ], (cuisine) {
            actionCallback(ActionData(cuisine, Capability.SUGGEST_RECIPE, {'cuisine': cuisine}));
          }),
        ];
}
