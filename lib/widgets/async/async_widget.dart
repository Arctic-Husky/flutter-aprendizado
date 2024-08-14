import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WrapWidgetAsync extends StatefulWidget {
  @override
  State<WrapWidgetAsync> createState() => WrapWidgetAsyncState();
}

/// Automaticamente posiciona widgets dentro de um espaço evitando overflow em modo de linha e coluna
class WrapWidgetAsyncState extends State<WrapWidgetAsync> {
  late Future<List<Image>> _images;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [Container()],
    );
  }

  Future<http.Response> _getImages(int intex) {
    /*var images = List<Future<http.Response>>.generate(
      11,
      (index) {
        return http.get(
          Uri.parse("https://picsum.photos/40?random=$index"),
        );
      },
    );*/

    Future<List<http.Response>> lista;

    for (int i = 0; i < 11; i++) {
      var response = http.get(Uri.parse("https://picsum.photos/40?random=$i"));

      //lista.
    }

    return http.get(Uri.parse("https://picsum.photos/40?random=$index"));
  }
}
