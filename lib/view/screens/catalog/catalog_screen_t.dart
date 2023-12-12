import 'package:flutter/material.dart';
import 'package:toyfarn_project/viewmodel/widgets/post_lister/post_lister_viewmodel.dart'; // Import ViewModel

class CatalogScreenSelect extends StatelessWidget {
  static const String screenName = 'catalog_screen';
  final int idListing;

  const CatalogScreenSelect({super.key, required this.idListing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostListerViewModel.buildAppBar(context), // se manda llamar al viewmodel
      body: const PostListerViewModel(idListing: 2023113045059999), // lo mismo
    );
  }
}