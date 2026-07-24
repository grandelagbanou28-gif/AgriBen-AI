import 'package:flutter/material.dart';

class LogoExporter extends StatelessWidget {
  final Widget childWidget;

  const LogoExporter({
    super.key,
    required this.childWidget,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: childWidget,
    );
  }
}
