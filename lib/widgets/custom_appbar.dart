import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? tittle;
  const CustomAppBar({
    required this.tittle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Center(
        child: Container(
          color: Colors.black,
          child:  Text( tittle!,
            style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: (){Navigator.pushNamed(context, '/wishlist');}, icon: const Icon(Icons.favorite))],);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
