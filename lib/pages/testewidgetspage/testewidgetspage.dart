import 'package:flutter/material.dart';

class TesteWidgetsPage extends StatefulWidget {
  const TesteWidgetsPage({super.key});

  @override
  State<StatefulWidget> createState() => TesteWidgetsPageState();
}

class TesteWidgetsPageState extends State<TesteWidgetsPage> {
  @override
  Widget build(BuildContext context) {
    final placeholders = List.generate(10, (int index) => Placeholder());

    print("Ó NOIS AQUI!");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Teste dos Widgets"),
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (gridContext, gridIndex) {
          return LayoutBuilder(builder: (
            l1Ccontext,
            l1Constraints,
          ) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: LayoutBuilder(
                builder: (l2Context, l2Constraints) {
                  return Padding(
                    padding: EdgeInsets.all(0),
                    // Define o tamanho do Container
                    //width: 80, // Ajuste os valores
                    //height: 40, // Ajuste os valores
                    // Centraliza o ElevatedButton
                    //alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        print(l2Constraints);
                      },
                      child: Text(l2Constraints.maxWidth.toString()),
                    ),
                  );
                },
              ),
            );
          });
        },
      ),
    );
  }
}
