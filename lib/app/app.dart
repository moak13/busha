import 'package:busha/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:busha/ui/views/login/login_view.dart';
import 'package:busha/ui/views/wrapper/wrapper_view.dart';
import 'package:busha/ui/views/explore/explore_view.dart';
import 'package:busha/ui/views/portfolio/portfolio_view.dart';
import 'package:busha/ui/views/earn/earn_view.dart';
import 'package:busha/ui/views/spend/spend_view.dart';
import 'package:busha/ui/views/connect/connect_view.dart';
import 'package:busha/ui/views/transactions/transactions_view.dart';
import 'package:busha/ui/views/transaction_details/transaction_details_view.dart';
import 'package:busha/services/dio_service.dart';
import 'package:busha/services/bitcoin_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(
      page: StartupView,
      initial: true,
    ),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: WrapperView),
    AdaptiveRoute(page: ExploreView),
    AdaptiveRoute(page: PortfolioView),
    AdaptiveRoute(page: EarnView),
    AdaptiveRoute(page: SpendView),
    AdaptiveRoute(page: ConnectView),
    AdaptiveRoute(page: TransactionsView),
    AdaptiveRoute(page: TransactionDetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DioService),
    LazySingleton(classType: BitcoinService),
// @stacked-service
  ],
  logger: StackedLogger(),
)
class App {}
