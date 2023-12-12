import 'package:flutter/material.dart';
import 'package:toyfarn_project/viewmodel/widgets/slideMenu/slide_menu.dart';

import '../../../model/dtos/catalog_dto.dart';

class ModelCatalogScreen extends StatelessWidget{
  static const String screenName = 'catalog_screen';
  static const String screenNameHome = 'home_catalog_screen';
  static const String screenNameModel = 'model_catalog_screen';
  static const String screenNameService = 'services_catalog_screen';
  static const String screenNameListings = 'listigs_catalog_screen';

  const ModelCatalogScreen({Key? key, required this.option}) : super(key: key);
  final String option;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildCatalog(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }

  AppBar _buildAppBar() {
    String appBarTitle = 'Model Catalog'; // Default title

    // Update title based on the option
    if (option == 'listings') {
      appBarTitle = 'Listings Catalog';
    } else if (option == 'services') {
      appBarTitle = 'Services & Printing';
    } else if (option == 'models') {
      appBarTitle = '3D Models & Resources';
    } else if (option == 'home') {
    appBarTitle = 'Toyfarm Home';
    }

    return AppBar(
      title: Text(appBarTitle),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // TODO: Add search functionality
          },
        ),
      ],
    );
  }

 Widget _buildCatalog() {

    if (option == 'listings') {
      List<ModelCatalogDTO> models = [
        ModelCatalogDTO(name: 'Model 1', cost: 'Cost 1' ),
        ModelCatalogDTO(name: 'Model 2', cost: 'Cost 2' ),
        ModelCatalogDTO(name: 'Model 3', cost: 'Cost 3' ),
        // ... valores locales de prueba
      ];
      return _buildOptionCatalog(models);

    } else if (option == 'services') {
      List<ModelCatalogDTO> models = [
        ModelCatalogDTO(name: 'Model 4', cost: 'Cost 1' ),
        ModelCatalogDTO(name: 'Model 5', cost: 'Cost 2' ),
        ModelCatalogDTO(name: 'Model 6', cost: 'Cost 3' ),
        // ... valores locales de prueba
      ];
      return _buildOptionCatalog(models);

    } else if (option == 'models') {
      List<ModelCatalogDTO> models = [
        ModelCatalogDTO(name: 'Model 7', cost: 'Cost 1' ),
        ModelCatalogDTO(name: 'Model 8', cost: 'Cost 2' ),
        ModelCatalogDTO(name: 'Model 9', cost: 'Cost 3' ),
        // ... valores locales de prueba
      ];
      return _buildOptionCatalog(models);

    } else {
      return Container(
        color: const Color(0xFFFCE9D3), // Very pale orange
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to ToyFarm!',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Image.asset(
              'assets/images/logo.png',
              height: 100.0,
              width: 100.0,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Home to creators and hobbyists alike',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'We currently host a variety of services',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'News:',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Pellentesque euismod justo vel dolor malesuada, vel pharetra ligula hendrerit.',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'About us:',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Pellentesque euismod justo vel dolor malesuada, vel pharetra ligula hendrerit.',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
            // Chess piece image with 20% opacity
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/images/LightPawn.webp',
                height: 100.0,
                width: 100.0,
              ),
            ),
          ],
        ),
      );
    }
  }
  Widget _buildOptionCatalog(List<ModelCatalogDTO> models) {

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0, // espacio de ancho entre items
        mainAxisSpacing: 15.0, // espacio de altura entre items
      ),
      itemCount: models.length,
      itemBuilder: (context, index) {
        return _buildModelItem(models[index]);
      },
    );
  }

  Widget _buildModelItem(ModelCatalogDTO model) {
    //esto esta en vista pero deberia estar en viewmodel, pendiente
    //implementar un dto real
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/placeholderitem.PNG',
            // Replace with actual image URL or path
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
         // const SizedBox(height: 7.0), // no tocar
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  //const SizedBox(height: 7.0),
                  Text(model.cost),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


