import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FlagWidget extends StatefulWidget {
  FlagWidget({
    super.key,
    GlobalKey<FlagWidgetState>? globalKey,
    required this.text,
    required this.flagLength,
  });
  @override
  FlagWidgetState createState() => FlagWidgetState();

  late GlobalKey<FlagWidgetState> globalKey;
  final String text;
  final double flagLength;

  FlagWidget copywith({
    Key? key,
    GlobalKey<FlagWidgetState>? globalKey,
    String? text,
    double? flagLength,
  }) {
    return FlagWidget(
      globalKey: globalKey ?? this.globalKey,
      text: text ?? this.text,
      flagLength: flagLength ?? this.flagLength,
    );
  }
}

class FlagWidgetState extends State<FlagWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _poleAnimation;
  late Animation<double> _flagAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _poleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.linear),
      ),
    );
    _flagAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.linear),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void animate() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: FlagPainter(
              _poleAnimation.value, _flagAnimation.value, widget.text),
          size: Size(widget.flagLength, 60),
        );
      },
    );
  }
}

class FlagPainter extends CustomPainter {
  final double poleValue;
  final double flagValue;
  late String text = '';

  FlagPainter(this.poleValue, this.flagValue, this.text);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = const Color.fromARGB(242, 81, 77, 67);
    paint.strokeWidth = 10;
    paint.strokeCap = StrokeCap.round;

    // Draw the pole
    final poleHeight = size.height * poleValue + 40;
    final poleStart = Offset(size.width / 2, size.height);
    final poleEnd = Offset(size.width / 2, size.height - poleHeight);
    canvas.drawLine(poleStart, poleEnd, paint);

    // Draw the flag
    final flagWidth = size.width * flagValue;
    final flagRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(
        size.width / 2,
        size.height - poleHeight,
        flagWidth,
        (2 * size.height) / 3,
      ),
      topRight: const Radius.circular(10),
      bottomRight: const Radius.circular(10),
      topLeft: const Radius.circular(5),
      bottomLeft: const Radius.circular(5),
    );
    // paint.color = Colors.blue;
    // paint.style = PaintingStyle.fill;
    // canvas.drawRRect(flagRect, paint);

    paint.color = const Color.fromARGB(228, 216, 118, 107);
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(flagRect, paint);

    // Create a clip path from the flag rect
    Path clipPath = Path();
    clipPath.addRRect(flagRect);

    // Save the canvas state and clip it with the path
    canvas.save();
    canvas.clipPath(clipPath);

    // Draw the text on the clipped canvas
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: flagWidth - 10);
    textPainter.paint(
      canvas,
      Offset(size.width / 2 + 10, size.height - poleHeight + size.height / 8),
    );

    // Restore the canvas state
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
