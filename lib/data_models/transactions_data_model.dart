class TransactionsDataModel {
  String? hash;
  int? size;
  int? txIndex;
  int? time;
  int? blockIndex;
  int? blockHeight;

  TransactionsDataModel({
    this.hash,
    this.size,
    this.txIndex,
    this.time,
    this.blockIndex,
    this.blockHeight,
  });

  DateTime get converted {
    final value = DateTime.fromMillisecondsSinceEpoch(time ?? 0);
    return value;
  }

  TransactionsDataModel.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    size = json['size'];
    txIndex = json['tx_index'];
    time = json['time'];
    blockIndex = json['block_index'];
    blockHeight = json['block_height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hash'] = hash;
    data['size'] = size;
    data['tx_index'] = txIndex;
    data['time'] = time;
    data['block_index'] = blockIndex;
    data['block_height'] = blockHeight;
    return data;
  }
}
