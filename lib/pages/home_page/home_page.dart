import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/pages/home_page/widgets/app_bar.dart';
import 'package:pokedex/stores/pokeapi_store.dart';

import '../../const/constsApp.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusBar = MediaQuery.of(context).padding.top;

    PokeApiStore? pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.2),
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                ConstsApp.blackPokeball,
                height: 240,
                width: 240,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: statusBar,
              ),
              const AppBarHome(),
              Expanded(
                child: Container(
                  child: Obx(builder: (BuildContext context) {
                    return ListView.builder(
                      itemBuilder: ((context, index) => ListTile()),
                    ); //: Center(child: CircularProgressIndicator);
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
