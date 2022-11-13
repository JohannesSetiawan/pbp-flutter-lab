import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BudgetFormPage extends StatefulWidget {
  const BudgetFormPage({super.key});

  @override
  State<BudgetFormPage> createState() => _BudgetFormPageState();
}

class _BudgetFormPageState extends State<BudgetFormPage> {

  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int nominal = 0;
  String jenis = 'Pemasukan';
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  DateTime tanggal = DateTime.now();

  bool isNumeric(String value){
    if(value == null) {
      return false;
    }
    return int.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),

      // Menambahkan drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Form Budget'),
              onTap: () {
                // Route menu ke halaman form budget
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BudgetFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman data budget
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const BudgetDataPage()),
                );
              },
            ),
          ],
        ),
      ),

      // Form
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                // judul
                Padding(
                  // Menggunakan padding
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli BigMac di McD",
                      labelText: "Judul Budget",
                      // Menambahkan icon
                      icon: const Icon(Icons.title),
                      // Menambahkan circular border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat kolom judul diisi
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul budget tidak boleh kosong! Harap diisi.';
                      }
                      return null;
                    },
                  ),
                ),

                // Nominal
                Padding(
                  // Menggunakan padding
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 100000",
                      labelText: "Nominal Budget",
                      // Menambahkan icon
                      icon: const Icon(Icons.attach_money),
                      // Menambahkan circular border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    keyboardType: TextInputType. number,

                    // Menambahkan behavior saat kolom nominal diisi
                    onChanged: (String? value) {
                      setState(() {
                        nominal = int.parse(value!);
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        nominal = value! as int;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {

                      // Saat kosong
                      if (value == null || value.isEmpty) {
                        return 'Nominal budget tidak boleh kosong! Harap diisi.';
                      }

                      // Saat bukan angka
                      if (!isNumeric(value)) {
                        return 'Nominal budget yang diisi harus berupa angka! Harap diisi ulang';
                      }
                      return null;
                    },
                  ),
                ),

                // Dropdown jenis
                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Jenis Budget: ',
                  ),
                  trailing: DropdownButton(
                    value: jenis,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listJenis.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenis = newValue!;
                      });
                    },

                  ),
                ),

                // Date Picker
                ElevatedButton(
                  child: Text("Pilih tanggal"),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2099),

                    ).then((date) {  //tambahkan setState dan panggil variabel _dateTime.
                      setState(() {
                        tanggal = date!;
                      });
                    });
                  },
                ),

                Padding(
                // Menggunakan padding
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Tanggal yang dipilih: '+ DateFormat('EEEE, MMMM d, yyyy').format(tanggal), style: TextStyle(fontSize: 15)),
                ),

                TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _BudgetDataPageState.Judul.add(_judul);
                      _BudgetDataPageState.Nominal.add(nominal);
                      _BudgetDataPageState.Jenis.add(jenis);
                      _BudgetDataPageState.TanggalBuat.add(tanggal);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BudgetFormPage()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('Counter'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Form Budget'),
              onTap: () {
                // Route menu ke halaman form budget
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BudgetFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman data budget
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BudgetDataPage()),
                );
              },
            ),
          ],
        ),
      ),

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