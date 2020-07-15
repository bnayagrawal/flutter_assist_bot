import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assist_bot/core/model/bot_response.dart';
import 'package:flutter_assist_bot/core/model/iresponse.dart';
import 'package:flutter_assist_bot/core/model/user_response.dart';
import 'package:flutter_assist_bot/page/billy/billy_chat_store.dart';

import 'widgets/widgets.dart';

class BillyChatPage extends StatefulWidget {
  @override
  _BillyChatPageState createState() => _BillyChatPageState();
}

class _BillyChatPageState extends State<BillyChatPage> {
  final BillyChatStore _store = BillyChatStore();

  // Response event stream subscriber
  StreamSubscription<IResponse> _subscription;

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
    _list.insert(_list.length, response);
  }

  _renderBotResponse(BotResponse response) {}

  _renderUserResponse(UserResponse userResponse) {}

  _textReply<String>(String text) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AnimatedList(
              padding: EdgeInsets.only(top: 108, bottom: 64),
              key: _listKey,
              initialItemCount: _list.length,
              itemBuilder: _buildItem,
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ChatHeaderWidget(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ChatTextReplyWidget(_textReply),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose listeners
    _subscription?.cancel();
    _store?.dispose();
    super.dispose();
  }
}

/// Keeps a Dart List in sync with an AnimatedList.
///
/// The [insert] and [removeAt] methods apply to both the internal list and the
/// animated list that belongs to [listKey].
///
/// This class only exposes as much of the Dart List API as is needed by the
/// sample app. More list methods are easily added, however methods that mutate the
/// list must make the same changes to the animated list in terms of
/// [AnimatedListState.insertItem] and [AnimatedList.removeItem].
class ListModel<E> {
  ListModel({
    @required this.listKey,
    @required this.removedItemBuilder,
    Iterable<E> initialItems,
  })  : assert(listKey != null),
        assert(removedItemBuilder != null),
        _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final dynamic removedItemBuilder;
  final List<E> _items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
        return removedItemBuilder(removedItem, context, animation);
      });
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

/// Displays its integer item as 'item N' on a Card whose color is based on
/// the item's value. The text is displayed in bright green if selected is true.
/// This widget's height is based on the animation parameter, it varies
/// from 0 to 128 as the animation varies from 0.0 to 1.0.
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
  Widget build(BuildContext context) => _buildChatItem();
}
