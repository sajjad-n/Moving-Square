import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SquareAnimController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _controller;
  late Animation<AlignmentGeometry> alignmentAnim;

  Offset _currentPosition = const Offset(0.0, 0.0);
  Offset _newPosition = const Offset(0.0, 0.0);

  @override
  void onInit() {
    super.onInit();
    _initAnimation();
  }

  @override
  void onClose() {
    super.onClose();
    _controller.dispose();
  }

  void _initAnimation() {
    _controller = AnimationController(vsync: this)
      ..addListener(_animationListener);
    _configTween();
  }

  void _animationListener() {
    if (_controller.isCompleted) {
      _controller.duration = const Duration(milliseconds: 600);
      _controller.repeat(reverse: true, min: 0.85, max: 1.0);
    }
  }

  void _configTween() {
    alignmentAnim = Tween<AlignmentGeometry>(
      begin: Alignment(_currentPosition.dx, _currentPosition.dy),
      end: Alignment(_newPosition.dx, _newPosition.dy),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
  }

  void _forwardAnimation() async {
    _controller.duration = const Duration(seconds: 1);
    _controller.forward(from: 0.0);
    update();
  }

  void _swipeUp() {
    if (_currentPosition.dy != -1.0) {
      _newPosition = Offset(_currentPosition.dx, -1.0);
      _configTween();
      _currentPosition = _newPosition;
      _forwardAnimation();
    }
  }

  void _swipeDown() {
    if (_currentPosition.dy != 1.0) {
      _newPosition = Offset(_currentPosition.dx, 1.0);
      _configTween();
      _currentPosition = _newPosition;
      _forwardAnimation();
    }
  }

  void _swipeRight() {
    if (_currentPosition.dx != 1.0) {
      _newPosition = Offset(1.0, _currentPosition.dy);
      _configTween();
      _currentPosition = _newPosition;
      _forwardAnimation();
    }
  }

  void _swipeLeft() {
    if (_currentPosition.dx != -1.0) {
      _newPosition = Offset(-1.0, _currentPosition.dy);
      _configTween();
      _currentPosition = _newPosition;
      _forwardAnimation();
    }
  }

  void handleVerticalDrag(DragEndDetails endDetails) {
    final velocity = endDetails.primaryVelocity!;
    if (velocity < 0) {
      _swipeUp();
    } else {
      _swipeDown();
    }
  }

  void handleHorizontalDrag(DragEndDetails endDetails) {
    final velocity = endDetails.primaryVelocity!;
    if (velocity < 0) {
      _swipeLeft();
    } else {
      _swipeRight();
    }
  }

  bool isAnimating() {
    return _controller.isAnimating;
  }
}
