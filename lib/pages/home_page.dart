
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List pokemonList = [];

  @override
  initState(){
    super.initState();
    getDataPokemon();
  }

  getDataPokemon() async{
    Uri _uri = Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.Response response = await http.get(_uri);
    Map<String, dynamic> myMap = json.decode(response.body);
    pokemonList = myMap["pokemon"];
    // myMap["pokemon"].forEach((mandarina){
    //   print(mandarina['name']);
    // });

    // pokemonList.forEach((element) {
    //   print(element["name"]);
    // });

    // for(var item in myMap["pokemon"]){
    //   print(item["name"]);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PokedexApp"),
      ),
    );
  }
}
