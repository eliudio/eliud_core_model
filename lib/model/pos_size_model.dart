/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 pos_size_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/base/model_base.dart';

import 'package:eliud_core_model/model/entity_export.dart';

import 'package:eliud_core_model/model/pos_size_entity.dart';

enum WidthTypePortrait { absoluteWidth, percentageWidth, unknown }

enum WidthTypeLandscape { absoluteWidth, percentageWidth, unknown }

enum HeightTypePortrait { absoluteHeight, percentageHeight, unknown }

enum HeightTypeLandscape { absoluteHeight, percentageHeight, unknown }

enum PortraitFitType {
  portraitFitWidth,
  portraitFitHeight,
  portraitFill,
  portraitNone,
  portraitContain,
  portraitCover,
  portraitScaleDown,
  unknown
}

enum LandscapeFitType {
  landscapeFitWidth,
  landscapeFitHeight,
  landscapeFill,
  landscapeNone,
  landscapeContain,
  landscapeCover,
  landscapeScaleDown,
  unknown
}

enum PortraitAlignType {
  portraitAlignTopLeft,
  portraitAlignTopCenter,
  portraitAlignTopRight,
  portraitAlignCenterLeft,
  portraitAlignCenter,
  portraitAlignCenterRight,
  portraitAlignBottomLeft,
  portraitAlignBottomCenter,
  portraitAlignBottomRight,
  unknown
}

enum LandscapeAlignType {
  landscapeAlignTopLeft,
  landscapeAlignTopCenter,
  landscapeAlignTopRight,
  landscapeAlignCenterLeft,
  landscapeAlignCenter,
  landscapeAlignCenterRight,
  landscapeAlignBottomLeft,
  landscapeAlignBottomCenter,
  landscapeAlignBottomRight,
  unknown
}

enum ClipType {
  noClip,
  clipOval,
  clipRRect5,
  clipRRect10,
  clipRRect15,
  clipRRect20,
  clipRRect30,
  clipRRect40,
  unknown
}

WidthTypePortrait toWidthTypePortrait(int? index) {
  switch (index) {
    case 0:
      return WidthTypePortrait.absoluteWidth;
    case 1:
      return WidthTypePortrait.percentageWidth;
  }
  return WidthTypePortrait.unknown;
}

WidthTypeLandscape toWidthTypeLandscape(int? index) {
  switch (index) {
    case 0:
      return WidthTypeLandscape.absoluteWidth;
    case 1:
      return WidthTypeLandscape.percentageWidth;
  }
  return WidthTypeLandscape.unknown;
}

HeightTypePortrait toHeightTypePortrait(int? index) {
  switch (index) {
    case 0:
      return HeightTypePortrait.absoluteHeight;
    case 1:
      return HeightTypePortrait.percentageHeight;
  }
  return HeightTypePortrait.unknown;
}

HeightTypeLandscape toHeightTypeLandscape(int? index) {
  switch (index) {
    case 0:
      return HeightTypeLandscape.absoluteHeight;
    case 1:
      return HeightTypeLandscape.percentageHeight;
  }
  return HeightTypeLandscape.unknown;
}

PortraitFitType toPortraitFitType(int? index) {
  switch (index) {
    case 0:
      return PortraitFitType.portraitFitWidth;
    case 1:
      return PortraitFitType.portraitFitHeight;
    case 2:
      return PortraitFitType.portraitFill;
    case 3:
      return PortraitFitType.portraitNone;
    case 4:
      return PortraitFitType.portraitContain;
    case 5:
      return PortraitFitType.portraitCover;
    case 6:
      return PortraitFitType.portraitScaleDown;
  }
  return PortraitFitType.unknown;
}

LandscapeFitType toLandscapeFitType(int? index) {
  switch (index) {
    case 0:
      return LandscapeFitType.landscapeFitWidth;
    case 1:
      return LandscapeFitType.landscapeFitHeight;
    case 2:
      return LandscapeFitType.landscapeFill;
    case 3:
      return LandscapeFitType.landscapeNone;
    case 4:
      return LandscapeFitType.landscapeContain;
    case 5:
      return LandscapeFitType.landscapeCover;
    case 6:
      return LandscapeFitType.landscapeScaleDown;
  }
  return LandscapeFitType.unknown;
}

PortraitAlignType toPortraitAlignType(int? index) {
  switch (index) {
    case 0:
      return PortraitAlignType.portraitAlignTopLeft;
    case 1:
      return PortraitAlignType.portraitAlignTopCenter;
    case 2:
      return PortraitAlignType.portraitAlignTopRight;
    case 3:
      return PortraitAlignType.portraitAlignCenterLeft;
    case 4:
      return PortraitAlignType.portraitAlignCenter;
    case 5:
      return PortraitAlignType.portraitAlignCenterRight;
    case 6:
      return PortraitAlignType.portraitAlignBottomLeft;
    case 7:
      return PortraitAlignType.portraitAlignBottomCenter;
    case 8:
      return PortraitAlignType.portraitAlignBottomRight;
  }
  return PortraitAlignType.unknown;
}

