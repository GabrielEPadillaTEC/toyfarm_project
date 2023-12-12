import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toyfarn_project/domain/entities/listing.dart';
import 'package:toyfarn_project/domain/entities/offer.dart';
import 'package:toyfarn_project/viewmodel/providers/profile_viewmodel.dart';
import 'package:toyfarn_project/viewmodel/providers/listing_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../config/helpers/offerDio.dart';

class MarketListingViewModel extends StatelessWidget  {
  final int idListing;

  const MarketListingViewModel({super.key, required this.idListing});

  static AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text('Market Listing'),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            _showPopupMenu(context);
          },
        ),
      ],
    );
  }

  static void _showPopupMenu(BuildContext context) {
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        Rect.fromPoints(
          overlay.localToGlobal(overlay.size.topRight(Offset.zero)),
          overlay.localToGlobal(overlay.size.topLeft(Offset.zero)),
        ),
        Offset.zero & overlay.size,
      ),
      items: [
        const PopupMenuItem<String>(
          value: 'hide',
          child: Text('Hide Post'),
        ),
        const PopupMenuItem<String>(
          value: 'report',
          child: Text('Report Post'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        // cuando haga algo es aqui
        print('Selected: $value');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final postListingViewModel = PostListingViewModel();
    final api=OfferApiService();

    return SingleChildScrollView(
        child: FutureBuilder(
            future: postListingViewModel.fetchUserProfile(idListing),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.done)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildImageCarousel(), // aqui va el carrusel
                        const SizedBox(height: 16.0),
                        _buildTitle(postListingViewModel.listingDetails.title),
                        _buildPrice(postListingViewModel.listingDetails.price),
                        _buildDescription(
                            postListingViewModel.listingDetails.description),
                        const SizedBox(height: 16.0),
                        _buildContactButton(context),
                        const SizedBox(height: 16.0),
                        _buildActionButtons(),
                        const SizedBox(height: 16.0),
                        _buildVendorInfo(
                            postListingViewModel.listingDetails.vendorName,
                            postListingViewModel.listingDetails.vendorDetails),
                        const SizedBox(height: 16.0),
                        FutureBuilder(
                          future: api.getOffers(idListing),
                          builder: (context, snapshot) {
                            return (snapshot.connectionState==ConnectionState.done)? _buildOffers(api.offerList):const Center(
                              child: CircularProgressIndicator(
                               color: Colors.cyan,
                                  ),
                                ); // Pass the offers to the widget
                           })
                           ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.cyan,
                      ),
                    );
            }));
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                              icon:
                                  const Icon(Icons.check, color: Colors.white),
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
                              icon:
                                  const Icon(Icons.clear, color: Colors.white),
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

  static Widget _buildImageCarousel() {

    // Replace these with your actual image URLs
    List<String> imageUrls = [
      'https://picsum.photos/200/300',
      'https://picsum.photos/200/300',
      'https://picsum.photos/200/300',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );



// aqui van las imagenes de carrusel, aun no implementado
    // return Container(
    //   height: 200.0,
    //   color: Colors.grey, // para que no se vea blanco, y que se note que falta algo
    // );
  }

  static Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }

  static Widget _buildPrice(String price) {
    return Text(
      price,
      style: const TextStyle(fontSize: 18.0, color: Colors.green),
    );
  }

  static Widget _buildDescription(String description) {
    return Text(
      description,
      style: const TextStyle(fontSize: 16.0),
    );
  }

  static Widget _buildContactButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
       // deberia llevarte al chat screen
        context.push('/chat');
      },
      icon: const Icon(Icons.chat),
      label: const Text('Contact Lister'),
    );
  }

  static Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(Icons.notifications, 'Alert'),
        _buildActionButton(Icons.send, 'Send Offer'),
        _buildActionButton(Icons.share, 'Share'),
        _buildActionButton(Icons.bookmark, 'Bookmark'),
      ],
    );
  }

  static Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            // este es un constructor generico para los botones
          },
        ),
        const SizedBox(height: 4.0),
        Text(label),
      ],
    );
  }

  static Widget _buildVendorInfo(String vendorName, String vendorDetails) {
    return Row(
      children: [
        //flex de 2/3
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Info about vendor',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      _buildVendorProfile(),
                      const SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vendorName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4.0),
                          // desde cuando se unio
                          const Text('Member Since: January 2023'), // fecha de creacion todo dto
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // flex de 1/3
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // paginas paginas
                    print('Vendor details tapped');
                  },
                  child: const Text(
                    'Details about vendor',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 8.0),
                _buildFollowButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildVendorProfile() {
    return const CircleAvatar(
      radius: 20.0,
      backgroundImage: AssetImage('assets/images/profile.PNG'),
    );
  }

  static Widget _buildFollowButton() {
    return ElevatedButton(
      onPressed: () {
        // no se como implementar esto pero luego lo averiguo
      },
      child: const Text('Follow'),
    );
  }
}
