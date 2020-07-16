
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatBubbleWidget {
  ChatBubbleWidget._();

  // Bubble radius
  static const double _corner_radius = 24;

  static Widget round(Widget child, Color bubbleColor) => _buildBubble(_shape.ROUND, child, bubbleColor);

  static Widget left(Widget child, Color bubbleColor) => _buildBubble(_shape.LEFT, child, bubbleColor);

  static Widget right(Widget child, Color bubbleColor) => _buildBubble(_shape.RIGHT, child, bubbleColor);

  static Widget _buildBubble(_shape shape, Widget child, Color bubbleColor) {
    final double leftRadius = shape == _shape.LEFT ? 0 : _corner_radius;
    final double rightRadius = shape == _shape.RIGHT ? 0 : _corner_radius;
    return Container(
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(leftRadius),
          topRight: Radius.circular(rightRadius),
          bottomLeft: Radius.circular(_corner_radius),
          bottomRight: Radius.circular(_corner_radius),
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: EdgeInsets.only(bottom: 8),
      child: child,
    );
  }
}

enum _shape {
  LEFT, RIGHT, ROUND,
}
