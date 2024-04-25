import 'package:busha/ui/views/connect/connect_view.dart';
import 'package:busha/ui/views/earn/earn_view.dart';
import 'package:busha/ui/views/explore/explore_view.dart';
import 'package:busha/ui/views/portfolio/portfolio_view.dart';
import 'package:busha/ui/views/spend/spend_view.dart';
import 'package:flutter/material.dart';

class GetViewByIndex extends StatelessWidget {
  final int index;
  const GetViewByIndex({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const ExploreView();
      case 1:
        return const PortfolioView();
      case 2:
        return const EarnView();
      case 3:
        return const SpendView();
      case 4:
        return const ConnectView();
      default:
        return const ExploreView();
    }
  }
}
