import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final TextEditingController _textBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (builder, constraints) {
      return DraggableScrollableSheet(
        controller: widget.draggableScrollableController,
        initialChildSize: 0.30.sp, // 25% of screen height initially
        minChildSize: 0.25.sp, // Minimum size is 25% of screen height
        maxChildSize: 0.6
            .sp, // Maximum size is 60% of screen height (for text field focus)
        expand: true,
        snap: true,
        snapSizes: [0.25.sp], // Snap at 25% of screen height
        builder: (BuildContext context, ScrollController scrollController) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 144, 195, 142)
                  .withOpacity(0.2), // Fully opaque background
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 1),
                )
              ],
              borderRadius: const BorderRadius.only(
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
    });
  }
}
