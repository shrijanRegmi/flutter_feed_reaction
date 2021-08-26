import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_feed_reaction/models/feed_reaction_model.dart';
import 'package:flutter_portal/flutter_portal.dart';

/// The [FlutterFeedReaction] widget displays reactions list.
///
/// The [reactions] parameter must not be null.
/// The [prefix] parameter must not be null.
/// The [onReactionSelected] parameter must not be null.
/// The [onPressed] parameter must not be null.
/// The [dragSpace] parameter must not be null
///
/// This example shows the basic implementation of [FlutterFeedReaction] widget.
/// ```dart
/// FlutterFeedReaction(
///   reactions: [
///     FeedReaction(
///       name: "Like",
///       reaction: Container(
///         color: Colors.blue,
///         width: 30.0,
///         height: 30.0,
///       ),
///     ),
///     FeedReaction(
///       name: "Care",
///       reaction: Container(
///         color: Colors.deepOrange,
///         width: 30.0,
///         height: 30.0,
///       ),
///     ),
///   ],
///   dragSpace: 40.0,
///   onReactionSelected: (val) {
///     print(val.name);
///   },
///   onPressed: () {
///     print("Pressed");
///   },
///   prefix: Image.asset(
///     'assets/emojies/like_icon.png',
///     width: 40.0,
///     height: 40.0,
///   ),
///   suffix: Text("Like"),
///   containerWidth: 200.0,
/// )
/// ```
class FlutterFeedReaction extends StatefulWidget {
  @override
  _FlutterFeedReactionState createState() => _FlutterFeedReactionState();

  FlutterFeedReaction({
    required this.reactions,
    required this.prefix,
    required this.onReactionSelected,
    required this.dragSpace,
    required this.onPressed,
    this.dragStart = 40.0,
    this.suffix,
    this.spacing = 10.0,
    this.containerWidth = 300.0,
    this.childAnchor = Alignment.topLeft,
    this.portalAnchor = Alignment.bottomLeft,
  });

  /// The reactions list to display when long pressed on the [prefix] or [suffix] widget.
  ///
  /// The [reactions] parameter must not be null.
  final List<FeedReaction> reactions;

  /// The button to be pressed to show the reactions list.
  ///
  /// When it is long pressed, it will just show the reactions list.
  /// When it is short pressed, it will call [onPressed] function.
  ///
  /// The [prefix] parameter must not be null.
  final Widget prefix;

  /// The optional widget next to [prefix] widget.
  final Widget? suffix;

  /// The spacing between each drag.
  ///
  /// If there are two items in the reactions list then [dragSpace] is the gap
  /// between the two items. Eg: If there is dragSpace of 40.0 then after dragging
  /// 40px from the first item, the next item will be focused. Similarly after
  /// dragging 40px from second item, the third item will be focused and so on.
  ///
  /// The [dragSpace] parameter must not be null.
  final double dragSpace;

  /// The starting position of the drag.
  ///
  /// When dragging the reactions, if the dragStart value is 50.0 then the
  /// reactions will start to focus only when the drag reach 50px from the left of the screen.
  ///
  /// When not specified, [dragStart] defaults to 40.0.
  final double dragStart;

  /// The [childAnchor] and [portalAnchor] are the alignments of the reactions
  /// list around [prefix] and [suffix] widgets.
  ///
  /// ```dart
  /// FlutterFeedReaction(
  ///   childAnchor: Alignment.topRight,
  ///   portalAnchor: Alignment.bottomLeft,
  /// )
  /// ```
  /// What this code means is, this will align the bottom-left of the reactions
  /// list widget with the top-right of the [prefix] and [suffix] widget.
  ///
  /// When not specified [childAnchor] defaults to [Alignment.topLeft].
  final Alignment childAnchor;

  /// The [childAnchor] and [portalAnchor] are the alignments of the reactions
  /// list around [prefix] and [suffix] widgets.
  ///
  /// ```dart
  /// FlutterFeedReaction(
  ///   childAnchor: Alignment.topRight,
  ///   portalAnchor: Alignment.bottomLeft,
  /// )
  /// ```
  /// What this code means is, this will align the bottom-left of the reactions
  /// list widget with the top-right of the [prefix] and [suffix] widget.
  ///
  /// When not specified [portalAnchor] defaults to [Alignment.bottomLeft].
  final Alignment portalAnchor;

  /// The function that gets called when a reaction is selected.
  ///
  /// The [onReactionSelected] function is called when a reaction is selected
  /// from the reactions list after [prefix] or [suffix] widget is long pressed.
  ///
  ///  The [onReactionSelected] parameter must not be null.
  final Function(FeedReaction) onReactionSelected;

