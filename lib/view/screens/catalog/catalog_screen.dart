import 'package:flutter/material.dart';

class ModelCatalogScreen extends StatelessWidget {
  static const String screenName = 'model_catalog_screen';

  const ModelCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildCatalog(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: const CircleAvatar(
        backgroundImage: AssetImage(
            'assets/images/your_profile_picture.jpg'), // No estoy seguro de como hacerle para ya cuando sea live
      ),
      title: const Text('Model Catalog'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // todo: se supone que va el buscador aqui
            // no funciona obvio
          },
        ),
      ],
    );
  }

  Widget _buildCatalog() {
    // se supone que ocupa un dto, pendiente
    List<ModelCatalogDTO> models = [
      ModelCatalogDTO('Model 1', 'Cost 1'),
      ModelCatalogDTO('Model 2', 'Cost 2'),
      ModelCatalogDTO('Model 3', 'Cost 3'),
      // ... valores locales de prueba
    ];

    //magia china del grid para nuestro catalogo
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
class ModelCatalogDTO {
  final String name;
  final String cost;

  ModelCatalogDTO(this.name, this.cost);
}

