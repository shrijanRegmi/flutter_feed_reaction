import 'package:flutter/material.dart';
import 'package:flutter_feed_reaction/flutter_feed_reaction.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Example",
      debugShowCheckedModeBanner: false,
      home: Material(
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _reactions = [
    FeedReaction(
      id: 0,
      header: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black.withOpacity(0.6),
        ),
        padding: EdgeInsets.only(
          left: 7.0,
          right: 7.0,
          top: 2.0,
          bottom: 2.0,
        ),
        margin: EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Love",
          style: TextStyle(fontSize: 8.0, color: Colors.white),
        ),
      ),
      reaction: Lottie.asset(
        'assets/lottie/heart.json',
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      id: 1,
      header: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black.withOpacity(0.6),
        ),
        padding: EdgeInsets.only(
          left: 7.0,
          right: 7.0,
          top: 2.0,
          bottom: 2.0,
        ),
        margin: EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Care",
          style: TextStyle(fontSize: 8.0, color: Colors.white),
        ),
      ),
      reaction: Lottie.asset(
        'assets/lottie/care.json',
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      id: 2,
      header: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black.withOpacity(0.6),
        ),
        padding: EdgeInsets.only(
          left: 7.0,
          right: 7.0,
          top: 2.0,
          bottom: 2.0,
        ),
        margin: EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Lol",
          style: TextStyle(fontSize: 8.0, color: Colors.white),
        ),
      ),
      reaction: Lottie.asset(
        'assets/lottie/lol.json',
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      id: 3,
      header: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black.withOpacity(0.6),
        ),
        padding: EdgeInsets.only(
          left: 7.0,
          right: 7.0,
          top: 2.0,
          bottom: 2.0,
        ),
        margin: EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Sad",
          style: TextStyle(fontSize: 8.0, color: Colors.white),
        ),
      ),
      reaction: Lottie.asset(
        'assets/lottie/sad.json',
        width: 40.0,
        height: 40.0,
      ),
    ),
    FeedReaction(
      id: 4,
      header: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black.withOpacity(0.6),
        ),
        padding: EdgeInsets.only(
          left: 7.0,
          right: 7.0,
          top: 2.0,
          bottom: 2.0,
        ),
        margin: EdgeInsets.only(bottom: 8.0),
        child: Text(
          "Angry",
          style: TextStyle(fontSize: 8.0, color: Colors.white),
        ),
      ),
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

  // When the reaction button is place on the left most side of the screen
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
              onReactionSelected: (val) {
                print(val.id);
              },
              onPressed: () {
                print("Pressed");
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

  // When the reaction button is place on the center of the screen
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
              onReactionSelected: (val) {
                print(val.id);
              },
              onPressed: () {
                print("Pressed");
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

  // When the reaction button is place on the right most side of the screen
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
              onReactionSelected: (val) {
                print(val.id);
              },
              onPressed: () {
                print("Pressed");
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

  // When only two reactions are used
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
          onReactionSelected: (val) {
            print(val.id);
          },
          onPressed: () {
            print("Pressed");
          },
          dragSpace: 50.0,
          containerWidth: 150.0,
        ),
      ],
    );
  }

  // When only three reactions are used
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
          onReactionSelected: (val) {
            print(val.id);
          },
          onPressed: () {
            print("Pressed");
          },
          dragSpace: 50.0,
          containerWidth: 180.0,
        ),
      ],
    );
  }

  // When different widget is used as reactions
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
              id: 0,
              header: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.6),
                ),
                padding: EdgeInsets.only(
                  left: 7.0,
                  right: 7.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Like",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
              ),
              reaction: Icon(
                Icons.star,
                size: 35.0,
                color: Colors.blue,
              ),
            ),
            FeedReaction(
              id: 1,
              header: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.6),
                ),
                padding: EdgeInsets.only(
                  left: 7.0,
                  right: 7.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Love",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
              ),
              reaction: Icon(
                Icons.star,
                size: 35.0,
                color: Colors.red,
              ),
            ),
            FeedReaction(
              id: 2,
              header: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.6),
                ),
                padding: EdgeInsets.only(
                  left: 7.0,
                  right: 7.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Care",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
              ),
              reaction: Icon(
                Icons.star,
                size: 35.0,
                color: Colors.deepPurple,
              ),
            ),
            FeedReaction(
              id: 3,
              header: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.6),
                ),
                padding: EdgeInsets.only(
                  left: 7.0,
                  right: 7.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Lol",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
              ),
              reaction: Icon(
                Icons.star,
                size: 35.0,
                color: Colors.yellow,
              ),
            ),
            FeedReaction(
              id: 4,
              header: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.6),
                ),
                padding: EdgeInsets.only(
                  left: 7.0,
                  right: 7.0,
                  top: 2.0,
                  bottom: 2.0,
                ),
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Sad",
                  style: TextStyle(fontSize: 8.0, color: Colors.white),
                ),
              ),
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
          onReactionSelected: (val) {
            print(val.id);
          },
          onPressed: () {
            print("Pressed");
          },
          dragSpace: 50.0,
        ),
      ],
    );
  }
}
