import 'package:flutter/material.dart';

class HerPresentation extends StatelessWidget implements PreferredSizeWidget {
  final String nombre;
  final String urlAvatar;

  const HerPresentation({
    super.key,
    this.nombre = 'spice and wolf',
    this.urlAvatar =
        'https://c4.wallpaperflare.com/wallpaper/987/482/404/anime-spice-and-wolf-holo-spice-and-wolf-hd-wallpaper-preview.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(urlAvatar),
            ),
          ),
          const SizedBox(width: 8.0),
          Text(nombre),
        ],
      ),
    );
  }

  @override
  // ignore: todo
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
