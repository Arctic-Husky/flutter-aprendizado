import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/interaction/absorb_pointer_widget.dart';
import 'package:flutter_application/widgets/interaction/ignore_pointer_widget.dart';
import 'package:flutter_application/widgets/interaction/interactive_viewer_widget.dart';
import 'package:flutter_application/widgets/layout/single_child_widgets.dart';
import 'dart:math' as math;
import '../../widgets/interaction/draggable_widget.dart';
import '../../widgets/text/text_widgets.dart';
import '../../widgets/scaffold/scaffold_widget.dart';
import '../../widgets/interaction/draggable_scrollable_sheet_widget.dart';

class TesteWidgetsPage extends StatefulWidget {
  const TesteWidgetsPage({super.key});

  @override
  State<StatefulWidget> createState() => TesteWidgetsPageState();
}

class TesteWidgetsPageState extends State<TesteWidgetsPage> {
  List<Widget> widgets = [
    Container(
      // Define o tamanho do Container
      width: 80, // Ajuste os valores
      height: 40, // Ajuste os valores
      // Centraliza o ElevatedButton
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Botão"),
      ),
    ),
    Container(
      // Define o tamanho do Container
      width: 80, // Ajuste os valores
      height: 40, // Ajuste os valores
      // Centraliza o ElevatedButton
      alignment: Alignment.center,
      child: const ElevatedButton(
        onPressed: null,
        child: Text("Botão"),
      ),
    ),
    Container(
      alignment: Alignment.center,
      child: const Stack(alignment: Alignment.center, children: [
        FlutterLogo(),
        Text("Laranjas"),
      ]),
    ),
    Container(
      alignment: Alignment.center,
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              Container(
                height: 10,
                width: 10,
                color: Colors.orange,
              ),
              Container(
                height: 30,
                width: 10,
                color: Colors.orange,
              )
            ],
          ),
          TableRow(children: [
            Container(
              height: 10,
              width: 20,
              color: Colors.orange,
            ),
            Container(
              height: 5,
              width: 5,
              color: Colors.orange,
            )
          ])
        ],
      ),
    ),
    ColoredBox(
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: const Color(0xFFE8581C),
          child: const Text('Este é o Transform!!!'),
        ),
      ),
    ),
    Container(alignment: Alignment.center, child: const TextWidgets()),
    const ScaffoldWidget(),
    Container(
      alignment: Alignment.center,
      child: const MyDraggableWidget(),
    ),
    Container(
      alignment: Alignment.center,
      child: const MyDragTargetWidget(),
    ),
    Container(
      alignment: Alignment.center,
      child: const DraggableScrollableSheetWidget(
        widget: TextWidgets(),
      ),
    ),
    Container(
      alignment: Alignment.center,
      child: const AbsorbPointerWidget(
        widget: MyDragTargetWidget(),
      ),
    ),
    Container(
      alignment: Alignment.center,
      child: const IgnorePointerWidget(
        widget: MyDragTargetWidget(),
      ),
    ),
    Container(
      alignment: Alignment.center,
      child: const InteractiveViewerWidget(),
    ),
    const AlignWidget(),
    const AspectRatioWidget(),
    const BaselineWidget(),
    const CenterWidget(),
    Container(
      alignment: Alignment.center,
      child: const ConstrainedBoxWidget(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Teste dos Widgets"),
      ),
      body: GridView.builder(
        itemCount: widgets.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (gridContext, gridIndex) {
          print(widgets.length);
          return LayoutBuilder(
            builder: (l2Context, l2Constraints) {
              return Dismissible(
                key: ValueKey<Widget>(widgets[gridIndex]),
                onDismissed: (direction) {
                  setState(() {
                    widgets.removeAt(gridIndex);
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => Scaffold(
                          body: Hero(
                            tag: 'hero-$gridIndex',
                            flightShuttleBuilder: _flightShuttleBuilder,
                            child: Container(
                              alignment: Alignment.center,
                              child: widgets[gridIndex],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Hero(
                      tag: 'hero-$gridIndex',
                      flightShuttleBuilder: _flightShuttleBuilder,
                      child: widgets[gridIndex],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }
}
