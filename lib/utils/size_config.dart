import 'package:flutter/material.dart';

// Widget HorizontalSpacing({double of = 8}) => SizedBox(width: of);

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({super.key, this.of = 8});
  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: of);
  }
}

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({super.key, this.of = 8});
  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: of);
  }
}
