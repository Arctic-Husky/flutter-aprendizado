import 'package:flutter/material.dart';

class FlowWidget extends StatefulWidget {
  const FlowWidget({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  State<StatefulWidget> createState() => _FlowWidgetState();
}

class _FlowWidgetState extends State<FlowWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = [
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
  }

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter =
        MediaQuery.of(context).size.width / widget.constraints.maxHeight;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: const CircleBorder(),
        constraints: BoxConstraints.tightFor(
            width: widget.constraints.maxWidth / menuItems.length,
            height: widget.constraints.maxHeight /
                menuItems
                    .length), //BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updateMenu(icon);
          menuAnimation.status == AnimationStatus.completed
              ? menuAnimation.reverse()
              : menuAnimation.forward();
        },
        child: Icon(icon, color: Colors.white, size: 45.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
      children:
          menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;
  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; i++) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(i,
          transform: Matrix4.translationValues(dx * menuAnimation.value, 0, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }
}

/// Este widget aceita uma lista de widgets e exibe um de cada vez, ai cabe a você escolher qual vai exibir através de [index]
class IndexedStackWidget extends StatefulWidget {
  const IndexedStackWidget({super.key, required this.widgets});

  final List<Widget> widgets;

  @override
  State<StatefulWidget> createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (index == 0) {
                index = widget.widgets.length - 1;
                return;
              }

              index -= 1;
            });
          },
          child: const Icon(
            Icons.chevron_left,
            key: Key('gesture1'),
          ),
        ),
        Expanded(child: IndexedStack(index: index, children: widget.widgets)),
        GestureDetector(
          onTap: () {
            setState(() {
              if (index == widget.widgets.length - 1) {
                index = 0;
                return;
              }

              index += 1;
            });
          },
          child: const Icon(
            Icons.chevron_right,
            key: Key('gesture1'),
          ),
        ),
      ],
    );
  }
}

/// Cria uma tabela, todas as linhas devem ter a mesma quantidade de elementos
class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var widgets = List<TableRow>.generate(4, (index) {
      return TableRow(children: [
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Image.network(
              "https://wiki.yogstation.net/images/5/52/Slime_comp.png"),
        ),
        Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Image.network(
                "https://wiki.yogstation.net/images/0/0e/Burning.gif")),
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Image.network(
              "https://wiki.yogstation.net/images/5/52/Slime_comp.png"),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Image.network(
              "https://wiki.yogstation.net/images/b/ba/Slimebluespace.gif"),
        ),
      ]);
    });

    return Table(
      children: widgets,
    );
  }
}

/// Automaticamente posiciona widgets dentro de um espaço evitando overflow em modo de linha e coluna
class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var widgets = List<Widget>.generate(11, (index) {
      return Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Image.network("https://picsum.photos/40?random=$index"),
      );
    });

    return Wrap(
      children: widgets,
    );
  }
}