LandscapeAlignType toLandscapeAlignType(int? index) {
  switch (index) {
    case 0:
      return LandscapeAlignType.landscapeAlignTopLeft;
    case 1:
      return LandscapeAlignType.landscapeAlignTopCenter;
    case 2:
      return LandscapeAlignType.landscapeAlignTopRight;
    case 3:
      return LandscapeAlignType.landscapeAlignCenterLeft;
    case 4:
      return LandscapeAlignType.landscapeAlignCenter;
    case 5:
      return LandscapeAlignType.landscapeAlignCenterRight;
    case 6:
      return LandscapeAlignType.landscapeAlignBottomLeft;
    case 7:
      return LandscapeAlignType.landscapeAlignBottomCenter;
    case 8:
      return LandscapeAlignType.landscapeAlignBottomRight;
  }
  return LandscapeAlignType.unknown;
}

ClipType toClipType(int? index) {
  switch (index) {
    case 0:
      return ClipType.noClip;
    case 1:
      return ClipType.clipOval;
    case 2:
      return ClipType.clipRRect5;
    case 3:
      return ClipType.clipRRect10;
    case 4:
      return ClipType.clipRRect15;
    case 5:
      return ClipType.clipRRect20;
    case 6:
      return ClipType.clipRRect30;
    case 7:
      return ClipType.clipRRect40;
  }
  return ClipType.unknown;
}

class PosSizeModel {
  static const String packageName = 'eliud_core_model';
  static const String id = 'posSizes';

  double? widthPortrait;

  // Is width an absolute value or a percentage of the device width?
  WidthTypePortrait? widthTypePortrait;
  double? widthLandscape;

  // Is width an absolute value or a percentage of the device width?
  WidthTypeLandscape? widthTypeLandscape;
  double? heightPortrait;

  // Is height an absolute value or a percentage of the device height?
  HeightTypePortrait? heightTypePortrait;
  double? heightLandscape;

  // Is height an absolute value or a percentage of the device height?
  HeightTypeLandscape? heightTypeLandscape;

  // How to fit the item within the box, when portrait
  PortraitFitType? fitPortrait;

  // How to fit the item within the box, when landscape
  LandscapeFitType? fitLandscape;

  // Align when Portrait
  PortraitAlignType? alignTypePortrait;

  // Align when Landscape
  LandscapeAlignType? alignTypeLandscape;

  // Clip
  ClipType? clip;

  PosSizeModel({
    this.widthPortrait,
    this.widthTypePortrait,
    this.widthLandscape,
    this.widthTypeLandscape,
    this.heightPortrait,
    this.heightTypePortrait,
    this.heightLandscape,
    this.heightTypeLandscape,
    this.fitPortrait,
    this.fitLandscape,
    this.alignTypePortrait,
    this.alignTypeLandscape,
    this.clip,
  });

  PosSizeModel copyWith({
    double? widthPortrait,
    WidthTypePortrait? widthTypePortrait,
    double? widthLandscape,
    WidthTypeLandscape? widthTypeLandscape,
    double? heightPortrait,
    HeightTypePortrait? heightTypePortrait,
    double? heightLandscape,
    HeightTypeLandscape? heightTypeLandscape,
    PortraitFitType? fitPortrait,
    LandscapeFitType? fitLandscape,
    PortraitAlignType? alignTypePortrait,
    LandscapeAlignType? alignTypeLandscape,
    ClipType? clip,
  }) {
    return PosSizeModel(
      widthPortrait: widthPortrait ?? this.widthPortrait,
      widthTypePortrait: widthTypePortrait ?? this.widthTypePortrait,
      widthLandscape: widthLandscape ?? this.widthLandscape,
      widthTypeLandscape: widthTypeLandscape ?? this.widthTypeLandscape,
      heightPortrait: heightPortrait ?? this.heightPortrait,
      heightTypePortrait: heightTypePortrait ?? this.heightTypePortrait,
      heightLandscape: heightLandscape ?? this.heightLandscape,
      heightTypeLandscape: heightTypeLandscape ?? this.heightTypeLandscape,
      fitPortrait: fitPortrait ?? this.fitPortrait,
      fitLandscape: fitLandscape ?? this.fitLandscape,
      alignTypePortrait: alignTypePortrait ?? this.alignTypePortrait,
      alignTypeLandscape: alignTypeLandscape ?? this.alignTypeLandscape,
      clip: clip ?? this.clip,
    );
  }

