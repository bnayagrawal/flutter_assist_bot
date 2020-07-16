
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/model/bot_response.dart';
import 'package:flutter_assist_bot/core/model/iresponse.dart';
import 'package:flutter_assist_bot/core/model/user_response.dart';

import 'bot_response_widget.dart';
import 'user_response_widget.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({Key key, @required this.animation, @required this.item})
      : assert(animation != null),
        assert(item != null),
        super(key: key);

  final Animation<double> animation;
  final IResponse item;

  _buildChatItem() {
    // Check response type
    if (item is BotResponse) {
      return BotResponseWidget(item);
    } else if (item is UserResponse) {
      return UserResponseWidget(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: _buildChatItem(),
    );
  }
}
