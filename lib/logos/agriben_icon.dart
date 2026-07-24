import 'package:flutter/material.dart';

class AgriBenIcon extends StatelessWidget {
  final double size;
  final bool showShadow;

  const AgriBenIcon({
    super.key,
    this.size = 120,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: showShadow
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(size * 0.22),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF14532D).withValues(alpha: 0.35),
                  blurRadius: size * 0.25,
                  offset: Offset(0, size * 0.06),
                ),
              ],
            )
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size * 0.22),
        child: CustomPaint(
          painter: _AgriBenIconPainter(),
          size: Size(size, size),
        ),
      ),
    );
  }
}

class _AgriBenIconPainter extends CustomPainter {
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

    final outerRingPaint = Paint()
      ..color = const Color(0xFF22C55E).withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.02;
    canvas.drawCircle(Offset(cx, cy + h * 0.02), w * 0.35, outerRingPaint);

    final midRingPaint = Paint()
      ..color = const Color(0xFF22C55E).withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.015;
    canvas.drawCircle(Offset(cx, cy + h * 0.02), w * 0.28, midRingPaint);

    final arc1Paint = Paint()
      ..color = const Color(0xFF22C55E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy + h * 0.02), radius: w * 0.35),
      -3.14159 * 0.8,
      3.14159 * 0.4,
      false,
      arc1Paint,
    );

    final arc2Paint = Paint()
      ..color = const Color(0xFF4ADE80)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.03
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy + h * 0.02), radius: w * 0.28),
      -3.14159 * 0.3,
      3.14159 * 0.35,
      false,
      arc2Paint,
    );

    final leafMain = Paint()..color = const Color(0xFF22C55E);
    final leafMainPath = Path();
    leafMainPath.moveTo(cx, cy - h * 0.18);
    leafMainPath.quadraticBezierTo(cx + w * 0.16, cy - h * 0.06, cx + w * 0.06, cy + h * 0.10);
    leafMainPath.quadraticBezierTo(cx, cy + h * 0.16, cx - w * 0.06, cy + h * 0.10);
    leafMainPath.quadraticBezierTo(cx - w * 0.16, cy - h * 0.06, cx, cy - h * 0.18);
    leafMainPath.close();
    canvas.drawPath(leafMainPath, leafMain);

    final veinPaint = Paint()
      ..color = const Color(0xFF15803D)
      ..strokeWidth = w * 0.015
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(cx, cy - h * 0.14), Offset(cx, cy + h * 0.08), veinPaint);

    final sideVeins = Paint()
      ..color = const Color(0xFF15803D).withValues(alpha: 0.5)
      ..strokeWidth = w * 0.01
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(cx, cy - h * 0.04), Offset(cx + w * 0.08, cy), sideVeins);
    canvas.drawLine(Offset(cx, cy - h * 0.04), Offset(cx - w * 0.08, cy), sideVeins);
    canvas.drawLine(Offset(cx, cy + h * 0.02), Offset(cx + w * 0.06, cy + h * 0.04), sideVeins);
    canvas.drawLine(Offset(cx, cy + h * 0.02), Offset(cx - w * 0.06, cy + h * 0.04), sideVeins);

    final dot1 = Paint()..color = const Color(0xFFF59E0B);
    canvas.drawCircle(Offset(cx + w * 0.26, cy - h * 0.08), w * 0.04, dot1);
    final dot1Ring = Paint()
      ..color = const Color(0xFFFBBF24).withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.015;
    canvas.drawCircle(Offset(cx + w * 0.26, cy - h * 0.08), w * 0.07, dot1Ring);

    final dot2 = Paint()..color = const Color(0xFF4ADE80);
    canvas.drawCircle(Offset(cx - w * 0.24, cy + h * 0.14), w * 0.03, dot2);

    final dot3 = Paint()..color = const Color(0xFF86EFAC);
    canvas.drawCircle(Offset(cx + w * 0.18, cy + h * 0.18), w * 0.02, dot3);

    final smallLeaf = Paint()..color = const Color(0xFF4ADE80).withValues(alpha: 0.7);
    final slPath = Path();
    slPath.moveTo(cx - w * 0.22, cy - h * 0.18);
    slPath.quadraticBezierTo(cx - w * 0.14, cy - h * 0.22, cx - w * 0.16, cy - h * 0.14);
    slPath.quadraticBezierTo(cx - w * 0.18, cy - h * 0.16, cx - w * 0.22, cy - h * 0.18);
    slPath.close();
    canvas.drawPath(slPath, smallLeaf);

    final slPath2 = Path();
    slPath2.moveTo(cx + w * 0.20, cy + h * 0.12);
    slPath2.quadraticBezierTo(cx + w * 0.26, cy + h * 0.08, cx + w * 0.24, cy + h * 0.16);
    slPath2.quadraticBezierTo(cx + w * 0.22, cy + h * 0.14, cx + w * 0.20, cy + h * 0.12);
    slPath2.close();
    canvas.drawPath(slPath2, smallLeaf);

    final gridPaint = Paint()
      ..color = const Color(0xFF15803D).withValues(alpha: 0.25)
      ..strokeWidth = w * 0.008;
    for (int i = 0; i < 3; i++) {
      final startX = cx - w * 0.15 + i * w * 0.15;
      canvas.drawLine(
        Offset(startX, h * 0.75),
        Offset(startX + w * 0.05, h * 0.88),
        gridPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
