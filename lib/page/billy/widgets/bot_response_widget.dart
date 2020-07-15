
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/model/bot_response.dart';
import 'package:flutter_assist_bot/page/billy/widgets/chat_bubble_widget.dart';

class BotResponseWidget extends StatelessWidget {
  BotResponseWidget(this._botResponse);

  final BotResponse _botResponse;

  Widget _buildWidget() {
      return ChatBubbleWidget.left(Text('Hi! 👋, Are you looking for some recipe?'), Color(0xffF5F9FA));
  }

  @override
  Widget build(BuildContext context) => _buildWidget();
}

