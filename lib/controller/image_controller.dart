import 'dart:math';

import 'package:get/get.dart';

import '../controller/controller.dart';

class ImageController extends GetxController {
  String currentImageUrl = '';

  final _imageUrls = <String>[
    'https://picsum.photos/id/0/5616/3744',
    'https://picsum.photos/id/10/2500/1667',
    'https://picsum.photos/id/100/2500/1656',
    'https://picsum.photos/id/1000/5626/3635',
    'https://picsum.photos/id/1004/5616/3744',
  ];

  @override
  void onInit() {
    super.onInit();
    _initImageUrl();
  }

  void _initImageUrl() {
    final randomIndex = _generateRandomNumber();
    currentImageUrl = _imageUrls[randomIndex];
  }

  int _generateRandomNumber() {
    return Random().nextInt(4);
  }

  void changeImage() {
    final squareAnimController = Get.find<SquareAnimController>();
    if (squareAnimController.isAnimating()) {
      do {
        final randomIndex = _generateRandomNumber();
        if (_imageUrls[randomIndex] != currentImageUrl) {
          currentImageUrl = _imageUrls[randomIndex];
          update();
          return;
        }
      } while (true);
    }
  }
}
