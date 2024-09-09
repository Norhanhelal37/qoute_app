import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qoutes/cubits/notecubit/qoute_cubit.dart';
import 'package:qoutes/cubits/notecubit/qoute_state.dart';

import 'package:qoutes/widgets/customeheart.dart';

import 'package:share_plus/share_plus.dart';

class MyHome extends StatefulWidget {
  MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    if (QouteCubit.get(context).qoutes.isEmpty) {
      QouteCubit.get(context).fetchQoutes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 225, 182, 233),
          title: const Text(
            "Daily Qoutes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "EduVICWANT",
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<QouteCubit, QouteState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: const Color.fromARGB(255, 231, 137, 168),
                ),
              );
            } else if (state is AddFavState || state is RemovFavState || state is sucessState ) {
              return ListView.builder(
                  itemCount: QouteCubit.get(context).category.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(10),
                        height: (QouteCubit.get(context)
                                    .qoutes[index]
                                    .qoute
                                    .length >=
                                130)
                            ? 410
                            : 220,
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
                                    QouteCubit.get(context).qoutes[index].qoute,
                                    style: const TextStyle(
                                        fontFamily: "EduVICWANT",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    QouteCubit.get(context)
                                        .qoutes[index]
                                        .author,
                                    style: const TextStyle(
                                        fontFamily: "EduVICWANT",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MyFavorit(
                                      myqoute:
                                          QouteCubit.get(context).qoutes[index],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Share.share(QouteCubit.get(context)
                                              .qoutes[index]
                                              .qoute);
                                        },
                                        icon: const Icon(
                                          Icons.ios_share,
                                          color: Color.fromARGB(
                                              255, 247, 120, 226),
                                        ))
                                  ],
                                )
                              ],
                            )));
                  });
            } else {
              return const Center(
                child: Text(
                  "Something wrong",
                   style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w200,
                        fontFamily: "EduVICWANT",
                        color: Color.fromARGB(255, 223, 118, 197),
                   ))
              );
            }
          },
        ));
  }
}
