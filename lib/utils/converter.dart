import 'package:bizi/constants/b_colors.dart';
import 'package:bizi/models/photo_model.dart';
import 'package:bizi/redux/states/campaign_builder.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

List<PhotoModel> convertListDynamicToListPhotoModel(List photos) {
  if (photos.isNotEmpty) {
    List<PhotoModel> photoList =
        photos.map((photo) => PhotoModel.fromJson(photo)).toList();
    return photoList;
  }
  return [];
}

ImageBuilderDisplayType convertStringToImageBuilderEnum(String? type) {
  ImageBuilderDisplayType imageType = ImageBuilderDisplayType.pexels;
  switch (type) {
    case 'device':
      imageType = ImageBuilderDisplayType.device;
      break;
    case 'pexels':
      imageType = ImageBuilderDisplayType.pexels;
      break;
    case 'unsplash':
      imageType = ImageBuilderDisplayType.unsplash;
      break;
    case 'giphy':
      imageType = ImageBuilderDisplayType.giphy;
      break;
    default:
      imageType = ImageBuilderDisplayType.pexels;
      break;
  }

  return imageType;
}

String convertColorToString(Color color) {
  String colorText = 'blue';
  try {
    if (color == BColors.black) {
      colorText = 'black';
    } else if (color == BColors.red) {
      colorText = 'red';
    } else if (color == BColors.white) {
      colorText = 'white';
    } else if (color == BColors.veryLightGrey) {
      colorText = 'veryLightGrey';
    } else if (color == BColors.lightGrey) {
      colorText = 'lightGrey';
    } else if (color == BColors.grey) {
      colorText = 'grey';
    } else if (color == BColors.yellow) {
      colorText = 'yellow';
    } else if (color == BColors.green) {
      colorText = 'green';
    } else if (color == BColors.pink) {
      colorText = 'pink';
    } else if (color == BColors.lemon) {
      colorText = 'lemon';
    } else if (color == BColors.black) {
      colorText = 'black';
    } else if (color == BColors.brown) {
      colorText = 'brown';
    } else if (color == BColors.orange) {
      colorText = 'orange';
    } else {
      colorText = 'blue';
    }

    return colorText;
  } catch (e) {
    developer.log(e.toString());
    return colorText;
  }
}

Color convertStringToColor(String colorText) {
  Color color = BColors.blue;
  switch (colorText) {
    case 'black':
      color == BColors.black;
      break;
    case 'red':
      color = BColors.red;
      break;
    case 'white':
      color = BColors.white;
      break;
    case 'veryLightGrey':
      color = BColors.veryLightGrey;
      break;
    case 'lightGrey':
      color = BColors.lightGrey;
      break;
    case 'grey':
      color = BColors.grey;
      break;
    case 'yellow':
      color = BColors.yellow;
      break;
    case 'green':
      color = BColors.green;
      break;
    case 'pink':
      color = BColors.pink;
      break;
    case 'lemon':
      color = BColors.lemon;
      break;
    case 'brown':
      color = BColors.brown;
      break;
    case 'orange':
      color = BColors.orange;
      break;
    default:
      color = BColors.blue;
  }
  return color;
}
