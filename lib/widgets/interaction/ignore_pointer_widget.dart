import 'package:flutter/material.dart';

class IgnorePointerWidget extends StatelessWidget {
  const IgnorePointerWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("IgnorePointer"),
          Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: widget,
          ),
          const Text(textAlign: TextAlign.center, "Ele bloqueia interações"),
        ],
      ),
    );
  }
}
