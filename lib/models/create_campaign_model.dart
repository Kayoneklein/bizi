import 'package:bizi/constants/b_colors.dart';
import 'package:bizi/constants/text_localizations.dart';
import 'package:bizi/utils/converter.dart';
import 'package:bizi/views/campaign_builder/index.dart';
import 'package:flutter/material.dart';

class CreateCampaignModel {
  final String title;
  final List<CampaignRow> rows;
  final ActiveEditRowItem? activeEditItem;

  const CreateCampaignModel({
    required this.rows,
    required this.title,
    this.activeEditItem,
  });

  static CampaignRow defaultRow(bool? isRemote) {
    return CampaignRow(
      button: defaultButton(),
      description: '',
      subtitle: '',
      image: RowImage(isRemote: isRemote ?? false),
    );
  }

  static ButtonActionModel defaultButton() {
    /// I am using static texts here because at initialization of the app
    /// context is not set, so there are some null errors.
    return ButtonActionModel(
      buttonText: 'Button text',
      backgroundColor: BColors.blue,
      link: const ButtonActionLink(type: ButtonLinkType.link, url: ''),
      placement: 'Center',
    );
  }

  static CreateCampaignModel defaultInfo(bool? isRemote) => CreateCampaignModel(
        title: '',
        rows: [
          defaultRow(isRemote),
        ],
      );

  factory CreateCampaignModel.initial() {
    return defaultInfo(null);
  }

  CreateCampaignModel copyWith({
    String? title,
    List<CampaignRow>? rows,
    ActiveEditRowItem? activeEditItem,
  }) {
    return CreateCampaignModel(
      title: title ?? this.title,
      rows: rows ?? this.rows,
      activeEditItem: activeEditItem ?? this.activeEditItem,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'rows': _convertRowsListToJson(rows),
    };
  }

  static CreateCampaignModel fromJson(Map<String, dynamic> json) {
    return CreateCampaignModel(
      title: json['title'],
      rows: _convertRowsListFromJson(json['rows']),
    );
  }

  List<Map<String, dynamic>> _convertRowsListToJson(List<CampaignRow> rows) {
    List<Map<String, dynamic>> rowsJson = [];

    for (CampaignRow element in rows) {
      Map<String, dynamic> row = element.toJson();
      rowsJson.add(row);
    }

    return rowsJson;
  }

  static List<CampaignRow> _convertRowsListFromJson(List<dynamic> rowsJson) {
    List<CampaignRow> rows = [];

    for (var element in rowsJson) {
      CampaignRow row = CampaignRow.fromJson(element);
      rows.add(row);
    }

    return rows;
  }
}

class ButtonPlacement {
  static final String center = TextLocalization.center;
  static final String right = TextLocalization.right;
  static final String left = TextLocalization.left;
}

class ButtonActionModel {
  final String buttonText;
  final Color backgroundColor;
  final ButtonActionLink? link;
  final String placement;

  ButtonActionModel({
    required this.buttonText,
    required this.backgroundColor,
    this.link,
    required this.placement,
  });

  ButtonActionModel copyWith({
    String? buttonText,
    Color? backgroundColor,
    ButtonActionLink? link,
    String? placement,
  }) {
    return ButtonActionModel(
      buttonText: buttonText ?? this.buttonText,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      link: link ?? this.link,
      placement: placement ?? this.placement,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buttonText': buttonText,
      'placement': placement,
      'backgroundColor': convertColorToString(backgroundColor),
      'link': link?.toJson(),
    };
  }

  static ButtonActionModel fromJson(Map<String, dynamic> json) {
    return ButtonActionModel(
      buttonText: json['buttonText'],
      placement: json['placement'],
      backgroundColor: convertStringToColor(
        json['backgroundColor'],
      ),
      link:
          json['link'] != null ? ButtonActionLink.fromJson(json['link']) : null,
    );
  }
}

class ButtonActionLink {
  final String type;
  final String url;

  const ButtonActionLink({required this.type, required this.url});

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'url': url,
    };
  }

  static ButtonActionLink fromJson(Map<String, dynamic> json) {
    return ButtonActionLink(
      type: json['type'],
      url: json['url'],
    );
  }

  ButtonActionLink copyWith({String? type, String? url}) {
    return ButtonActionLink(
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }
}

enum RowProperty {
  image,
  subtitle,
  description,
  button,
  videoUrl,
  audioUrl,
}

class CampaignRow {
  final RowImage? image;
  final String? subtitle;
  final String? description;
  final ButtonActionModel? button;
  final String? videoUrl;
  final String? audioUrl;

  const CampaignRow({
    this.image,
    this.subtitle,
    this.button,
    this.description,
    this.audioUrl,
    this.videoUrl,
  });

  CampaignRow copyWith({
    RowImage? image,
    String? subtitle,
    String? description,
    String? audioUrl,
    String? videoUrl,
    ButtonActionModel? button,
  }) {
    return CampaignRow(
      image: image ?? this.image,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      audioUrl: audioUrl ?? this.audioUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      button: button ?? this.button,
    );
  }

  CampaignRow deleteProperty(RowProperty property) {
    return CampaignRow(
      image: property == RowProperty.image ? null : image,
      subtitle: property == RowProperty.subtitle ? null : subtitle,
      description: property == RowProperty.description ? null : description,
      audioUrl: property == RowProperty.audioUrl ? null : audioUrl,
      videoUrl: property == RowProperty.videoUrl ? null : videoUrl,
      button: property == RowProperty.button ? null : button,
    );
  }

  static CampaignRow fromJson(dynamic json) {
    return CampaignRow(
      subtitle: json['subtitle'],
      image: json['image'] != null ? RowImage.fromJson(json['image']) : null,
      description: json['description'],
      audioUrl: json['audioUrl'],
      videoUrl: json['videoUrl'],
      button: json['button'] != null
          ? ButtonActionModel.fromJson(json['button'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtitle': subtitle,
      'description': description,
      'image': image?.toJson(),
      'audioUrl': audioUrl,
      'videoUrl': videoUrl,
      'button': button?.toJson(),
    };
  }
}

class RowImage {
  final String? path;
  final bool isRemote;
  final bool isGif;

  const RowImage({this.path, this.isGif = false, this.isRemote = true});

  RowImage copyWith({String? path, bool? isRemote, bool? isGif}) {
    return RowImage(
      path: path ?? this.path,
      isGif: isGif ?? this.isGif,
      isRemote: isRemote ?? this.isRemote,
    );
  }

  static RowImage fromJson(dynamic json) {
    return RowImage(
      path: json['path'],
      isGif: json['isGif'],
      isRemote: json['isRemote'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'isGif': isGif,
      'isRemote': isRemote,
    };
  }
}

class ActiveEditRowItem {
  final int index;
  final RowProperty property;

  const ActiveEditRowItem({required this.property, required this.index});
}
