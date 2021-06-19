# flutter_feed_reaction

A Flutter package providing you with highly customizable reactions list for posts/comments in a Social Media kind of an app.

## Features
- Show custom widgets to display in the reactions list,
- Custom reaction button widget,
- Awesome looking animations for the reactions widget,
- The reaction button can be placed anywhere on the screen,
- The reactions list may contain any number of reactions, there is not restriction in the number of widgets in the list,
- The dragging of the reaction is very precise and most important is that the precision of the reaction focus while dragging can be specified by the developer.

## Basic Example 
```dart
FlutterFeedReaction(
   reactions: [
     FeedReaction(
       name: "Like",
       reaction: Container(
         color: Colors.blue,
         width: 30.0,
         height: 30.0,
       ),
     ),
     FeedReaction(
       name: "Care",
       reaction: Container(
         color: Colors.deepOrange,
         width: 30.0,
         height: 30.0,
       ),
     ),
   ],
   dragSpace: 40.0,
   onReacted: (FeedReaction val) {
     print(val.name);
   },
   prefix: Image.asset(
     'assets/emojies/like_icon.png',
     width: 40.0,
     height: 40.0,
   ),
   suffix: Text("Like"),
   containerWidth: 200.0,
)
```

### Parameters
| parameter | description | default |
| :--- | :--- | :--- |
| reactions | The reactions list to display when long pressed on the [prefix] or [suffix] widget | |
| prefix | The button to be pressed to show the reactions list. When it is long pressed, it will just show the reactions list. When it is short pressed, it will call [onReacted] function with the first item of reactions list | |
| dragSpace | The spacing between each drag. If there are two items in the reactions list then [dragSpace] is the gap between the two items. Eg: If there is dragSpace of 40.0 then after dragging 40px from the first item, the next item will be focused. Similarly after dragging 40px from second item, the third item will be focused and so on. | |
| onReacted | The function that gets called when a reaction is selected. The [onReacted] function is called when the [prefix] or [suffix] widget is pressed or a reaction is selected from the reactions list after [prefix] or [suffix] widget is long pressed. | |
| dragStart | The starting position of the drag. When dragging the reactions, if the dragStart value is 50.0 then the reactions will start to focus only when the drag reach 50px from the left of the screen | 40.0 |
| suffix | The optional widget next to [prefix] widget | null |
| spacing | The spacing between the reactions list container and [prefix]/[suffix] widget | 10.0 |
| containerWidth | The width of the reactions list container | 300.0 |
| childAnchor | The [childAnchor] and [portalAnchor] are the alignments of the reactions list around [prefix] and [suffix] widgets | Alignment.topLeft |
| portalAnchor | The [childAnchor] and [portalAnchor] are the alignments of the reactions list around [prefix] and [suffix] widgets | Alignment.bottomLeft |

### [childAnchor] and [portalAnchor]
```dart 
FlutterFeedReaction(
  childAnchor:Alignment.topRight, 
  portalAnchor: Alignment.bottomLeft,
)
```
What this code means is, this will align the bottom-left of the reactions list widget with the top-right of the [prefix] and [suffix] widget.
<br/>
<hr/>
<br/>

### Other Examples
Implementation with lottie: </br>
Lottie is a mobile library for Android and iOS that parses Adobe After Effects animations exported as json with Bodymovin and renders them natively on mobile! (https://pub.dev/packages/lottie)
```dart
FlutterFeedReaction(
  reactions: [
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
  ],
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
)
```


Full example: 
```dart
import 'package:flutter/material.dart';
import 'package:flutter_feed_reaction/flutter_feed_reaction.dart';
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
          onReacted: (val) {},
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
          onReacted: (val) {},
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

```
