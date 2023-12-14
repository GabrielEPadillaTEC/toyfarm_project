import 'package:flutter/material.dart';
import 'package:toyfarn_project/viewmodel/widgets/post_lister/post_lister_viewmodel.dart'; // Import ViewModel

class PostListerScreen extends StatelessWidget {
  static const String screenName = 'post_lister_screen';
  static const String screenNameLister = 'post_lister_screen_offer';
  static const String screenNameOffers = 'post_lister_screen_listings';

  const PostListerScreen({Key? key, required this.option, required this.userUID}) : super(key: key);
  final String option;
  final String userUID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostListerViewModel.buildAppBar(context, option), // se manda llamar al viewmodel
      body: PostListerViewModel(userUID: userUID, optionSelect: option), // lo mismo
    );
  }
}
