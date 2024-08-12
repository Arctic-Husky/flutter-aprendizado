import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DraggableScrollableSheetWidget extends StatefulWidget {
  const DraggableScrollableSheetWidget({super.key, required this.widget});

  final Widget widget;

  @override
  State<StatefulWidget> createState() => DraggableScrollableSheetWidgetState();
}

class DraggableScrollableSheetWidgetState
    extends State<DraggableScrollableSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 1,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const Text("Draggable Scrollable Sheet"),
              Container(alignment: Alignment.center, child: widget.widget),
              Container(alignment: Alignment.centerLeft, child: widget.widget),
              Container(alignment: Alignment.centerRight, child: widget.widget),
              Container(alignment: Alignment.center, child: widget.widget),
              Container(alignment: Alignment.centerLeft, child: widget.widget),
              Container(alignment: Alignment.centerRight, child: widget.widget),
              Container(alignment: Alignment.center, child: widget.widget),
            ],
          ),
        );
      },
    );
  }
}
