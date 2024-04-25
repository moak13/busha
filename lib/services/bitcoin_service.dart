import 'package:busha/app/app.locator.dart';
import 'package:busha/data_models/block_transactions_data_model.dart';
import 'package:busha/data_models/latest_block_data_model.dart';
import 'package:busha/enums/http_verbs.dart';

import 'dio_service.dart';

class BitcoinService {
  final _dioService = locator<DioService>();

  Future<LatestBlockDataModel?> fetchLatestBlock() async {
    final response = await _dioService.makeHttpRequest(
      verb: HttpVerbs.get,
      path: 'https://blockchain.info/latestblock',
    );

    return LatestBlockDataModel.fromJson(response);
  }

  Future<BlockTransactionsDataModel?> fetchBlockTransactions({
    required String blockHash,
  }) async {
    final response = await _dioService.makeHttpRequest(
      verb: HttpVerbs.get,
      path: 'https://blockchain.info/rawblock/$blockHash',
    );

    return BlockTransactionsDataModel.fromJson(response);
  }
}
