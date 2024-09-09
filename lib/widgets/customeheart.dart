import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qoutes/cubits/notecubit/qoute_cubit.dart';
import 'package:qoutes/cubits/notecubit/qoute_state.dart';

import 'package:qoutes/services/qoute_model.dart';

class MyFavorit extends StatefulWidget {
  const MyFavorit({super.key, required this.myqoute});

  final QouteModel myqoute;

  @override
  State<MyFavorit> createState() => _MyFavoritState();
}

class _MyFavoritState extends State<MyFavorit> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QouteCubit, QouteState>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              QouteCubit.get(context).addFav(widget.myqoute);
            },
            icon: (QouteCubit.get(context).favorites.contains(widget.myqoute))        
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border_sharp, color: Colors.red));
      },
    );
  }
}
