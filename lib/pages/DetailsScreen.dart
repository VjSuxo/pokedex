import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedex/pages/HomeScreen.dart';

class DetailsScreen extends StatefulWidget {
  final heroTag;
  final Wpoknow;
  final WpokTipo;
  final WpokNum;
  final WpokImg;
  final WpokAltura;
  final WpokPeso;

  const DetailsScreen(
      {Key? key,
      this.heroTag,
      this.Wpoknow,
      this.WpokTipo,
      this.WpokNum,
      this.WpokImg,
      this.WpokAltura,
      this.WpokPeso})
      : super(key: key);
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: widget.WpokTipo.toString() == "Grass"
          ? Colors.greenAccent
          : widget.WpokTipo.toString() == "Fire"
              ? Colors.redAccent
              : widget.WpokTipo.toString() == "Water"
                  ? Colors.blueAccent
                  : widget.WpokTipo.toString() == "Bug"
                      ? Colors.lightGreenAccent
                      : widget.WpokTipo.toString() == "Poison"
                          ? Colors.purpleAccent
                          : widget.WpokTipo.toString() == "Electric"
                              ? Colors.amberAccent
                              : widget.WpokTipo.toString() == "Ground"
                                  ? Colors.brown
                                  : widget.WpokTipo.toString() == "Fighting"
                                      ? Colors.orangeAccent
                                      : widget.WpokTipo.toString() == "Psychic"
                                          ? Colors.pinkAccent
                                          : widget.WpokTipo.toString() == "Rock"
                                              ? Colors.grey
                                              : widget.WpokTipo.toString() ==
                                                      "Dragon"
                                                  ? Colors.blueGrey
                                                  : widget.WpokTipo
                                                              .toString() ==
                                                          "Ice"
                                                      ? Colors.lightBlueAccent
                                                      : Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          _FkechaAtras(),
          _NombreNumeroPokemon(),
          _TipoPokemon(),
          _PokeballFondo(),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Altura",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.WpokAltura.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              "Peso",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.WpokPeso.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _ImagenPokemon(),
        ],
      ),
    );
  }

  Widget _FkechaAtras() {
    return Positioned(
        top: 50,
        left: 5,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  Widget _NombreNumeroPokemon() {
    return Positioned(
        top: 100,
        left: 20,
        right: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.Wpoknow.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "#" + widget.WpokNum.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }

  Widget _TipoPokemon() {
    return Positioned(
      top: 135,
      left: 25,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.WpokTipo.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }

  Widget _PokeballFondo() {
    var height = MediaQuery.of(context).size.height;
    return Positioned(
      top: height * 0.12,
      right: -85,
      child: Image.asset(
        'images/pokeball.png',
        height: 290,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _ImagenPokemon() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Positioned(
      top: (height * 0.2),
      child: Hero(
        tag: widget.heroTag,
        child: CachedNetworkImage(
          imageUrl: widget.WpokImg,
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
    ;
  }
}
