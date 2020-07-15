import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/util/types.dart';

class ChatTextReplyWidget extends StatefulWidget {
  final DataCallback callback;

  ChatTextReplyWidget(this.callback);

  @override
  _ChatTextReplyWidgetState createState() => _ChatTextReplyWidgetState();
}

class _ChatTextReplyWidgetState extends State<ChatTextReplyWidget> {
  // Throttle excessive event
  static const int _debounceDurationMillis = 50;

  // Form and text editing controller
  final TextEditingController _textEditingController = TextEditingController();

  // Send button state
  bool _enableButton = false;

  Timer _debounceTimer;

  @override
  void initState() {
    _textEditingController.addListener(() {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(Duration(milliseconds: _debounceDurationMillis), () {
        _updateButtonState(_textEditingController.text);
      });
    });
    super.initState();
  }

  _updateButtonState(String text) {
    setState(() {
      _enableButton = null != text && text.isNotEmpty;
    });
  }

  _clearText() {
    _textEditingController.clear();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.045),
            blurRadius: 16,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: _textEditingController,
              style: TextStyle(fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintStyle: TextStyle(fontWeight: FontWeight.w600, color: Color(0xffB0B9CF)),
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              visualDensity: VisualDensity.compact,
              icon: Icon(Icons.send),
              color: Color(0xff0e8f94),
              disabledColor: Color(0xffB0B9CF),
              onPressed: !_enableButton ? null : () {
                widget.callback(_textEditingController.text);
                _clearText();
              },
            ),
          )
        ],
      ),
    );
  }
}
