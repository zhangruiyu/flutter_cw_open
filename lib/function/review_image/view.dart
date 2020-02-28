import 'dart:io';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    ReviewImageState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(),
    body: Container(
        child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        var imageData = state.images[index];
        return PhotoViewGalleryPageOptions(
          imageProvider: imageData.startsWith("http")
              ? ExtendedNetworkImageProvider(imageData)
              : FileImage(File(imageData)),
          initialScale: PhotoViewComputedScale.contained * 0.8,
//            heroTag: galleryItems[index].id,
        );
      },
      itemCount: state.images.length,
//        loadingChild: widget.loadingChild,
      backgroundDecoration: BoxDecoration(color: colorWhite),
      pageController: state.pageController,
//        onPageChanged: onPageChanged,
    )),
  );
}
