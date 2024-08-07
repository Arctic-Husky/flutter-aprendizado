import 'package:flutter/material.dart';

///
/// Providencia uma animação de fade in para o [text]
///
/// [text] é o texto que será exibido.
///
class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key, required this.text});

  /// Texto que será exibido
  final String text;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: Padding(
            padding: EdgeInsets.only(top: val * 20),
            child: child,
          ),
        );
      },
      child: Text(
        text /*,TextStyle*/,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}
