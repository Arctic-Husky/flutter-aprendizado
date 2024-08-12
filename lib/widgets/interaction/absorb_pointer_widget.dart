import 'package:flutter/material.dart';

class AbsorbPointerWidget extends StatelessWidget {
  const AbsorbPointerWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("AbsorbPointer"),
          Container(
            decoration: const BoxDecoration(
              color: Colors.black12,
            ),
            child: widget,
          ),
          const Text("Ele bloqueia interações"),
        ],
      ),
    );
  }
}
