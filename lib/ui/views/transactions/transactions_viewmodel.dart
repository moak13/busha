import 'package:busha/app/app.locator.dart';
import 'package:busha/app/app.logger.dart';
import 'package:busha/app/app.router.dart';
import 'package:busha/data_models/block_transactions_data_model.dart';
import 'package:busha/data_models/transactions_data_model.dart';
import 'package:busha/exception/busha_exception.dart';
import 'package:busha/services/bitcoin_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TransactionsViewModel
    extends FutureViewModel<BlockTransactionsDataModel?> {
  final _navigationService = locator<NavigationService>();
  final _bitcoinService = locator<BitcoinService>();
  final _logger = getLogger('TransactionsViewModel');

  TransactionsViewModel({String? blockHash}) {
    _logger.i('blockHash: $blockHash');
    _blockHash = blockHash;
  }

  String? _blockHash;

  void moveToTransactionDetails({TransactionsDataModel? tx}) {
    _navigationService.navigateToTransactionDetailsView(tx: tx!);
  }

  Future<BlockTransactionsDataModel?> _fetchTransactions() async {
    try {
      final response =
          await _bitcoinService.fetchBlockTransactions(blockHash: _blockHash!);
      return response;
    } on BushaException catch (e) {
      setError(true);
      setMessage(e.message);
      return null;
    } catch (e) {
      setError(true);
      setMessage('Unknown error has occurred!');
      return null;
    }
  }

  @override
  Future<BlockTransactionsDataModel?> futureToRun() => _fetchTransactions();
}
