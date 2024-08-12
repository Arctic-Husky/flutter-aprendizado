import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Scaffold!!"),
      ),
      drawer: Drawer(),
      body: const Center(
          child: Text(
              "Scaffold é um widget que providencia APIs para exibir drawers, snack bars, entre outros")),
    );
  }
}
