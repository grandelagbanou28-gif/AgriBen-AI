import 'package:flutter/material.dart';

class LogoAPlant extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final double cx = w / 2;

    final bgPaint = Paint()..color = const Color(0xFF14532D);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & Size(w, h), Radius.circular(w * 0.22)),
      bgPaint,
    );

    final letterAPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.065
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final aPath = Path();
    aPath.moveTo(cx - w * 0.22, h * 0.72);
    aPath.lineTo(cx, h * 0.24);
    aPath.lineTo(cx + w * 0.22, h * 0.72);
    canvas.drawPath(aPath, letterAPaint);

    final crossPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = w * 0.055
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(cx - w * 0.14, h * 0.52),
      Offset(cx + w * 0.14, h * 0.52),
      crossPaint,
    );

    final greenFill = Paint()..color = const Color(0xFF22C55E);
    final plantPath = Path();
    plantPath.moveTo(cx - w * 0.04, h * 0.24);
    plantPath.quadraticBezierTo(cx - w * 0.18, h * 0.08, cx - w * 0.04, h * 0.02);
    plantPath.quadraticBezierTo(cx + w * 0.02, h * 0.08, cx + w * 0.04, h * 0.24);
    plantPath.close();
    canvas.drawPath(plantPath, greenFill);

    final leftLeafPaint = Paint()..color = const Color(0xFF22C55E);
    final leftLeaf = Path();
    leftLeaf.moveTo(cx - w * 0.04, h * 0.16);
    leftLeaf.quadraticBezierTo(cx - w * 0.20, h * 0.06, cx - w * 0.14, h * 0.14);
    leftLeaf.quadraticBezierTo(cx - w * 0.10, h * 0.18, cx - w * 0.04, h * 0.16);
    leftLeaf.close();
    canvas.drawPath(leftLeaf, leftLeafPaint);

    final rightLeafPaint = Paint()..color = const Color(0xFF4ADE80);
    final rightLeaf = Path();
    rightLeaf.moveTo(cx + w * 0.04, h * 0.18);
    rightLeaf.quadraticBezierTo(cx + w * 0.20, h * 0.10, cx + w * 0.16, h * 0.16);
    rightLeaf.quadraticBezierTo(cx + w * 0.12, h * 0.20, cx + w * 0.04, h * 0.18);
    rightLeaf.close();
    canvas.drawPath(rightLeaf, rightLeafPaint);

    final glowPaint = Paint()..color = const Color(0xFFF59E0B);
    canvas.drawCircle(Offset(cx, h * 0.20), 2.5, glowPaint);

    final sproutPaint = Paint()..color = const Color(0xFF22C55E);
    canvas.drawCircle(Offset(cx - w * 0.08, h * 0.12), 1.8, sproutPaint);
    canvas.drawCircle(Offset(cx + w * 0.10, h * 0.14), 1.4, sproutPaint);
    canvas.drawCircle(Offset(cx, h * 0.06), 1.2, sproutPaint);

    final dashPaint = Paint()
      ..color = const Color(0xFF22C55E).withValues(alpha: 0.3)
      ..strokeWidth = 1.0;
    for (int i = 0; i < 3; i++) {
      final y = h * 0.82 + i * 5.0;
      final startX = cx - w * 0.18 + i * 4;
      canvas.drawLine(Offset(startX, y), Offset(startX + w * 0.12, y), dashPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
