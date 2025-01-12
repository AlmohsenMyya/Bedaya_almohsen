import 'package:flutter/material.dart';

class ThickCloseIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ThickCloseIcon({this.size = 30, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CloseIconPainter(color),
    );
  }
}

class _CloseIconPainter extends CustomPainter {
  final Color color;

  _CloseIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4.0 // السمك
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, 0),
      Offset(0, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
