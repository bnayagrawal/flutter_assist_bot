import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/model/bot_response.dart';
import 'package:flutter_assist_bot/page/billy/widgets/chat_bubble_widget.dart';
import 'package:flutter_assist_bot/util/assets.dart' as Assets;

import '../util/date_util.dart' as DateUtil;

class BotResponseWidget extends StatefulWidget {
  BotResponseWidget(this._botResponse);

  final BotResponse _botResponse;

  @override
  _BotResponseWidgetState createState() => _BotResponseWidgetState();
}

class _BotResponseWidgetState extends State<BotResponseWidget> {

  @override
  void initState() {
    super.initState();
  }

  Widget _buildWidget() {
    // Build messages
    final List<Widget> messages = [];
    int index = 0;
    for (String message in widget._botResponse.messages) {
      if (index > 0)
        messages.add(
          ChatBubbleWidget.round(
              Text(
                message,
                style: TextStyle(color: Colors.deepPurple[800]),
              ),
              Colors.deepPurple[50]),
        );
      else
        messages.add(
          ChatBubbleWidget.left(
              Text(
                message,
                style: TextStyle(color: Colors.deepPurple[800]),
              ),
              Colors.deepPurple[50]),
        );
      index++;
    }

    // Build layout and return
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple[50],
          ),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(left: 16, right: 8),
          child: Image(
            image: AssetImage(Assets.image_asset_robot),
            height: 18,
            width: 18,
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: messages,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                      child: Center(
                        child: Text(
                          DateUtil.getChatTimeStamp(widget._botResponse.timeStamp),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffB0B9CF),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: widget._botResponse.actions,
                    ),
                  ),
                  Expanded(flex: 1, child: SizedBox()),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => _buildWidget();
}
