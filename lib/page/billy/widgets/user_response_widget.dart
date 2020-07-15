
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/model/user_response.dart';
import 'package:flutter_assist_bot/page/billy/widgets/chat_bubble_widget.dart';

class UserResponseWidget extends StatelessWidget {

  final UserResponse _response;

  UserResponseWidget(this._response);

  @override
  Widget build(BuildContext context) {
    return ChatBubbleWidget.right(Text(_response.message), Colors.teal);
  }
}
