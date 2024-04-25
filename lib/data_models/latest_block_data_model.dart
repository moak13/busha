class LatestBlockDataModel {
  String? hash;
  int? time;
  int? blockIndex;
  int? height;
  List<int>? txIndexes;

  LatestBlockDataModel({
    this.hash,
    this.time,
    this.blockIndex,
    this.height,
    this.txIndexes,
  });

  LatestBlockDataModel.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    time = json['time'];
    blockIndex = json['block_index'];
    height = json['height'];
    txIndexes = json['txIndexes'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hash'] = hash;
    data['time'] = time;
    data['block_index'] = blockIndex;
    data['height'] = height;
    data['txIndexes'] = txIndexes;
    return data;
  }
}
