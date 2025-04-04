import 'dart:math';
import 'package:flutter/material.dart';

class WaveText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  const WaveText({super.key, required this.text, required this.textStyle});

  @override
  _WaveTextState createState() => _WaveTextState();
}

class _WaveTextState extends State<WaveText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.text.length, (index) {
            final char = widget.text[index];
            final offset =
                sin((_controller.value * 2 * pi) + (index * 0.5)) * 10;
            return Transform.translate(
              offset: Offset(0, offset),
              child: Text(char, style: widget.textStyle),
            );
          }),
        );
      },
    );
  }
}
