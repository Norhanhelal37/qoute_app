import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qoutes/cubits/notecubit/qoute_cubit.dart';
import 'package:qoutes/cubits/notecubit/qoute_state.dart';

import 'package:share_plus/share_plus.dart';

class Favorit extends StatefulWidget {
  const Favorit({super.key});
  // final List<String> myfav;

  @override
  State<Favorit> createState() => _FavoritState();
}

class _FavoritState extends State<Favorit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 225, 182, 233),
          title: const Text(
            "My Favorites",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "EduVICWANT",
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<QouteCubit, QouteState>(
          builder: (context, state) {
            if (QouteCubit.get(context).favorites.isEmpty) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: const Center(
                  child: Text(
                    "There is no qoute added",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: "EduVICWANT",
                        color: Color.fromARGB(255, 223, 118, 197)),
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount:QouteCubit.get(context).favorites.length,
                  itemBuilder: (context, index) {
                    return
                        // margin: EdgeInsets.all(10),
                        Container(
                            margin: const EdgeInsets.all(10),
                            height: (QouteCubit.get(context).favorites[index].qoute
                                        .length >=
                                    140)
                                ? 390
                                : 210,
                            width: 300,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                  bottomRight: Radius.circular(25)),
                            ),
                            child: Card(
                                elevation: 10,
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        textAlign: TextAlign.center,
                                        QouteCubit.get(context).favorites[index].qoute,
                                        style: const TextStyle(
                                            fontFamily: "EduVICWANT",
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Share.share(
                                              QouteCubit.get(context).favorites[index].qoute);

                                          // Share.share(mylist[index].qoute);
                                        },
                                        icon: const Icon(
                                          Icons.ios_share,
                                          color: Color.fromARGB(
                                              255, 247, 120, 226),
                                        ))
                                  ],
                                )));
                  });
            }
          },
        ));
  }
}
