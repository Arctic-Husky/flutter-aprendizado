import 'package:flutter/material.dart';

/// Classe de demonstração de widgets de [Text] ou relacionados a texto.
class TextWidgets extends StatelessWidget {
  const TextWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: const Text(
              maxLines: 1, overflow: TextOverflow.ellipsis, "Widget de Texto"),
        ),
        SelectionArea(
          child: Container(
            width: 100,
            decoration: BoxDecoration(border: Border.all()),
            child: const Text("Texto Selecionável"),
            // SelectionContainer.disabled(child: Text('Non-selectable text')),
          ),
        ),
        Container(
          width: 100,
          decoration: BoxDecoration(border: Border.all()),
          child: const Text.rich(
            TextSpan(
              text: "Rich Text!",
              children: <TextSpan>[
                TextSpan(
                  text: "Bold",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Material(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 100,
              decoration: BoxDecoration(border: Border.all()),
              child: DefaultTextStyle.merge(
                style: const TextStyle(fontStyle: FontStyle.italic),
                child: const Text.rich(
                  TextSpan(
                    text: "Texto Interagível",
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
