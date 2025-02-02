import 'package:flutter/material.dart';
import 'package:nearme_app/core/constants.dart';

class DraggableSheetWidget extends StatefulWidget {
  final Widget child;
  final DraggableScrollableController? draggableScrollableController;

  const DraggableSheetWidget(
      {super.key, required this.child, this.draggableScrollableController});

  @override
  State<DraggableSheetWidget> createState() => _DraggableSheetWidgetState();
}

class _DraggableSheetWidgetState extends State<DraggableSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints) {
        return DraggableScrollableSheet(
          controller: widget.draggableScrollableController,
          initialChildSize: 0.25, // 25% of screen height initially
          minChildSize: 0.25, // Minimum size is 25% of screen height
          maxChildSize:
              0.6, // Maximum size is 60% of screen height (for text field focus)
          expand: true,
          snap: true,
          snapSizes: [0.25], // Snap at 25% of screen height
          builder: (BuildContext context, ScrollController scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: kBackgroundColor, // Fully opaque background
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: widget.child,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
