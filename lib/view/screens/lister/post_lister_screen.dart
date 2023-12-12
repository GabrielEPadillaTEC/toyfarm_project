import 'package:flutter/material.dart';
import 'package:toyfarn_project/viewmodel/widgets/post_lister/post_lister_viewmodel.dart'; // Import ViewModel

class PostListerScreen extends StatelessWidget {
  static const String screenName = 'post_lister_screen';

  const PostListerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostListerViewModel.buildAppBar(context), // se manda llamar al viewmodel
      body: const PostListerViewModel(idListing: 2023113045059999), // lo mismo
    );
  }
}
