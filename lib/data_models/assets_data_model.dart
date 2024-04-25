import 'package:busha/enums/asset_type.dart';

class AssetsDataModel {
  String image;
  String title;
  String shortHand;
  String amount;
  bool dipped;
  double percentage;
  AssetType assetType;
  String? blockHash;

  AssetsDataModel({
    required this.image,
    required this.title,
    required this.shortHand,
    required this.amount,
    required this.dipped,
    required this.percentage,
    required this.assetType,
    this.blockHash,
  });

  AssetsDataModel copyWith({
    String? image,
    String? title,
    String? shortHand,
    String? amount,
    bool? dipped,
    double? percentage,
    AssetType? assetType,
    String? blockHash,
  }) {
    return AssetsDataModel(
      image: image ?? this.image,
      title: title ?? this.title,
      shortHand: shortHand ?? this.shortHand,
      amount: amount ?? this.amount,
      dipped: dipped ?? this.dipped,
      percentage: percentage ?? this.percentage,
      assetType: assetType ?? this.assetType,
      blockHash: blockHash ?? this.blockHash,
    );
  }
}
