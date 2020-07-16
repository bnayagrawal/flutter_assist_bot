import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/model/iresponse.dart';
import 'package:flutter_assist_bot/page/billy/billy_chat_store.dart';

import 'model/list_model.dart';
import 'widgets/widgets.dart';

class BillyChatPage extends StatefulWidget {
  @override
  _BillyChatPageState createState() => _BillyChatPageState();
}

class _BillyChatPageState extends State<BillyChatPage> {
  // Auto scroll delay and animation duration
  static const int _auto_scroll_delay_millis = 250;
  static const int _auto_scroll_animation_millis = 150;

  final BillyChatStore _store = BillyChatStore();

  // Response event stream subscriber
  StreamSubscription<IResponse> _subscription;

  // List scroll controller
  final ScrollController _scrollController = ScrollController();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel<IResponse> _list;

  @override
  initState() {
    // Setup listeners
    _subscription = _store.responseStream.listen(_handleResponse);
    _list = ListModel<IResponse>(
      listKey: _listKey,
      initialItems: [],
      removedItemBuilder: _buildRemovedItem,
    );
    super.initState();
  }

  // Used to build list items that haven't been removed.
  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return ChatItem(
      animation: animation,
      item: _list[index],
    );
  }

  // Used to build an item after it has been removed from the list. This method is
  // needed because a removed item remains  visible until its animation has
  // completed (even though it's gone as far this ListModel is concerned).
  // The widget will be used by the [AnimatedListState.removeItem] method's
  // [AnimatedListRemovedItemBuilder] parameter.
  Widget _buildRemovedItem(IResponse item, BuildContext context, Animation<double> animation) {
    return ChatItem(
      animation: animation,
      item: item,
    );
  }

  // Insert the "next item" into the list model.
  _handleResponse(IResponse response) {
    // We are reversing the list, so insert at the first position.
    _list.insert(0, response);
    // Scroll to bottom after a few millis
    Timer(
      Duration(milliseconds: _auto_scroll_delay_millis),
      () => _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: _auto_scroll_animation_millis),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  _textReply(String message) {
    // Send to store
    _store.sendUserResponse(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedList(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(vertical: 116),
                key: _listKey,
                initialItemCount: _list.length,
                itemBuilder: _buildItem,
                reverse: true,
                shrinkWrap: true,
              ),
            ),
            Positioned(top: 0, left: 0, right: 0, child: ChatHeaderWidget()),
            Positioned(bottom: 0, left: 0, right: 0, child: ChatTextReplyWidget(_textReply)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    // Dispose listeners
    _subscription?.cancel();
    _store?.dispose();
    super.dispose();
  }
}
