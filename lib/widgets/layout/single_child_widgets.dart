import 'package:flutter/material.dart';
import 'dart:math' as math;

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
    return Column(
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

/// Um quadrado com constraints que impede o widget filho de ultrapassar
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

/// Este é dificil de explicar
class CustomSingleChildLayoutWidget extends StatelessWidget {
  const CustomSingleChildLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Text("CustomSingleChildLayout"),
        CustomSingleChildLayout(
          delegate: CustomSingleChildLayoutWidgetDelegate(),
          child: Container(
            color: Color.fromARGB(106, 76, 175, 79),
            width: 10,
            height: 100,
          ),
        ),
      ],
    );
  }
}

class CustomSingleChildLayoutWidgetDelegate extends SingleChildLayoutDelegate {
  @override
  Size getSize(BoxConstraints constraints) {
    return constraints.smallest;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten();
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    Offset childPosition = Offset.zero;

    childPosition = Offset(10, -10);

    return childPosition;
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}

/// Faz com que o widget filho dentro de um row ou column ocupe no máximo o espaço disponivel sem causar overflow
class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Text("Expanded ->"),
              Expanded(
                child: Image.network(
                    "https://lh3.googleusercontent.com/zw9dJAOfPdGj6nLVMGJQeuTEPFft-3i9yzshOxG5N7H2BCWwAwPaWsYYMDpXn_4KrdClYuOH8YSDGqW4_u5quLi2zXpvIZUSdtsd8ubxYVuXwvURxQ"),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Text("Expanded ------------->"),
              Expanded(
                child: Image.network(
                    "https://lh3.googleusercontent.com/zw9dJAOfPdGj6nLVMGJQeuTEPFft-3i9yzshOxG5N7H2BCWwAwPaWsYYMDpXn_4KrdClYuOH8YSDGqW4_u5quLi2zXpvIZUSdtsd8ubxYVuXwvURxQ"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Faz com que os widgets filhos tenham o mesmo tamanho do maior widget filho
class IntrinsicWidthWidget extends StatelessWidget {
  const IntrinsicWidthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Intrinsic Width"),
          Text("Texto curto"),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
          Text("Texto mais longo do que o curto"),
        ],
      ),
    );
  }
}

/// Intrinsic Height fez com que todos os elementos ganhassem a altura do elemento mais alto da linha
class IntrinsicHeightWidget extends StatelessWidget {
  const IntrinsicHeightWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: Colors.yellow,
            width: 20,
            height: 20,
          ),
          Container(
            color: Colors.blue,
            width: 50,
            height: 50,
          ),
          Container(
            color: Colors.yellow,
            width: 15,
            height: 10,
          ),
        ],
      ),
    );
  }
}

/// Este widget serve para impor limite de tamanho de um widget filho na qual o widget pai não impõe um tamanho máximo
class LimitedBoxWidget extends StatelessWidget {
  const LimitedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < 10; i++)
          LimitedBox(
            maxHeight: 100,
            child: Container(
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1.0),
            ),
          )
      ],
    );
  }
}

/// Controla a visibilidade de um widget, mas o widget continua tendo um tamanho e as animações ainda são aplcadas
class OffstageWidget extends StatefulWidget {
  const OffstageWidget({super.key});

  @override
  State<StatefulWidget> createState() => _OffstageWidgetState();
}

class _OffstageWidgetState extends State<OffstageWidget> {
  var _offstage = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Offstage(
            offstage: _offstage,
            child: Image.network(
                "https://lh3.googleusercontent.com/zw9dJAOfPdGj6nLVMGJQeuTEPFft-3i9yzshOxG5N7H2BCWwAwPaWsYYMDpXn_4KrdClYuOH8YSDGqW4_u5quLi2zXpvIZUSdtsd8ubxYVuXwvURxQ"),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _offstage = !_offstage;
              });
            },
            child: const Text("Mostrar Imagem"))
      ],
    );
  }
}

/// Permite que um widget filho não seja constrained pelos widgets pais (acima na hierarquia)
class OverflowBoxWidget extends StatelessWidget {
  const OverflowBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.grey,
          child: const OverflowBox(
            maxHeight: 200,
            maxWidth: 200,
            child: FlutterLogo(size: 200),
          ),
        )
      ],
    );
  }
}

/// Faz o widget filho ter a mesma altura e/ou largura do widget pai
class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const FittedBox(
      fit: BoxFit.none,
      child: SizedBox(
        width: 50.0,
        height: 70.0,
        child: Card(child: Text('Sized Box!')),
      ),
    );
  }
}

class SizedOverflowBoxWidget extends StatelessWidget {
  const SizedOverflowBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const FittedBox(
      fit: BoxFit.none,
      child: SizedOverflowBox(
        size: Size(10, 10),
        child: Card(child: Text('Sized Overflow Box!')),
      ),
    );
  }
}
