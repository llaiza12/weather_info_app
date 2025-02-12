import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawingApp(),
    );
  }
}

class DrawingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing App'),
      ),
      body: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: SmileyPainter(),
        ),
      ),
    );
  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);

    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawArc(
        Rect.fromCircle(center: center.translate(0, 75), radius: radius / 2),
        pi,
        pi,
        false,
        smilePaint);

    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2), 10, Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2), 10, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
