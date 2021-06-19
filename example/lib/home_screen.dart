import 'package:flutter/material.dart';
import 'package:flutter_feed_reaction/flutter_feed_reaction.dart';
import 'package:flutter_feed_reaction/models/feed_reaction_model.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _reactions = [
    FeedReaction(
      name: "Love",
      reaction: Lottie.asset(
        'assets/lottie/heart.json',
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      name: "Care",
      reaction: Lottie.asset(
        'assets/lottie/care.json',
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      name: "Lol",
      reaction: Lottie.asset(
        'assets/lottie/lol.json',
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      name: "Sad",
      reaction: Lottie.asset(
        'assets/lottie/sad.json',
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      name: "Angry",
      reaction: Lottie.asset(
        'assets/lottie/angry.json',
        width: 40.0,
        height: 40.0,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 80.0,
                ),
                _leftAlignmentBuilder(),
                SizedBox(
                  height: 100.0,
                ),
                _centerAlignmentBuilder(),
                SizedBox(
                  height: 100.0,
                ),
                _rightAlignmentBuilder(),
                SizedBox(
                  height: 100.0,
                ),
                _onlyTwoReactions(),
                SizedBox(
                  height: 100.0,
                ),
                _onlyThreeReactions(),
                SizedBox(
                  height: 100.0,
                ),
                _differentWidgetReaction(),
                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _leftAlignmentBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reaction button placed on the left side demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            FlutterFeedReaction(
              reactions: _reactions,
              dragSpace: 50.0,
              onReacted: (val) {
                print(val.name);
              },
              prefix: Image.asset(
                'assets/emojies/none.png',
                width: 40.0,
                height: 40.0,
              ),
              suffix: Text("Like"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _centerAlignmentBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Reaction button placed on the center demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterFeedReaction(
              reactions: _reactions,
              dragSpace: 65.0,
              onReacted: (val) {
                print(val.name);
              },
              prefix: Image.asset(
                'assets/emojies/none.png',
                width: 40.0,
                height: 40.0,
              ),
              suffix: Text("Like"),
              childAnchor: Alignment.topCenter,
              portalAnchor: Alignment.bottomCenter,
            ),
          ],
        ),
      ],
    );
  }

  Widget _rightAlignmentBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Reaction button placed on the right side demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlutterFeedReaction(
              reactions: _reactions,
              dragSpace: 50.0,
              dragStart: 100.0,
              onReacted: (val) {
                print(val.name);
              },
              prefix: Image.asset(
                'assets/emojies/none.png',
                width: 40.0,
                height: 40.0,
              ),
              suffix: Text("Like"),
              childAnchor: Alignment.topRight,
              portalAnchor: Alignment.bottomRight,
            ),
          ],
        ),
      ],
    );
  }

  Widget _onlyTwoReactions() {
    final _twoReactions = _reactions.sublist(0, 2);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Only two reactions demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        FlutterFeedReaction(
          reactions: _twoReactions,
          prefix: Image.asset(
            'assets/emojies/none.png',
            width: 40.0,
            height: 40.0,
          ),
          onReacted: (val) {},
          dragSpace: 50.0,
          containerWidth: 150.0,
        ),
      ],
    );
  }

  Widget _onlyThreeReactions() {
    final _twoReactions = _reactions.sublist(0, 3);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Only three reactions demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        FlutterFeedReaction(
          reactions: _twoReactions,
          prefix: Image.asset(
            'assets/emojies/none.png',
            width: 40.0,
            height: 40.0,
          ),
          onReacted: (val) {},
          dragSpace: 50.0,
          containerWidth: 180.0,
        ),
      ],
    );
  }

  Widget _differentWidgetReaction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Different widget reactions demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        FlutterFeedReaction(
          reactions: [
            FeedReaction(
              name: 'Like',
              reaction: Icon(
                Icons.star,
                size: 35.0,
                color: Colors.blue,
              ),
            ),
            FeedReaction(
              name: 'Love',
              reaction: Icon(
                Icons.star,
                size: 35.0,
                color: Colors.red,
              ),
            ),
            FeedReaction(
              name: 'Care',
              reaction: Icon(
                Icons.star,
                size: 35.0,
                color: Colors.deepPurple,
              ),
            ),
            FeedReaction(
              name: 'Lol',
              reaction: Icon(
                Icons.star,
                size: 35.0,
                color: Colors.yellow,
              ),
            ),
            FeedReaction(
              name: 'Sad',
              reaction: Icon(
                Icons.star,
                size: 35.0,
                color: Colors.green,
              ),
            ),
          ],
          prefix: Icon(
            Icons.star,
            size: 40.0,
          ),
          onReacted: (val) {},
          dragSpace: 50.0,
        ),
      ],
    );
  }
}
