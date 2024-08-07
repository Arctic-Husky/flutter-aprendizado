import 'package:flutter/material.dart';
import '../animatedtext/animatedtext.dart';

class ListaElemento extends StatelessWidget {
  const ListaElemento({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Center(
        child: AnimatedText(
          text: text,
        ),
      ),
    );
  }
}
