import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controller/getDataController.dart';
import 'package:pokedex/pages/DetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Lamamos a la api
  final GetDataContoller = Get.put(getDataContoller());
  @override
  void initState() {
    GetDataContoller.getDataFormApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: !GetDataContoller.isLoading.value
            ? Stack(
                // Stack Permite poner un elemento sobre otro

                children: [
                  _ImagenFondo(),
                  _TextoTitulo(),
                  Positioned(
                      top: 151,
                      bottom: 0,
                      width: width,
                      child: Column(
                        children: [
                          Expanded(
                              child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1.4),
                                  itemCount: 151,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: InkWell(
                                        child: SafeArea(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)),
                                                color: GetDataContoller
                                                            .getDataModel
                                                            .value
                                                            .results[index]
                                                            .pokTipo ==
                                                        "Grass"
                                                    ? Colors.greenAccent
                                                    : GetDataContoller
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokTipo ==
                                                            "Fire"
                                                        ? Colors.redAccent
                                                        : GetDataContoller
                                                                    .getDataModel
                                                                    .value
                                                                    .results[
                                                                        index]
                                                                    .pokTipo ==
                                                                "Water"
                                                            ? Colors.blueAccent
                                                            : GetDataContoller
                                                                        .getDataModel
                                                                        .value
                                                                        .results[
                                                                            index]
                                                                        .pokTipo ==
                                                                    "Bug"
                                                                ? Colors
                                                                    .lightGreenAccent
                                                                : GetDataContoller
                                                                            .getDataModel
                                                                            .value
                                                                            .results[index]
                                                                            .pokTipo ==
                                                                        "Poison"
                                                                    ? Colors.purpleAccent
                                                                    : GetDataContoller.getDataModel.value.results[index].pokTipo == "Electric"
                                                                        ? Colors.amberAccent
                                                                        : GetDataContoller.getDataModel.value.results[index].pokTipo == "Ground"
                                                                            ? Colors.brown
                                                                            : GetDataContoller.getDataModel.value.results[index].pokTipo == "Fighting"
                                                                                ? Colors.orangeAccent
                                                                                : GetDataContoller.getDataModel.value.results[index].pokTipo == "Psychic"
                                                                                    ? Colors.pinkAccent
                                                                                    : GetDataContoller.getDataModel.value.results[index].pokTipo == "Rock"
                                                                                        ? Colors.grey
                                                                                        : GetDataContoller.getDataModel.value.results[index].pokTipo == "Dragon"
                                                                                            ? Colors.blueGrey
                                                                                            : GetDataContoller.getDataModel.value.results[index].pokTipo == "Ice"
                                                                                                ? Colors.lightBlueAccent
                                                                                                : Colors.black),
                                            child: Stack(
                                              children: [
                                                _POkeballInterno(),
                                                _ImagenPokemon(index),
                                                _NombrePokemon(index),
                                                _TipoPokemon(index),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => DetailsScreen(
                                                        heroTag: index,
                                                        Wpoknow:
                                                            GetDataContoller
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokNom,
                                                        WpokTipo:
                                                            GetDataContoller
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokTipo,
                                                        WpokNum:
                                                            GetDataContoller
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokNum,
                                                        WpokImg:
                                                            GetDataContoller
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokImg,
                                                        WpokAltura:
                                                            GetDataContoller
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokAltura,
                                                        WpokPeso:
                                                            GetDataContoller
                                                                .getDataModel
                                                                .value
                                                                .results[index]
                                                                .pokPeso,
                                                      )));
                                        },
                                      ),
                                    );
                                  }))
                        ],
                      ))
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _ImagenFondo() {
    return Positioned(
      right: -100,
      top: -50,
      child: Image.asset(
        'images/pokeball.png',
        fit: BoxFit.fitWidth,
        width: 300,
      ),
    );
  }

  Widget _TextoTitulo() {
    return Positioned(
        top: 100,
        left: 20,
        child: Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ));
  }

  Widget _POkeballInterno() {
    return Positioned(
      bottom: -35,
      right: -35,
      child: Image.asset(
        'images/pokeball.png',
        height: 150,
      ),
    );
  }

  Widget _ImagenPokemon(index) {
    return Positioned(
        bottom: 5,
        right: 5,
        child: Hero(
          tag: index,
          child: CachedNetworkImage(
            imageUrl:
                GetDataContoller.getDataModel.value.results[index].pockGif,
            height: 80,
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ));
  }

  Widget _NombrePokemon(index) {
    return Positioned(
        top: 30,
        left: 15,
        child: Text(
          GetDataContoller.getDataModel.value.results[index].pokNom,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ));
  }

  Widget _TipoPokemon(index) {
    return Positioned(
        top: 55,
        left: 15,
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Text(
              GetDataContoller.getDataModel.value.results[index].pokTipo
                  .toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.black.withOpacity(0.5),
          ),
        ));
  }
}
