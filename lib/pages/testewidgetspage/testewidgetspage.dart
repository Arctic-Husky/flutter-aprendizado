import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      child: Stack(alignment: Alignment.center, children: [
        Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsa3K1PkfEgVzc6JeayE-uGwejpsBDBbVBUw&s"),
        const Text("Laranjas"),
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
    Container(),
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
              return Container(
                child: widgets[gridIndex],
              );
            },
          );
        },
      ),
    );
  }
}
