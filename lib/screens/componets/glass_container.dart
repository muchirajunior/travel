import 'package:flutter/material.dart';
import 'dart:ui';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final double blurStrength;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  const GlassContainer({
    super.key,
    required this.child,
    this.width = 300,
    this.height = 100,
    this.borderRadius = 10,
    this.blurStrength = 20.0,
    this.backgroundColor = Colors.grey,
    this.borderColor = Colors.white,
    this.borderWidth = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor.withOpacity(0.2),
      ),
      child: Stack(
        children: [
          // Background blur effect
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurStrength, sigmaY: blurStrength),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                    width: borderWidth,
                    color: borderColor.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
