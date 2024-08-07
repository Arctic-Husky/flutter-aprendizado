import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/widgets/lista/lista_elemento.dart';

class Lista extends StatefulWidget {
  const Lista({super.key, required this.dataPath, required this.jsonKey});

  final String dataPath;

  final String jsonKey;

  @override
  State<StatefulWidget> createState() => ListaState();
}

class ListaState extends State<Lista> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      height: 10,
      child: Card(
        child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 4, right: 4),
            child: FutureBuilder<List<dynamic>>(
              future: readJson(widget.dataPath),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                return ListView.separated(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: Text("Aguardando"),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListaElemento(
                          text:
                              snapshot.data![index][widget.jsonKey].toString());
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              },
            )),
      ),
    );
  }
}

Future<List<dynamic>> readJson(String dataPath) async {
  final String response = await rootBundle.loadString(dataPath);

  final List<dynamic> data = jsonDecode(response);

  return data;
}
