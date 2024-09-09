import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qoutes/cubits/notecubit/qoute_cubit.dart';

import 'package:qoutes/screens/home.dart';
import 'package:qoutes/screens/favorit.dart';
import 'package:qoutes/services/get_data.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider<QouteCubit>(
      create: (context) => QouteCubit(Services()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            extendBody: true,
            bottomNavigationBar: FloatingNavBar(
                showTitle: true,
                horizontalPadding: 20,
                items: [
                  FloatingNavBarItem(
                      title: "home", page: MyHome(), iconData: Icons.home),
                  FloatingNavBarItem(
                      title: "Favorit",
                      page: const Favorit(),
                      iconData: Icons.favorite),
                ],
                color:  const Color.fromARGB(255, 227, 171, 236),
                hapticFeedback: true),
          )),
    );
  }
}
