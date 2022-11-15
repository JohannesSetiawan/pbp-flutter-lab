import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BudgetDataPage extends StatefulWidget {
  const BudgetDataPage({super.key});

  @override
  State<BudgetDataPage> createState() => _BudgetDataPageState();
}

class _BudgetDataPageState extends State<BudgetDataPage> {

  static List<String> Judul = [];
  static List<int> Nominal = [];
  static List<String> Jenis = [];
  static List<DateTime> TanggalBuat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),

      // Menambahkan drawer menu
      drawer: buildDrawer(context),

      body:ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:[

                    Padding(
                      // Menggunakan padding
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            Judul[index], style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.left),
                      ),
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            // Menggunakan padding
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(Nominal[index].toString(), style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                          Padding(
                            // Menggunakan padding
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(Jenis[index], style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.right),
                            ),
                          ),
                        ]
                    ),

                    Padding(
                      // Menggunakan padding
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text( 'Hari dan Tanggal: '+ DateFormat('EEEE, MMMM d, yyyy').format(TanggalBuat[index]), style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.left),
                      ),
                    ),
                  ],
                )
            ),
          );
        },
        itemCount: Judul.length,
      ),
    );
  }
}

void addBudget(String _judul, int nominal, String jenis, DateTime tanggal){
  _BudgetDataPageState.Judul.add(_judul);
  _BudgetDataPageState.Nominal.add(nominal);
  _BudgetDataPageState.Jenis.add(jenis);
  _BudgetDataPageState.TanggalBuat.add(tanggal);
}