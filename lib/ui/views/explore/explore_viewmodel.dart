import 'package:busha/app/app.locator.dart';
import 'package:busha/app/app.logger.dart';
import 'package:busha/app/app.router.dart';
import 'package:busha/data_models/assets_data_model.dart';
import 'package:busha/data_models/latest_block_data_model.dart';
import 'package:busha/data_models/mover_data_model.dart';
import 'package:busha/data_models/news_data_model.dart';
import 'package:busha/enums/asset_type.dart';
import 'package:busha/exception/busha_exception.dart';
import 'package:busha/services/bitcoin_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _balanceDelayFuture = 'delayedBalance';
const String _assetsDelayFuture = 'delayedAssets';
const String _moversDelayFuture = 'delayedMovers';
const String _newsDelayFuture = 'delayedNews';

class ExploreViewModel extends MultipleFutureViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _bitcoinService = locator<BitcoinService>();
  final _logger = getLogger('ExploreViewModel');

  bool showBalance = false;
  String? errorMessage;
  String? blockHash;

  void toggleBalanceVisibility() {
    showBalance = !showBalance;
    rebuildUi();
  }

  void actionSeeAllMovers() {}

  void actionViewMoreNewsTrends() {}

  final List<MoverDataModel> _moversList = [
    MoverDataModel(
      image: 'assets/png/ethereum.png',
      title: 'Ethereum',
      dipped: true,
      percent: 1.76,
    ),
    MoverDataModel(
      image: 'assets/png/bitcoin.png',
      title: 'Bitcoin',
      dipped: false,
      percent: 1.76,
    ),
    MoverDataModel(
      image: 'assets/png/solana.png',
      title: 'Solana',
      dipped: false,
      percent: 1.76,
    ),
  ];

  List<MoverDataModel> moversList = [];

  final List<NewsDataModel> _newsList = [
    NewsDataModel(
      image: 'assets/png/elon.png',
      headline:
          'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
      company: 'CoinDesk',
      timeAgo: '2h',
    ),
    NewsDataModel(
      image: 'assets/png/elon.png',
      headline:
          'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
      company: 'CoinDesk',
      timeAgo: '2h',
    ),
    NewsDataModel(
      image: 'assets/png/elon.png',
      headline:
          'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
      company: 'CoinDesk',
      timeAgo: '2h',
    ),
    NewsDataModel(
      image: 'assets/png/elon.png',
      headline:
          'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
      company: 'CoinDesk',
      timeAgo: '2h',
    ),
  ];

  List<NewsDataModel> newsList = [];

  final List<AssetsDataModel> _assetsList = [
    AssetsDataModel(
      image: 'assets/png/bitcoin.png',
      title: 'Bitcoin',
      shortHand: 'BTC',
      amount: '24,500,00',
      dipped: false,
      percentage: 1.76,
      assetType: AssetType.bitcoin,
    ),
    AssetsDataModel(
      image: 'assets/png/polygon.png',
      title: 'Ethereum',
      shortHand: 'ETH',
      amount: '4,500',
      dipped: true,
      percentage: 6.76,
      assetType: AssetType.ethereum,
    ),
    AssetsDataModel(
      image: 'assets/png/tezos.png',
      title: 'Tezos',
      shortHand: 'XTZ',
      amount: '4,500',
      dipped: false,
      percentage: 9.06,
      assetType: AssetType.tezos,
    ),
  ];

  List<AssetsDataModel> assetsList = [];

  Future<void> _fetchBalance() async {
    await runBusyFuture(Future.delayed(const Duration(seconds: 2)));
  }

  Future<LatestBlockDataModel?> _fetchMyAssets() async {
    try {
      final response = await _bitcoinService.fetchLatestBlock();
      assetsList = _assetsList;
      blockHash = response?.hash;
      return response;
    } on BushaException catch (e) {
      setError(true);
      errorMessage = e.message;
      return null;
    } catch (e) {
      setError(true);
      errorMessage = 'Unknown error has occured';
      return null;
    }
  }

  Future<void> _fetchTopMovers() async {
    await runBusyFuture(Future.delayed(const Duration(seconds: 3)));
    moversList = _moversList;
  }

  Future<void> _fetchTrendingNews() async {
    await runBusyFuture(Future.delayed(const Duration(seconds: 2)));
    newsList = _newsList;
  }

  void actionReadNews() {}

  void actionSeeMyAssets() {}

  bool get fetchingBalance => busy(_balanceDelayFuture);
  bool get fetchingAssets => busy(_assetsDelayFuture);
  bool get fetchingMovers => busy(_moversDelayFuture);
  bool get fetchingNews => busy(_newsDelayFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
        _assetsDelayFuture: _fetchMyAssets,
        _moversDelayFuture: _fetchTopMovers,
        _newsDelayFuture: _fetchTrendingNews,
        _balanceDelayFuture: _fetchBalance,
      };

  void actionSearch() {}

  void viewNotifications() {}

  void actionScan() {}

  void moveToTransactionsView({required AssetsDataModel asset}) {
    if (asset.assetType != AssetType.bitcoin) {
      _snackbarService.showSnackbar(
        title: 'Info',
        message:
            'We currently can\'t fetch transactions for your ${asset.shortHand} asset',
      );
      return;
    }
    _logger.i('gottenHash: $blockHash');
    final assets = asset.copyWith(blockHash: blockHash);
    _navigationService.navigateToTransactionsView(assets: assets);
  }
}
