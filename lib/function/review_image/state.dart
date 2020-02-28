import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class ReviewImageState implements Cloneable<ReviewImageState> {
  List<String> images;
  int index;
  PageController pageController;

  @override
  ReviewImageState clone() {
    return ReviewImageState()
      ..images = images
      ..index = index;
  }
}

ReviewImageState initState(Map<String, dynamic> args) {
  return ReviewImageState()
    ..images = args['images']
    ..index = args['index']
    ..pageController = PageController(initialPage: args['index']);
}
