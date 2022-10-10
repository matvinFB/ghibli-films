import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Color color;
  final double opacity;
  final double blur;
  final Widget child;
  final double borderRadius;

  const GlassCard({color, opacity, blur, borderRadius, child, key})
      : color = color ?? Colors.white,
        opacity = opacity ?? 0.8,
        blur = blur ?? 2.5,
        borderRadius = borderRadius ?? 20,
        child = child ??
            const SizedBox(
              height: 30,
              width: 60,
            ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          constraints: const BoxConstraints(minHeight: 225),
          decoration: BoxDecoration(
              color: color.withOpacity(opacity),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              border:
                  Border.all(color: Colors.white.withOpacity(0.5), width: 2)),
          child: child,
        ),
      ),
    );
  }
}
