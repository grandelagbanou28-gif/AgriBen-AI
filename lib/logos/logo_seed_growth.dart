import 'package:flutter/material.dart';

class LogoSeedGrowth extends CustomPainter {
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

    final soilPaint = Paint()..color = const Color(0xFF166534);
    final soilPath = Path();
    soilPath.moveTo(cx - w * 0.30, h * 0.70);
    soilPath.quadraticBezierTo(cx - w * 0.10, h * 0.66, cx, h * 0.68);
    soilPath.quadraticBezierTo(cx + w * 0.10, h * 0.70, cx + w * 0.30, h * 0.66);
    soilPath.lineTo(cx + w * 0.32, h * 0.88);
    soilPath.quadraticBezierTo(cx, h * 0.92, cx - w * 0.32, h * 0.88);
    soilPath.close();
    canvas.drawPath(soilPath, soilPaint);

    final seedPaint = Paint()..color = const Color(0xFFD6C3A5);
    final seedPath = Path();
    seedPath.moveTo(cx - w * 0.04, h * 0.62);
    seedPath.quadraticBezierTo(cx + w * 0.06, h * 0.58, cx + w * 0.04, h * 0.66);
    seedPath.quadraticBezierTo(cx, h * 0.70, cx - w * 0.04, h * 0.62);
    seedPath.close();
    canvas.drawPath(seedPath, seedPaint);

    final stemPaint = Paint()
      ..color = const Color(0xFF22C55E)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;
    final stemPath = Path();
    stemPath.moveTo(cx, h * 0.58);
    stemPath.quadraticBezierTo(cx + 1, h * 0.42, cx - 1, h * 0.22);
    canvas.drawPath(stemPath, stemPaint);

    final leafRPaint = Paint()..color = const Color(0xFF22C55E);
    final leafR = Path();
    leafR.moveTo(cx, h * 0.40);
    leafR.quadraticBezierTo(cx + w * 0.22, h * 0.28, cx + w * 0.18, h * 0.36);
    leafR.quadraticBezierTo(cx + w * 0.10, h * 0.42, cx, h * 0.40);
    leafR.close();
    canvas.drawPath(leafR, leafRPaint);

    final leafLPaint = Paint()..color = const Color(0xFF4ADE80);
    final leafL = Path();
    leafL.moveTo(cx, h * 0.32);
    leafL.quadraticBezierTo(cx - w * 0.20, h * 0.20, cx - w * 0.16, h * 0.28);
    leafL.quadraticBezierTo(cx - w * 0.08, h * 0.34, cx, h * 0.32);
    leafL.close();
    canvas.drawPath(leafL, leafLPaint);

    final tipPaint = Paint()..color = const Color(0xFF86EFAC);
    final tipPath = Path();
    tipPath.moveTo(cx, h * 0.22);
    tipPath.quadraticBezierTo(cx + w * 0.06, h * 0.12, cx, h * 0.10);
    tipPath.quadraticBezierTo(cx - w * 0.06, h * 0.12, cx, h * 0.22);
    tipPath.close();
    canvas.drawPath(tipPath, tipPaint);

    final glowPaint = Paint()..color = const Color(0xFFF59E0B).withValues(alpha: 0.7);
    canvas.drawCircle(Offset(cx, h * 0.12), 2.5, glowPaint);
    final glowRingPaint = Paint()
      ..color = const Color(0xFFFBBF24).withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(Offset(cx, h * 0.12), 5, glowRingPaint);

    final rootPaint = Paint()
      ..color = const Color(0xFFD6C3A5).withValues(alpha: 0.5)
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;
    final rootPath1 = Path();
    rootPath1.moveTo(cx, h * 0.68);
    rootPath1.quadraticBezierTo(cx - w * 0.08, h * 0.78, cx - w * 0.14, h * 0.82);
    canvas.drawPath(rootPath1, rootPaint);

    final rootPath2 = Path();
    rootPath2.moveTo(cx, h * 0.68);
    rootPath2.quadraticBezierTo(cx + w * 0.06, h * 0.76, cx + w * 0.12, h * 0.80);
    canvas.drawPath(rootPath2, rootPaint);

    final rootPath3 = Path();
    rootPath3.moveTo(cx, h * 0.68);
    rootPath3.quadraticBezierTo(cx + w * 0.02, h * 0.80, cx, h * 0.86);
    canvas.drawPath(rootPath3, rootPaint);

    final progressPaint = Paint()..color = const Color(0xFF22C55E).withValues(alpha: 0.2);
    final progressBg = Paint()
      ..color = const Color(0xFF15803D).withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, h * 0.06), width: w * 0.40, height: 5),
        const Radius.circular(3),
      ),
      progressBg,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx - w * 0.06, h * 0.06), width: w * 0.28, height: 5),
        const Radius.circular(3),
      ),
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
