import 'package:flutter/material.dart';

class LogoLeafField extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final double cx = w / 2;
    final double cy = h / 2;

    final bgPaint = Paint()..color = const Color(0xFF14532D);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & Size(w, h), Radius.circular(w * 0.22)),
      bgPaint,
    );

    final fieldPaint = Paint()..color = const Color(0xFF166534);
    final fieldPath = Path();
    fieldPath.moveTo(cx - w * 0.32, h * 0.72);
    fieldPath.quadraticBezierTo(cx, h * 0.65, cx + w * 0.32, h * 0.72);
    fieldPath.lineTo(cx + w * 0.32, h * 0.82);
    fieldPath.quadraticBezierTo(cx, h * 0.76, cx - w * 0.32, h * 0.82);
    fieldPath.close();
    canvas.drawPath(fieldPath, fieldPaint);

    final rowPaint = Paint()
      ..color = const Color(0xFF15803D)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < 4; i++) {
      final y = h * 0.73 + i * 4.0;
      canvas.drawLine(
        Offset(cx - w * 0.25 + i * 3, y),
        Offset(cx + w * 0.25 - i * 3, y),
        rowPaint,
      );
    }

    final leafPaint = Paint()..color = const Color(0xFF22C55E);
    final leafPath = Path();
    leafPath.moveTo(cx, cy - h * 0.28);
    leafPath.quadraticBezierTo(cx + w * 0.22, cy - h * 0.15, cx + w * 0.08, cy + h * 0.05);
    leafPath.quadraticBezierTo(cx, cy + h * 0.18, cx - w * 0.08, cy + h * 0.05);
    leafPath.quadraticBezierTo(cx - w * 0.22, cy - h * 0.15, cx, cy - h * 0.28);
    leafPath.close();
    canvas.drawPath(leafPath, leafPaint);

    final midVeinPaint = Paint()
      ..color = const Color(0xFF15803D)
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      Offset(cx, cy - h * 0.24),
      Offset(cx, cy + h * 0.12),
      midVeinPaint,
    );

    final sideVeinPaint = Paint()
      ..color = const Color(0xFF15803D).withValues(alpha: 0.6)
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(cx, cy - h * 0.12), Offset(cx + w * 0.10, cy - h * 0.05), sideVeinPaint);
    canvas.drawLine(Offset(cx, cy - h * 0.04), Offset(cx + w * 0.08, cy + h * 0.02), sideVeinPaint);
    canvas.drawLine(Offset(cx, cy - h * 0.12), Offset(cx - w * 0.10, cy - h * 0.05), sideVeinPaint);
    canvas.drawLine(Offset(cx, cy - h * 0.04), Offset(cx - w * 0.08, cy + h * 0.02), sideVeinPaint);

    final stemPaint = Paint()
      ..color = const Color(0xFF22C55E)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    final stemPath = Path();
    stemPath.moveTo(cx, cy + h * 0.12);
    stemPath.quadraticBezierTo(cx + 2, cy + h * 0.32, cx - 3, cy + h * 0.55);
    canvas.drawPath(stemPath, stemPaint);

    final sunPaint = Paint()..color = const Color(0xFFF59E0B);
    canvas.drawCircle(Offset(cx + w * 0.24, cy - h * 0.20), w * 0.055, sunPaint);

    final rayPaint = Paint()
      ..color = const Color(0xFFFBBF24)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;
    for (int i = 0; i < 6; i++) {
      final angle = i * 60.0 * 3.14159 / 180.0;
      final r1 = w * 0.07;
      final r2 = w * 0.095;
      canvas.drawLine(
        Offset(
          cx + w * 0.24 + r1 * _cos(angle),
          cy - h * 0.20 + r1 * _sin(angle),
        ),
        Offset(
          cx + w * 0.24 + r2 * _cos(angle),
          cy - h * 0.20 + r2 * _sin(angle),
        ),
        rayPaint,
      );
    }

    final dotPaint = Paint()..color = const Color(0xFF4ADE80);
    canvas.drawCircle(Offset(cx + w * 0.15, cy - h * 0.08), 1.8, dotPaint);
    canvas.drawCircle(Offset(cx - w * 0.15, cy - h * 0.06), 1.8, dotPaint);
    canvas.drawCircle(Offset(cx + w * 0.12, cy + h * 0.10), 1.8, dotPaint);
    canvas.drawCircle(Offset(cx - w * 0.13, cy + h * 0.12), 1.8, dotPaint);
  }

  double _cos(double a) => a == 0 ? 1.0 : a == 3.14159 ? -1.0 : a == 1.5708 ? 0.0 : (a % 6.28318 > 3.14159 ? -1.0 : 1.0) * (1 - (a % 3.14159) * (a % 3.14159) / 2);
  double _sin(double a) => a == 0 ? 0.0 : a == 1.5708 ? 1.0 : (a % 6.28318 > 3.14159 ? -1.0 : 1.0) * ((a % 3.14159) - (a % 3.14159) * (a % 3.14159) * (a % 3.14159) / 6);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
