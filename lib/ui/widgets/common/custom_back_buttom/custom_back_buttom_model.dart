import 'package:busha/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomBackButtomModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void popPage() {
    _navigationService.back();
  }
}
