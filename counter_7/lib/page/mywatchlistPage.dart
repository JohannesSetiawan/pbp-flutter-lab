import 'package:flutter/material.dart';
import 'package:counter_7/utilities%20function/drawer.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/utilities function/fetchWatchList.dart';

class MyWatchlistApp extends StatelessWidget {
  const MyWatchlistApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWatchlistPage(),
    );
  }
}

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});
  final String title = 'My Watch List';

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // Menambahkan drawer menu
      drawer: buildDrawer(context),

      body:FutureBuilder(
          future: fetchWatchList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada watch list",
                      style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> InkWell(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: snapshot.data![index].fields.watched ? Colors.blue : Colors.red, //                   <--- border color
                              width: 5.0,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2.0
                              )
                            ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                                children: [
                                  Padding(
                                    // Menggunakan padding
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text("Watched? ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left),
                                    ),
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    value: snapshot.data![index].fields.watched,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        snapshot.data![index].fields.watched = !snapshot.data![index].fields.watched;
                                      });
                                    },
                                  )
                                ]
                            ),

                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => DetailPage(film: snapshot.data![index])));
                    },
                    ),
                );
              }
            }
          }
      )
    );
  }
}

class DetailPage extends StatelessWidget {
  final Mywatchlist film;
  DetailPage({super.key, required this.film});
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            // Menggunakan padding
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(film.fields.title, style: TextStyle(fontSize: 30),),
            ),
          ),
          Row(
              children: [
                Padding(
                  // Menggunakan padding
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Release Date: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                ),
                Padding(
                  // Menggunakan padding
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(film.fields.releaseDate, style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left),
                  ),
                ),
              ]
          ),
          Row(
              children: [
                Padding(
                  // Menggunakan padding
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Rating: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                ),
                Padding(
                  // Menggunakan padding
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(film.fields.rating + "/5", style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left),
                  ),
                ),
              ]
          ),
          Row(
              children: [
                Padding(
                  // Menggunakan padding
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Status: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left),
                  ),
                ),
                Padding(
                  // Menggunakan padding
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(film.fields.watched ? "Yes" : "No", style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left),
                  ),
                ),
              ]
          ),
          Padding(
            // Menggunakan padding
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text("Review: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
            ),
          ),
          Padding(
            // Menggunakan padding
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(film.fields.review, style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}


