import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/controller.dart';

class RoundedSquare extends StatelessWidget {
  const RoundedSquare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageController>(builder: (_) {
      return GestureDetector(
        onTap: _.changeImage,
        child: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.amber, width: 1.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              _.currentImageUrl,
              fit: BoxFit.cover,
              loadingBuilder: _handleImageLoading,
            ),
          ),
        ),
      );
    });
  }

  Widget _handleImageLoading(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    return loadingProgress == null
        ? child
        : const Center(child: CircularProgressIndicator());
  }
}
