import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget{

  final Color color;
  final double opacity;
  final double blur;
  final Widget child;
  final double borderRadius;

  GlassCard({color, opacity, blur, borderRadius, child, super.key}):
    this.color = color??Colors.white,
    this.opacity = opacity??0.8,
    this.blur = blur??2.5,
    this.borderRadius = borderRadius??20,
    this.child = child??Container(height: 30, width: 60,);

  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          constraints: BoxConstraints(minHeight: 225),
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            border: Border.all(color: Colors.white.withOpacity(0.5), width: 2)
          ),
          child: child,
        ),
      ),
    );
  }

} 