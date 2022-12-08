import 'package:flutter/material.dart';

class FeedReaction {
  final int id;
  final Widget header;
  final Widget reaction;

  FeedReaction({
    required this.id,
    required this.header,
    required this.reaction,
  });
}
