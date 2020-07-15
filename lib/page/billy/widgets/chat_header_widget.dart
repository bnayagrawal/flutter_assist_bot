
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_assist_bot/util/assets.dart' as Assets;

class ChatHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
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
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange[100],
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: 16),
            child: Image(
              image: AssetImage(Assets.image_asset_robot),
              height: 32,
              width: 32,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Billy',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              Text(
                'Food Recipe Assistant',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xffB0B9CF),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