  @override
  int get hashCode =>
      widthPortrait.hashCode ^
      widthTypePortrait.hashCode ^
      widthLandscape.hashCode ^
      widthTypeLandscape.hashCode ^
      heightPortrait.hashCode ^
      heightTypePortrait.hashCode ^
      heightLandscape.hashCode ^
      heightTypeLandscape.hashCode ^
      fitPortrait.hashCode ^
      fitLandscape.hashCode ^
      alignTypePortrait.hashCode ^
      alignTypeLandscape.hashCode ^
      clip.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PosSizeModel &&
          runtimeType == other.runtimeType &&
          widthPortrait == other.widthPortrait &&
          widthTypePortrait == other.widthTypePortrait &&
          widthLandscape == other.widthLandscape &&
          widthTypeLandscape == other.widthTypeLandscape &&
          heightPortrait == other.heightPortrait &&
          heightTypePortrait == other.heightTypePortrait &&
          heightLandscape == other.heightLandscape &&
          heightTypeLandscape == other.heightTypeLandscape &&
          fitPortrait == other.fitPortrait &&
          fitLandscape == other.fitLandscape &&
          alignTypePortrait == other.alignTypePortrait &&
          alignTypeLandscape == other.alignTypeLandscape &&
          clip == other.clip;

  @override
  String toString() {
    return 'PosSizeModel{widthPortrait: $widthPortrait, widthTypePortrait: $widthTypePortrait, widthLandscape: $widthLandscape, widthTypeLandscape: $widthTypeLandscape, heightPortrait: $heightPortrait, heightTypePortrait: $heightTypePortrait, heightLandscape: $heightLandscape, heightTypeLandscape: $heightTypeLandscape, fitPortrait: $fitPortrait, fitLandscape: $fitLandscape, alignTypePortrait: $alignTypePortrait, alignTypeLandscape: $alignTypeLandscape, clip: $clip}';
  }

  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  PosSizeEntity toEntity({String? appId}) {
    return PosSizeEntity(
      widthPortrait: (widthPortrait != null) ? widthPortrait : null,
      widthTypePortrait:
          (widthTypePortrait != null) ? widthTypePortrait!.index : null,
      widthLandscape: (widthLandscape != null) ? widthLandscape : null,
      widthTypeLandscape:
          (widthTypeLandscape != null) ? widthTypeLandscape!.index : null,
      heightPortrait: (heightPortrait != null) ? heightPortrait : null,
      heightTypePortrait:
          (heightTypePortrait != null) ? heightTypePortrait!.index : null,
      heightLandscape: (heightLandscape != null) ? heightLandscape : null,
      heightTypeLandscape:
          (heightTypeLandscape != null) ? heightTypeLandscape!.index : null,
      fitPortrait: (fitPortrait != null) ? fitPortrait!.index : null,
      fitLandscape: (fitLandscape != null) ? fitLandscape!.index : null,
      alignTypePortrait:
          (alignTypePortrait != null) ? alignTypePortrait!.index : null,
      alignTypeLandscape:
          (alignTypeLandscape != null) ? alignTypeLandscape!.index : null,
      clip: (clip != null) ? clip!.index : null,
    );
  }

  static Future<PosSizeModel?> fromEntity(PosSizeEntity? entity) async {
    if (entity == null) return null;
    return PosSizeModel(
      widthPortrait: entity.widthPortrait,
      widthTypePortrait: toWidthTypePortrait(entity.widthTypePortrait),
      widthLandscape: entity.widthLandscape,
      widthTypeLandscape: toWidthTypeLandscape(entity.widthTypeLandscape),
      heightPortrait: entity.heightPortrait,
      heightTypePortrait: toHeightTypePortrait(entity.heightTypePortrait),
      heightLandscape: entity.heightLandscape,
      heightTypeLandscape: toHeightTypeLandscape(entity.heightTypeLandscape),
      fitPortrait: toPortraitFitType(entity.fitPortrait),
      fitLandscape: toLandscapeFitType(entity.fitLandscape),
      alignTypePortrait: toPortraitAlignType(entity.alignTypePortrait),
      alignTypeLandscape: toLandscapeAlignType(entity.alignTypeLandscape),
      clip: toClipType(entity.clip),
    );
  }

  static Future<PosSizeModel?> fromEntityPlus(PosSizeEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return PosSizeModel(
      widthPortrait: entity.widthPortrait,
      widthTypePortrait: toWidthTypePortrait(entity.widthTypePortrait),
      widthLandscape: entity.widthLandscape,
      widthTypeLandscape: toWidthTypeLandscape(entity.widthTypeLandscape),
      heightPortrait: entity.heightPortrait,
      heightTypePortrait: toHeightTypePortrait(entity.heightTypePortrait),
      heightLandscape: entity.heightLandscape,
      heightTypeLandscape: toHeightTypeLandscape(entity.heightTypeLandscape),
      fitPortrait: toPortraitFitType(entity.fitPortrait),
      fitLandscape: toLandscapeFitType(entity.fitLandscape),
      alignTypePortrait: toPortraitAlignType(entity.alignTypePortrait),
      alignTypeLandscape: toLandscapeAlignType(entity.alignTypeLandscape),
      clip: toClipType(entity.clip),
    );
  }
}
