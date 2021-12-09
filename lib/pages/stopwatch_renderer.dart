import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_app/pages/clock_hand.dart';
import 'package:stopwatch_app/pages/clocks_hands_ticker_marker.dart';
import 'package:stopwatch_app/pages/elapsed_time_text_basic.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsed;
  final double radius;
  const StopwatchRenderer({
    Key? key,
    required this.elapsed,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
              left: radius,
              top: radius,
              child: ClockSecondsTickerMarker(
                seconds: i,
                radius: radius,
              )),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockTextMarker(value: i, maxValue: 60, radius: radius),
          ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            handThickness: 2,
            handLength: radius,
            color: Colors.orange,
          ),
        ),
        Positioned(
          top: radius * 1.3,
          right: 0,
          left: 0,
          child: ElapsedTimeTextBasic(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