  /// The function that gets called when the prefix or widget is pressed.
  ///
  /// The [onPressed] function is called when the [prefix] or [suffix] widget is
  /// pressed.
  ///
  ///  The [onPressed] parameter must not be null.
  final Function() onPressed;

  /// The spacing between the reactions list container and [prefix]/[suffix] widget.
  ///
  /// When not specified, [spacing] defaults to 10.0.
  final double spacing;

  /// The width of the reactions list container.
  ///
  /// When not specified, [containerWidth] defaults to 300.0.
  final double containerWidth;
}

class _FlutterFeedReactionState extends State<FlutterFeedReaction>
    with TickerProviderStateMixin {
  int durationAnimationBox = 500;
  int durationAnimationBtnLongPress = 150;
  int durationAnimationBtnShortPress = 500;
  int durationAnimationIconWhenDrag = 150;
  int durationAnimationIconWhenRelease = 1000;

  // For long press btn
  late AnimationController animControlBtnLongPress, animControlBox;
  late Animation zoomIconLikeInBtn, tiltIconLikeInBtn, zoomTextLikeInBtn;
  late Animation fadeInBox;
  late Animation moveRightGroupIcon;
  late Animation pushIconLikeUp;
  late Animation zoomIconLike;

  // For short press btn
  late AnimationController animControlBtnShortPress;
  late Animation zoomIconLikeInBtn2, tiltIconLikeInBtn2;

  // For zoom icon when drag
  late AnimationController animControlIconWhenDrag;
  late AnimationController animControlIconWhenDragInside;
  late AnimationController animControlIconWhenDragOutside;
  late AnimationController animControlBoxWhenDragOutside;
  late Animation zoomIconChosen, zoomIconNotChosen;
  late Animation zoomIconWhenDragOutside;
  late Animation zoomIconWhenDragInside;
  late Animation zoomBoxWhenDragOutside;
  late Animation zoomBoxIcon;

  // For jump icon when release
  late AnimationController animControlIconWhenRelease;
  late Animation zoomIconWhenRelease, moveUpIconWhenRelease;
  late Animation moveLeftIconLikeWhenRelease,
      moveLeftIconLoveWhenRelease,
      moveLeftIconHahaWhenRelease,
      moveLeftIconWowWhenRelease,
      moveLeftIconSadWhenRelease,
      moveLeftIconAngryWhenRelease;

  Duration durationLongPress = Duration(milliseconds: 250);
  late Timer holdTimer;
  bool isLongPress = false;
  bool isLiked = false;

  int whichIconUserChoose = 0;

  int currentIconFocus = -1;
  int previousIconFocus = 0;
  bool isDragging = false;
  bool isDraggingOutside = false;
  bool isJustDragInside = true;

  @override
  void initState() {
    super.initState();

    // like btn
    _initAnimationBtnLike();

    // Box and Emoji
    _initAnimationBoxAndIcons();

    // Emoji when drag
    _initAnimationIconWhenDrag();

    // Emoji when drag outside
    _initAnimationIconWhenDragOutside();

    // Emoji when drag outside
    _initAnimationBoxWhenDragOutside();

    // Emoji when first drag
    _initAnimationIconWhenDragInside();

    // Emoji when release
    _initAnimationIconWhenRelease();
  }

  void _initAnimationBtnLike() {
    // long press
    animControlBtnLongPress = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: durationAnimationBtnLongPress));
    zoomIconLikeInBtn =
        Tween(begin: 1.0, end: 0.85).animate(animControlBtnLongPress);
    tiltIconLikeInBtn =
        Tween(begin: 0.0, end: 0.2).animate(animControlBtnLongPress);
    zoomTextLikeInBtn =
        Tween(begin: 1.0, end: 0.85).animate(animControlBtnLongPress);

    zoomIconLikeInBtn.addListener(() {
      setState(() {});
    });
    tiltIconLikeInBtn.addListener(() {
      setState(() {});
    });
    zoomTextLikeInBtn.addListener(() {
      setState(() {});
    });

    // short press
    animControlBtnShortPress = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: durationAnimationBtnShortPress));
    zoomIconLikeInBtn2 =
        Tween(begin: 1.0, end: 0.2).animate(animControlBtnShortPress);
    tiltIconLikeInBtn2 =
        Tween(begin: 0.0, end: 0.8).animate(animControlBtnShortPress);

    zoomIconLikeInBtn2.addListener(() {
      setState(() {});
    });
    tiltIconLikeInBtn2.addListener(() {
      setState(() {});
    });
  }

  void _initAnimationBoxAndIcons() {
    animControlBox = AnimationController(
        vsync: this, duration: Duration(milliseconds: durationAnimationBox));

    // General
    moveRightGroupIcon = Tween(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: animControlBox, curve: Interval(0.0, 1.0)),
    );
    moveRightGroupIcon.addListener(() {
      setState(() {});
    });

    // Box
    fadeInBox = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animControlBox, curve: Interval(0.7, 1.0)),
    );
    fadeInBox.addListener(() {
      setState(() {});
    });

    // Emoji
    pushIconLikeUp = Tween(begin: 10.0, end: 15.0).animate(
      CurvedAnimation(parent: animControlBox, curve: Interval(0.0, 0.5)),
    );
    zoomIconLike = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animControlBox, curve: Interval(0.0, 0.5)),
    );

    pushIconLikeUp.addListener(() {
      setState(() {});
    });
    zoomIconLike.addListener(() {
      setState(() {});
    });
  }

  void _initAnimationIconWhenDrag() {
    animControlIconWhenDrag = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: durationAnimationIconWhenDrag));

    zoomIconChosen =
        Tween(begin: 1.0, end: 1.8).animate(animControlIconWhenDrag);
    zoomIconNotChosen =
        Tween(begin: 1.0, end: 0.8).animate(animControlIconWhenDrag);
    zoomBoxIcon =
        Tween(begin: 50.0, end: 40.0).animate(animControlIconWhenDrag);

    zoomIconChosen.addListener(() {
      setState(() {});
    });
    zoomIconNotChosen.addListener(() {
      setState(() {});
    });
    zoomBoxIcon.addListener(() {
      setState(() {});
    });
  }

  void _initAnimationIconWhenDragOutside() {
    animControlIconWhenDragOutside = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: durationAnimationIconWhenDrag));
    zoomIconWhenDragOutside =
        Tween(begin: 0.8, end: 1.0).animate(animControlIconWhenDragOutside);
    zoomIconWhenDragOutside.addListener(() {
      setState(() {});
    });
  }

  void _initAnimationBoxWhenDragOutside() {
    animControlBoxWhenDragOutside = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: durationAnimationIconWhenDrag));
    zoomBoxWhenDragOutside =
        Tween(begin: 40.0, end: 50.0).animate(animControlBoxWhenDragOutside);
    zoomBoxWhenDragOutside.addListener(() {
      setState(() {});
    });
  }

  void _initAnimationIconWhenDragInside() {
    animControlIconWhenDragInside = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: durationAnimationIconWhenDrag));
    zoomIconWhenDragInside =
        Tween(begin: 1.0, end: 0.8).animate(animControlIconWhenDragInside);
    zoomIconWhenDragInside.addListener(() {
      setState(() {});
    });
    animControlIconWhenDragInside.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isJustDragInside = false;
      }
    });
  }

  void _initAnimationIconWhenRelease() {
    animControlIconWhenRelease = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: durationAnimationIconWhenRelease));

    zoomIconWhenRelease = Tween(begin: 1.8, end: 0.0).animate(CurvedAnimation(
        parent: animControlIconWhenRelease, curve: Curves.decelerate));

    moveUpIconWhenRelease = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animControlIconWhenRelease, curve: Curves.decelerate));

    moveLeftIconLikeWhenRelease = Tween(begin: 20.0, end: 10.0).animate(
        CurvedAnimation(
            parent: animControlIconWhenRelease, curve: Curves.decelerate));
    moveLeftIconLoveWhenRelease = Tween(begin: 68.0, end: 10.0).animate(
        CurvedAnimation(
            parent: animControlIconWhenRelease, curve: Curves.decelerate));
    moveLeftIconHahaWhenRelease = Tween(begin: 116.0, end: 10.0).animate(
        CurvedAnimation(
            parent: animControlIconWhenRelease, curve: Curves.decelerate));
    moveLeftIconWowWhenRelease = Tween(begin: 164.0, end: 10.0).animate(
        CurvedAnimation(
            parent: animControlIconWhenRelease, curve: Curves.decelerate));
    moveLeftIconSadWhenRelease = Tween(begin: 212.0, end: 10.0).animate(
        CurvedAnimation(
            parent: animControlIconWhenRelease, curve: Curves.decelerate));
    moveLeftIconAngryWhenRelease = Tween(begin: 260.0, end: 10.0).animate(
        CurvedAnimation(
            parent: animControlIconWhenRelease, curve: Curves.decelerate));

    zoomIconWhenRelease.addListener(() {
      setState(() {});
    });
    moveUpIconWhenRelease.addListener(() {
      setState(() {});
    });

    moveLeftIconLikeWhenRelease.addListener(() {
      setState(() {});
    });
    moveLeftIconLoveWhenRelease.addListener(() {
      setState(() {});
    });
    moveLeftIconHahaWhenRelease.addListener(() {
      setState(() {});
    });
    moveLeftIconWowWhenRelease.addListener(() {
      setState(() {});
    });
    moveLeftIconSadWhenRelease.addListener(() {
      setState(() {});
    });
    moveLeftIconAngryWhenRelease.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animControlBtnLongPress.dispose();
    animControlBox.dispose();
    animControlIconWhenDrag.dispose();
    animControlIconWhenDragInside.dispose();
    animControlIconWhenDragOutside.dispose();
    animControlBoxWhenDragOutside.dispose();
    animControlIconWhenRelease.dispose();
    animControlBtnShortPress.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onHorizontalDragEnd: _onHorizontalDragEndBoxIcon,
          onHorizontalDragUpdate: _onHorizontalDragUpdateBoxIcon,
          onVerticalDragEnd: _onHorizontalDragEndBoxIcon,
          onVerticalDragUpdate: _onHorizontalDragUpdateBoxIcon,
          child: Portal(
            child: PortalEntry(
              visible: true,
              portalAnchor: widget.portalAnchor,
              childAnchor: widget.childAnchor,
              portal: Padding(
                padding: EdgeInsets.only(bottom: widget.spacing),
                child: Container(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      // Box
                      if (widget.reactions.isNotEmpty) _backgroudBoxBuilder(),
                      // emojies
                      _reactionsBuilder(),
                    ],
                  ),
                ),
              ),
              child: _reactionButtonBuilder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _backgroudBoxBuilder() {
    return Opacity(
      opacity: fadeInBox.value,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Color(0xffe0e0e0), width: 0.3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: widget.containerWidth,
        height: isDragging
            ? (previousIconFocus == 0 ? zoomBoxIcon.value : 40.0)
            : isDraggingOutside
                ? zoomBoxWhenDragOutside.value
                : 50.0,
        margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
      ),
    );
  }

  Widget _reactionsBuilder() {
    return Container(
      width: widget.containerWidth,
      margin: EdgeInsets.only(
        left: moveRightGroupIcon.value,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          for (int i = 0; i < widget.reactions.length; i++)
            Transform.scale(
              scale: isDragging
                  ? (currentIconFocus == i
                      ? zoomIconChosen.value
                      : (previousIconFocus == i
                          ? zoomIconNotChosen.value
                          : isJustDragInside
                              ? zoomIconWhenDragInside.value
                              : 0.8))
                  : isDraggingOutside
                      ? zoomIconWhenDragOutside.value
                      : zoomIconLike.value,
              child: Container(
                margin: EdgeInsets.only(bottom: pushIconLikeUp.value),
                width: 40.0,
                height: currentIconFocus == i ? 70.0 : 40.0,
                child: Column(
                  children: <Widget>[
                    currentIconFocus == i
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black.withOpacity(0.6)),
                            padding: EdgeInsets.only(
                                left: 7.0, right: 7.0, top: 2.0, bottom: 2.0),
                            margin: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              '${widget.reactions[i].name}',
                              style:
                                  TextStyle(fontSize: 8.0, color: Colors.white),
                            ),
                          )
                        : Container(),
                    widget.reactions[i].reaction,
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _reactionButtonBuilder() {
    return GestureDetector(
      onTapDown: _onTapDownBtn,
      onTapUp: _onTapUpBtn,
      onTap: _onTapBtn,
      child: Center(
        child: Row(
          children: [
            Transform.scale(
              scale: !isLongPress
                  ? _handleOutputRangeZoomInIconLike(zoomIconLikeInBtn2.value)
                  : zoomIconLikeInBtn.value,
              child: Transform.rotate(
                angle: !isLongPress
                    ? _handleOutputRangeTiltIconLike(tiltIconLikeInBtn2.value)
                    : tiltIconLikeInBtn.value,
                child: widget.prefix,
              ),
            ),
            if (widget.suffix != null)
              SizedBox(
                width: 5.0,
              ),
            widget.suffix ?? Container(),
          ],
        ),
      ),
    );
  }

  void _onHorizontalDragEndBoxIcon(DragEndDetails dragEndDetail) {
    isDragging = false;
    isDraggingOutside = false;
    isJustDragInside = true;
    previousIconFocus = 0;
    currentIconFocus = 0;

    _onTapUpBtn(null);
  }

  void _onHorizontalDragUpdateBoxIcon(DragUpdateDetails dragUpdateDetail) {
    if (!isLongPress) return;
    if (dragUpdateDetail.localPosition.dy >= -100 &&
        dragUpdateDetail.localPosition.dy <= 100) {
      isDragging = true;
      isDraggingOutside = false;

      if (isJustDragInside && !animControlIconWhenDragInside.isAnimating) {
        animControlIconWhenDragInside.reset();
        animControlIconWhenDragInside.forward();
      }

      var _a = widget.dragStart;
      var _b = _a + widget.dragSpace;

      for (int i = 1; i <= widget.reactions.length; i++) {
        if (dragUpdateDetail.globalPosition.dx >= _a &&
            dragUpdateDetail.globalPosition.dx < _b) {
          if (currentIconFocus != (i - 1)) {
            _handleWhenDragBetweenIcon((i - 1));
          }
        }

        _a = _b;
        _b = _a + widget.dragSpace;
      }
    } else {
      whichIconUserChoose = 0;
      previousIconFocus = 0;
      currentIconFocus = 0;
      isJustDragInside = true;

      if (isDragging && !isDraggingOutside) {
        isDragging = false;
        isDraggingOutside = true;
        animControlIconWhenDragOutside.reset();
        animControlIconWhenDragOutside.forward();
        animControlBoxWhenDragOutside.reset();
        animControlBoxWhenDragOutside.forward();
      }
    }
  }

  void _handleWhenDragBetweenIcon(int currentIcon) {
    whichIconUserChoose = currentIcon;
    previousIconFocus = currentIconFocus;
    currentIconFocus = currentIcon;
    animControlIconWhenDrag.reset();
    animControlIconWhenDrag.forward();
  }

  void _onTapDownBtn(TapDownDetails tapDownDetail) {
    holdTimer = Timer(durationLongPress, () {
      _showBox();
    });
  }

  void _onTapUpBtn(TapUpDetails? tapUpDetail) {
    if (isLongPress) {
      if (widget.reactions.isNotEmpty)
        widget.onReactionSelected(widget.reactions[whichIconUserChoose]);
      currentIconFocus = -1;
    }
    Timer(Duration(milliseconds: durationAnimationBox), () {
      isLongPress = false;
    });

    holdTimer.cancel();

    animControlBtnLongPress.reverse();

    _setReverseValue();
    animControlBox.reverse();

    animControlIconWhenRelease.reset();
    animControlIconWhenRelease.forward();
  }

  void _onTapBtn() {
    if (!isLongPress) {
      if (whichIconUserChoose == 0) {
        isLiked = !isLiked;
        whichIconUserChoose = 1;
      } else {
        whichIconUserChoose = 0;
      }
      if (isLiked) {
        animControlBtnShortPress.forward();
      } else {
        animControlBtnShortPress.reverse();
      }
      if (widget.reactions.isNotEmpty) widget.onPressed();
    }
  }

  double _handleOutputRangeZoomInIconLike(double value) {
    if (value >= 0.8) {
      return value;
    } else if (value >= 0.4) {
      return 1.6 - value;
    } else {
      return 0.8 + value;
    }
  }

  double _handleOutputRangeTiltIconLike(double value) {
    if (value <= 0.2) {
      return value;
    } else if (value <= 0.6) {
      return 0.4 - value;
    } else {
      return -(0.8 - value);
    }
  }

  void _showBox() {
    isLongPress = true;

    animControlBtnLongPress.forward();

    _setForwardValue();
    animControlBox.forward();
  }

  void _setReverseValue() {
    // Icons
    pushIconLikeUp = Tween(begin: 10.0, end: 15.0).animate(
      CurvedAnimation(parent: animControlBox, curve: Interval(0.5, 1.0)),
    );
    zoomIconLike = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animControlBox, curve: Interval(0.5, 1.0)),
    );
  }

  void _setForwardValue() {
    // Icons
    pushIconLikeUp = Tween(begin: 10.0, end: 15.0).animate(
      CurvedAnimation(parent: animControlBox, curve: Interval(0.0, 0.5)),
    );
    zoomIconLike = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animControlBox, curve: Interval(0.0, 0.5)),
    );
  }
}
