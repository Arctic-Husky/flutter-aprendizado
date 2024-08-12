import 'package:flutter/material.dart';

class InteractiveViewerWidget extends StatelessWidget {
  const InteractiveViewerWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: InteractiveViewer(
          constrained: true,
          maxScale: 4,
          //alignment: Alignment.center, Alignment aqui deu problema no zoom sei la pq
          child: Image.network(errorBuilder: (context, error, stackTrace) {
            return Text(error.toString());
          }, 'https://picsum.photos/250?image=9'),
        ),
      ),
    );
  }
}
