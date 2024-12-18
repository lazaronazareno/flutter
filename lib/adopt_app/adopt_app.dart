import 'package:flutter/material.dart';
import 'package:flutter_application_1/adopt_app/bloc/animal_bloc.dart';
import 'package:flutter_application_1/adopt_app/widgets/adopt_appbar.dart';
import 'package:flutter_application_1/adopt_app/widgets/adopt_filter.dart';
import 'package:flutter_application_1/adopt_app/widgets/adopt_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdoptAppPage extends StatelessWidget {
  const AdoptAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AnimalBloc()..add(GetAnimals()),
        child: const Body());
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFddece3),
      body: const Column(
        children: [
          AdoptAppbarWidget(),
          AdoptFilterWidget(),
          AdoptListWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }
}


//backgroundColor: #ddece3
//orange: #fd762c
//text title: #463521
//text light: #4a3b28
//green details: #8fd2c1
//white: #ffffff