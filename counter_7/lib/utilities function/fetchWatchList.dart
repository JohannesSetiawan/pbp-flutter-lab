import 'package:http/http.dart' as http;
import 'package:counter_7/model/mywatchlist.dart';
import 'dart:convert';
import 'dart:async';

Future<List<Mywatchlist>> fetchWatchList() async {

  var url = Uri.parse('https://tugas2-johannessetiawan.herokuapp.com/mywatchlist/json/');

  var response = await http.get(
    url,
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object Mywatchlist
  List<Mywatchlist> listMywatchlist = [];
  for (var d in data) {
    if (d != null) {
      String model = d["model"].toString();
      int pk = int.parse(d["pk"].toString());
      var field = d["fields"];
      bool watched = field["watched"].toString() == "Yes" ? true : false;
      String title = field["title"].toString();
      String rating = field["rating"].toString();
      String releaseDate = field["release_date"].toString();
      String review = field["review"].toString();
      var fields = Fields(watched: watched, title: title, rating: rating, releaseDate: releaseDate, review: review);
      var watchlist = Mywatchlist(model: model, pk: pk, fields: fields);
      listMywatchlist.add(watchlist);
    }
  }

  return listMywatchlist;
}