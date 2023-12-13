import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toyfarn_project/config/menu/menu_items.dart';
import 'package:toyfarn_project/viewmodel/widgets/slideMenu/slide_menu.dart';
import 'package:toyfarn_project/domain/entities/offer.dart';
import 'package:toyfarn_project/viewmodel/providers/profile_viewmodel.dart';
import 'package:toyfarn_project/viewmodel/providers/listing_viewmodel.dart';

import '../../../config/helpers/offerDio.dart';
import '../../../config/helpers/userOffersDio.dart';

class PostListerViewModel extends StatelessWidget {

  final String userUID;
  final int opcionSelect;
  //ofers 1
  //listings 2

  const PostListerViewModel({super.key, required this.userUID,required this.opcionSelect});

  @override
  Widget build(BuildContext context) {
    //final postListingViewModel = PostListingViewModel();
    final api = UserListerApiService();

    return SingleChildScrollView(
        child: FutureBuilder(
            future: api.getUserOffersListings(userUID,opcionSelect),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.done)
                  ? _buildOffers(api.offerList)
                  : const Center(
                child: CircularProgressIndicator(
                  color: Colors.cyan,
                ),
              ); // Pass the offers to the widget
            }));
  }


  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Market Listing')
    );
  }

  Widget _buildOffers(List<OfferEntity> offers) {
    if (offers.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        child: const Text(
          'No offers yet',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Offers:'),
        for (var offer in offers) _buildOfferItem(offer),
      ],
    );
  }

  Widget _buildOfferItem(OfferEntity offer) {
    // Create a ProfileViewModel for each offer
    final profileViewModel = ProfileViewModel();
    //profileViewModel.fetchUserProfile(offer.userProfileId);

    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: FutureBuilder(
            future: profileViewModel.fetchUserProfile(offer.userProfileId),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.done)
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage(
                            profileViewModel.userProfile.profileImageUrl),
                        // You can use the actual image URL or path from the ProfileViewModel
                        // profileViewModel.userProfile.profileImageUrl,
                      ),
                      const SizedBox(width: 8.0),
                      // Display the user's name from the ProfileViewModel
                      Text(
                        // Use the actual user's name from the ProfileViewModel
                        // profileViewModel.userProfile.name,
                        profileViewModel.userProfile.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    // Display the offer details
                    'Offer \$${offer.offerValue} on ${offer.date}',
                    style: const TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle the green checkmark button press
                        },
                        icon: const Icon(Icons.check, color: Colors.white),
                        label: const Text('Accept',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle the red X button press
                        },
                        icon: const Icon(Icons.clear, color: Colors.white),
                        label: const Text('Reject',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              )
                  : const Center(
                child: CircularProgressIndicator(
                  color: Colors.cyan,
                ),
              );
            }));
  }

}


