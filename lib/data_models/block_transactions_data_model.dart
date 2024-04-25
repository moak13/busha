import 'transactions_data_model.dart';

class BlockTransactionsDataModel {
  String? hash;
  List<TransactionsDataModel>? tx;

  BlockTransactionsDataModel({
    this.hash,
    this.tx,
  });

  BlockTransactionsDataModel.fromJson(Map<String, dynamic> json) {
    hash = json['hash'];
    if (json['tx'] != null) {
      tx = <TransactionsDataModel>[];
      json['tx'].forEach((v) {
        tx!.add(TransactionsDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hash'] = hash;
    if (tx != null) {
      data['tx'] = tx!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
