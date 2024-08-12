import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  const AlignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: Text("Alinhamento"),
    );
  }
}

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Aspect Ratio"),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Placeholder(),
        ),
        Text("16/9"),
      ],
    );
  }
}

/// Baseline é um widget que posiciona um widget a partir de uma distância do ponto mais norte do widget.
class BaselineWidget extends StatelessWidget {
  const BaselineWidget({super.key});

  /// Pegar o valor de algum outro widget para construir o [baseline]
  @override
  Widget build(BuildContext context) {
    var baseline = 100.0;
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          child: ClipRect(
            child: Baseline(
              baseline: baseline,
              baselineType: TextBaseline.alphabetic,
              child: Column(
                children: [
                  Text("Baseline ($baseline)"),
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: const Color.fromARGB(33, 255, 193, 7),
          child: ClipRect(
            child: Baseline(
              baseline: baseline + 50,
              baselineType: TextBaseline.alphabetic,
              child: Column(
                children: [
                  Text("Baseline (${baseline + 50})"),
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Center"),
    );
  }
}

class ConstrainedBoxWidget extends StatelessWidget {
  const ConstrainedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 100, width: 50),
        child: const Text("ConstrainedBox"),
      ),
    );
  }
}
