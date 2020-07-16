import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/model/user_response.dart';
import 'package:flutter_assist_bot/page/billy/widgets/chat_bubble_widget.dart';

import '../util/date_util.dart' as DateUtil;

class UserResponseWidget extends StatelessWidget {
  final UserResponse _response;

  UserResponseWidget(this._response);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 8),
              child: Center(
                child: Text(
                  DateUtil.getChatTimeStamp(_response.timeStamp),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xffB0B9CF)),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: ChatBubbleWidget.right(
              Text(_response.message, style: TextStyle(color: Colors.white)),
              Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
