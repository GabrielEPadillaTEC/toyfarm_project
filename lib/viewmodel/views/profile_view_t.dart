import 'package:flutter/material.dart';
import 'package:toyfarn_project/viewmodel/providers/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final profileViewModel = ProfileViewModel();
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: profileViewModel.fetchUserProfile(202311304505),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.done)
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(profileViewModel.userProfile.profileImageUrl),
                          ),
                          const SizedBox(height: 10),
                          //Nombre del perfil
                          Text(
                            profileViewModel.userProfile.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          //Lugar de ubicacion del perfil
                          Text(
                            profileViewModel.userProfile.location,
                            style: const TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          const SizedBox(height: 5),
                          //Descripcion del perfil
                          Text(
                            profileViewModel.userProfile.description,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            child: const Text('Follow'),
                          ),
                          const SizedBox(height: 10),
                          PopupMenuButton<String>(
                            itemBuilder: (BuildContext context) => [
                              const PopupMenuItem<String>(
                                value: 'ignore',
                                child: Text('Ignore User'),
                              ),
                              const PopupMenuItem<String>(
                                value: 'report',
                                child: Text('Report User'),
                              ),
                            ],
                            onSelected: (String result) {
                              // Handle menu item selection here
                              print('Selected: $result');
                            },
                            child: ElevatedButton.icon(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey),
                              icon: const Icon(Icons.settings),
                              label: const Text(''),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //valores locales, probar dto mas tarde

                              //Numero de Seguidores de la cuenta
                              Text('${profileViewModel.userProfile.followers} Followers'),
                              const SizedBox(width: 10),
                              Text('${profileViewModel.userProfile.following}  Following'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // tambien local luego veo como jalarlo
                          // valores acerca del usuario
                          //El About de, el usuario
                          _buildSection(context, 'ABOUT',
                              profileViewModel.userProfile.description ),
                          //Categoria del usuario
                          //e.g 'Category 1 / Category 2 / Category 3'
                          _buildSection(context, 'CATEGORY',
                              profileViewModel.userProfile.description),
                          //Sitio del usuario
                          //e.g www.sitio.com
                          _buildSection(context, 'WEBSITE',
                              profileViewModel.userProfile.website, true),
                          //Fecha en la que se unio nuestro usuario
                          //Ejemplo '2022-01-01'
                          _buildSection(context, 'MEMBER SINCE',
                              profileViewModel.userProfile.memberSince),
                          const SizedBox(height: 20),
                          // Estatisticas micelaneas, no sirven aun automaticamente
                          _buildSection(context, 'STATS'),
                          _buildStatsRow(context,
                              icon: Icons.remove_red_eye,
                              //Vistas al canal del usuario
                              label: 'Channel Views',
                              value: '${profileViewModel.userProfile.channelViews}'),
                          _buildStatsRow(context,
                              //Likes que ha recibido de manera colectiva en sus publicaciones
                              icon: Icons.star, label: 'Likes',
                              value: '${profileViewModel.userProfile.likes}'),
                          _buildStatsRow(context,
                              icon: Icons.extension,
                              //Modelos publicados en el catalogo
                              label: 'Models Created',
                              value: '${profileViewModel.userProfile.modelsCreated}'),
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.cyan,
                      ),
                    );
            }),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, [String? content, bool isLink = false]) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.primary),
          ),
          const SizedBox(height: 5),
          isLink
              ? InkWell(
            onTap: () {
              // nada
              print('prueba link');
            },
            child: Text(
              content ?? '',
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
          )
              : Text(
            content ?? '',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context, {required IconData icon, required String label, required String value}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 5),
              Text(label),
            ],
          ),
          Text(value),
        ],
      ),
    );
  }
}
