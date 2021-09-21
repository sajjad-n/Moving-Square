import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controller.dart';
import '../screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Moving Square by Sajjad Nik')),
      body: GetBuilder<SquareAnimController>(
        builder: (_) {
          return Stack(
            children: [
              AlignTransition(
                alignment: _.alignmentAnim,
                child: const RoundedSquare(),
              ),
              Positioned.fill(
                child: GestureDetector(
                  onVerticalDragEnd: (endDetails) =>
                      _.handleVerticalDrag(endDetails),
                  onHorizontalDragEnd: (endDetails) =>
                      _.handleHorizontalDrag(endDetails),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
