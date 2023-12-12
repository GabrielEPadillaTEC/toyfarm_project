import 'package:flutter/material.dart';
import 'package:toyfarn_project/viewmodel/widgets/listing/market_listing_viewmodel.dart'; // Import ViewModel

class MarketListingScreen extends StatelessWidget {
  static const String screenName = 'market_listing_screen';

  const MarketListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MarketListingViewModel.buildAppBar(context), // se manda llamar al viewmodel
      body: const MarketListingViewModel(idListing: 2023113045059999), // lo mismo
    );
  }
}
