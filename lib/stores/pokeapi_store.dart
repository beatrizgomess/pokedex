import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:pokedex/const/const_api.dart';
import 'package:pokedex/models/poke_api.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  late PokeAPI pokeApi;

  @action
  fetchPokemonList() {
    // pokeApi = null;
    loadPokeAPI().then((pokeList) => pokeApi = pokeList!);
  }

  Future<PokeAPI?> loadPokeAPI() async {
    final Uri url = Uri.parse(ConstsApi.pokeapiURL);
    try {
      final response = await http.get(url);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista");
      return null;
    }
  }
}
