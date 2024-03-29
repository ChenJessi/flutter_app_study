import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _ColorTween {
  color1,
  color2,
}

class AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_ColorTween>()
      ..add(_ColorTween.color1,
          const Color(0xffD38312).tweenTo(Colors.lightBlue.shade900), 3.seconds)
      ..add(
        _ColorTween.color2,
        const Color(0xffA83279).tweenTo(Colors.blue.shade600),
        3.seconds,
      );
    return MirrorAnimation(tween: tween, duration: tween.duration,
      builder: (context, child, value) {
        return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    value.get(_ColorTween.color1),
                    value.get(_ColorTween.color2)
                  ]
              ),
            ),
        );
    },);

  }
}
