
import 'package:flutter_assist_bot/core/action/iaction.dart';
import 'package:flutter_assist_bot/core/action/text_button_action.dart';
import 'package:flutter_assist_bot/core/capability/icapability.dart';
import 'package:flutter_assist_bot/core/media/image_asset_media.dart';
import 'package:flutter_assist_bot/core/media/imedia.dart';

import 'package:flutter_assist_bot/core/util/types.dart';
import 'package:flutter_assist_bot/util/assets.dart' as Assets;

class CapabilityRecipeSearchBy implements ICapability {
  // Unique ID of a capability
  static const Capability _capability = Capability.RECIPE_SEARCH_BY;

  final bool removeActionsOnClick = true;

  // Action callback handle
  final ActionCallback actionCallback;

  Capability get capability => _capability;

  final List<String> messages = const ['That\'s great! 😃', 'Suggest recipe by?'];

  CapabilityRecipeSearchBy(this.actionCallback)
      : this.actions = [
    TextButtonAction('Recipe By Cuisine', () {
      actionCallback(ActionData('Recipe By Cuisine', Capability.RECIPE_BY_CUISINE, {}));
    }),
    TextButtonAction('Recipe By Type', () {
      actionCallback(ActionData('Recipe By Type', Capability.RECIPE_BY_TYPE, {}));
    }),
  ];

  final List<IMedia> medias = [
    ImageAssetMedia(Assets.food_suggest_gif),
  ];

  final List<IAction> actions;

  final bool requiresTextInput = false;
}
