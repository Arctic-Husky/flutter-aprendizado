import 'package:flutter/material.dart';

class MyDraggableWidget extends StatelessWidget {
  const MyDraggableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color draggableColor = Colors.orange;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Draggable"),
        Draggable<Color>(
          data: Colors.orange,
          feedback: Container(
            color: Colors.orange,
            height: 100,
            width: 100,
          ),
          childWhenDragging: Container(
            color: Colors.grey,
            height: 100,
            width: 100,
          ),
          child: Container(
            color: Colors.orange,
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}

class MyDragTargetWidget extends StatefulWidget {
  const MyDragTargetWidget({super.key});

  @override
  State<StatefulWidget> createState() => MyDragTargetWidgetState();
}

class MyDragTargetWidgetState extends State<MyDragTargetWidget> {
  Color currentColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("DragTarget"),
        Stack(
          alignment: Alignment.center,
          children: [
            const Text("Drop"),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentColor = Colors.transparent;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                decoration:
                    BoxDecoration(border: Border.all(), color: currentColor),
                child: DragTarget<Color>(
                  onWillAcceptWithDetails: (data) => data.data != Colors.black,
                  onAcceptWithDetails: (data) {
                    print("Dropou aqui ${data.data}");
                    setState(() {
                      currentColor = data.data;
                    });
                  },
                  onLeave: (data) {},
                  builder: (context, candidateData, rejectedData) {
                    if (candidateData.isNotEmpty) {
                      return Container(
                        width: 100,
                        height: 100,
                        color: const Color.fromARGB(50, 158, 158, 158),
                      );
                    }
                    return const SizedBox(width: 100, height: 100);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
