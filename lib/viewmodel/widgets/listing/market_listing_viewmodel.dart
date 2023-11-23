import 'package:flutter/material.dart';
import 'package:toyfarn_project/model/listing/market_listing_model.dart';

class MarketListingViewModel {
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

  static Widget buildBody(BuildContext context) {
    // viene de dto, son valores falsos, aun se tiene que implementar
    PostListingDetails postDetails = PostListingDetails(
      title: 'Product Title',
      price: '\$100',
      description: 'Product description and requirements go here.',
      vendorName: 'Vendor Name',
      vendorDetails: 'https://www.vendorwebsite.com', // lo mismo
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildImageCarousel(), // aqui va el carrusel
          const SizedBox(height: 16.0),
          _buildTitle(postDetails.title),
          _buildPrice(postDetails.price),
          _buildDescription(postDetails.description),
          const SizedBox(height: 16.0),
          _buildContactButton(context),
          const SizedBox(height: 16.0),
          _buildActionButtons(),
          const SizedBox(height: 16.0),
          _buildVendorInfo(postDetails.vendorName, postDetails.vendorDetails),
        ],
      ),
    );
  }

  static Widget _buildImageCarousel() {
    // aqui van las imagenes de carrusel, aun no implementado
    return Container(
      height: 200.0,
      color: Colors.grey, // para que no se vea blanco, y que se note que falta algo
    );
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
        Navigator.pushNamed(context, '/chat');
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
