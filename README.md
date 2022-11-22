# Tugas 6

### Jelaskan apa yang dimaksud dengan _stateless widget_ dan _stateful widget_ dan jelaskan perbedaan dari keduanya.
- _Stateless widget_ adalah widget yang statis dan tidak mempunyai _state_ sehingga tidak bisa berubah melalui aksi atau perilaku internal.
- _Stateful widget_ adalah widget yang dinamis dan dapat berubah selama aplikasi berjalan.
- Perbedaan: _stateless widget_ tidak bisa berubah selama aplikasi berjalan, sedangkan _stateful widget_ bisa berubah sesuai dengan aksi/perilaku yang dilakukan oleh aplikasi.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Text --> Menampilkan teks dengan _style_ tertentu
- Center --> Mengatur _child_ supaya ditampilkan dalam posisi tengah
- Column --> Mengatur _child_ supaya ditampilkan dalam posisi vertikal
- Container --> Tempat untuk meletakkan widget yang lain
- Row --> Mengatur _child_ supaya ditampilkan dalam posisi horisontal
- Icon --> Membuat ikon dari tombol

### Apa fungsi dari ```setState()```? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
- Fungsi dari ```setState()``` adalah untuk memberi tahu Fluterr kalau ada yang berubah pada _state_ sekarang. Ketika fungsi tersebut dipanggil, Flutter akan menjalankan ulang _build_ dari aplikasi sehingga pergantian tersebut bisa ditampilkan pada aplikasi. 

- Variabel yang terdampak dari fungsi tersebut adalah variabel ```_counter``` karena variabel tersebut adalah satu-tsatunya variabel yang bisa berubah saat aplikasi sedang berjalan.

### Jelaskan perbedaan antara ```const``` dengan ```final```.
Perberdaannya terletak pada pemberian nilai variabelnya. Variabel yang ```const``` nilainya sudah harus diinisiasi pada saat kompilasi dan nilainya bersifat konstan, sedangkan variabel yang ```final``` nilainya tidak perlu ada pada saat kompilasi. 

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Menjalankan perintah ```flutter create counter_7``` untuk membuat aplikasi baru bernama counter_7. Setelah itu, masuk ke folder aplikasi tersebut dengan ```cd counter_7```.
2. Mengubah baris ```home: const MyHomePage(title: 'Flutter Demo Home Page'),``` pada widget yag berupa _root_ dari aplikasi ini menjadi ```home: const MyHomePage(title: 'Program Counter'),``` untuk mengganti judul yang ada di aplikasi menjadi "Program Counter".
3. Membuat fungsi bari di dalam _class_ ```_MyHomePageState extends State<MyHomePage>``` bernama ```_decrementCounter()``` yang berfungsi untuk menurunkan counter saat nilai counter lebih dari nol. Isi fungsi tersebut adalah sebagai berikut:
```
setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      if(_counter > 0) _counter--;
    });
```
4. Mengubah isi parameter ```children``` yang ada di dalam ```return Scaffold(...)``` menjadi seperti berikut:
```
if(_counter % 2 == 0)
              const Text(
                'GENAP',
                style: TextStyle(color: Colors.red),
              )
            else
              const Text(
                'GANJIL',
                style: TextStyle(color: Colors.blue),
              ),
```
Kode tersebut berfungsi untuk mencetak teks yang ada di atas nilai counter. Jika nilai counternya bilangan genap, maka aplikasi akan menampilkan teks "GENAP" yang berwarna merah. Jika nilai counternya bilangan ganjil, maka aplikasi akan menampilkan teks "GANJIL" yang berwarna biru.

5. Mengubah isi parameter ```floatingActionButton``` yang ada di dalam ```return Scaffold(...)``` menjadi seperti berikut:
```
Container(
        padding: const EdgeInsets.all(40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
```
Kode tersebut akan membuat 2 button. Button yang pertama adalah button dengan ikon tanda tambah (+) yang akan menambahkan nilai counter dengan menjalankan fungsi ```_incrementCounter()``` saat ditekan. Button yang kedua adalah button dengan ikon tanda minus (-) yang akan mengurangkan nilai counter dengan menjalankan fungsi ```_decrementCounter()``` saat ditekan.


# Tugas 7

### Jelaskan perbedaan ```Navigator.push``` dan ```Navigator.pushReplacement```.
```Navigator.pushReplacement``` mengganti route yang digunakan dan menghapus route yang lama sehingga kita tidak bisa kembali ke route yang lama, sedangkan ```Navigator.push``` tidak menghapus route yang lama sehingga kita bisa kembali ke route yang lama.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- Scaffold --> Menyediakan banyak widget yang digunakan dan tempat widget yang memenuhi satu halaman
- Column --> Menyusun widget secara vertikal
- Navigator --> Mengganti halaman aplikasi ke halaman baru
- Text --> Menampilkan text
- Form --> Membuat _form_ yang dapat diisi
- Container --> Menampung widget-widget dan komponen yang lain
- Padding --> Mengatur tata letak widget dan komponen yang ada
- Icon --> Membuat ikon sehingga aplikasi yang dibuat lebih _user-friendly_ dan enak dilihat
- Align --> Mengatur posisi suatu komponen/widget
- Row --> Menyusun widget secara horizontal
- Drawer --> Membuat drawer untuk berpindah halaman
- ListTile --> Membuat list yang bisa ditekan
- MaterialPageRoute --> Mengganti keseluruhan halaman menjadi halaman baru
- SingleChildScrollView --> Mmebuat widget yang bisa di-_scroll_
- AppBar --> Membuat _navigation bar_ yang terletak di paling atas
- OutlineInputBorder --> Membuat _border_ pada InputDecorations
- TextFormField --> Membuat tempat input teks pada _form_
- DropdownButton --> Membuat _button_ untuk menu _dropdown_
- DropdownMenuItem --> Mendefinisikan _item-item_ yang ada di menu _dropdown_
- ElevatedButton --> Membuat _button_ untuk melakukan pemilihan tanggal pada _form_
- TextButton --> Membuat _button_ untuk submisi _form_
- ButtonStyle --> Membuat _style_ untuk widget _TextButton_
- TextStyle --> Membuat _style_ untuk widget _Text_
- MaterialStateProperty --> Mendefinisikan _style_ pada ButtonStyle

### Sebutkan jenis-jenis _event_ yang ada pada Flutter (contoh: ```onPressed```).
- onPressed
- onSaved
- onChanged
- onTap

### Jelaskan bagaimana cara kerja ```Navigator``` dalam "mengganti" halaman dari aplikasi Flutter.
Saat menjalankan _method_ ```Navigator.push()```, ```Navigator``` akan menambahkan _screen_ baru ke bagian paling atas dalam _navigation stack_. _Screen_ yang muncul di aplikasi adalah _screen_ yang ada di paling atas dalam _navigation stack_ sehingga _screen_ akan berganti saat ```Navigation``` menjalankan _method_ ```push()```.

### Jelaskan bagaimana cara kamu mengimplementasikan _checklist_ di atas.
1. Membuat _file_ ```budgetForm.dart``` yang berisi halaman form.
2. Membuat _class_ ```BudgetFormPage``` lalu membuat _class_ ```_BudgetFormPageState``` sebagai _root_ untuk halaman budget form.
3. Membuat _class attribute_ pada _class_ ```_BudgetFormPageState```. Atribut yang dibuat adalah
```
  final _formKey = GlobalKey<FormState>(); --> untuk _form key_
  String _judul = ""; --> menyimpan judul budget yang di-_input_ pengguna
  int nominal = 0; --> menyimpan nominal budget yang di-_input_ pengguna
  String jenis = 'Pemasukan'; --> menyimpan jenis budget yang di-_input_ pengguna
  List<String> listJenis = ['Pemasukan', 'Pengeluaran']; --> menyimpan jenis-jenis budget yang bisa dipilih pengguna
  DateTime tanggal = DateTime.now(); --> menyimpan tanggal budget yang dipilih pengguna
```
4. Membuat _method_ ```isNumeric``` untuk mengecek apakah _input_ pengguna ke nominal adalah angka.
5. Membuat _method_ ```build``` untuk membangun halaman _form_. _Method_ ini akan mengembalikan sebuah Scaffold yang berisi appBar, drawer, dan body. Body dari Scaffold akan berisi _form_ yang bisa digunakan pengguna. Drawer akan berisi sebuah _drawer menu_ untuk berpindah halaman. AppBar akan berisi sebuah _navigation bar_ yang menyimpan judul halaman dan _drawer menu_.
6. _Form_ yang ada akan berisi satu TextFormField untuk memasukkan judul budget, satu TextFormField yang masukannya divalidasi sebagai _integer_ untuk memasukkan nominal budget, sebuah DropdownButton untuk _dropdown menu_ saat memilih jenis budget, dan sebuah ElevatedButton yang berisi sebuah _date picker_ untuk pengguna memilih tanggal untuk budget. Di bawah ElevatedButton akan terdapat sebuah Text yang menampilkan tanggal yang dipilih pengguna. Di bagian paling bawah terdapat sebuah TextButton untuk melakukan submisi _form._
7. Menambahkan _event_ ```onPressed``` untuk TextButton yang akan menambahkan data budget yang tervalidasi ke dalam _list_ yang ada di halaman budget data dengan menjalankan _method_ ```addBudget```. Isinya adalah
```
if (_formKey.currentState!.validate()) {
      addBudget(_judul, nominal, jenis, tanggal);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BudgetFormPage()),
      );
}
```
8. Membuat _class_ ```BudgetDataPage``` lalu membuat _class_ ```_BudgetDataPageState``` sebagai _root_ untuk halaman budget data.
9. Membuat _class attribute_ pada _class_ ```_BudgetDataPageState```. Atribut yang dibuat adalah
```
  static List<String> Judul = []; --> List untuk judul budget yang sudah dimasukkan
  static List<int> Nominal = []; --> List untuk nominal budget yang sudah dimasukkan
  static List<String> Jenis = []; --> list jenis untuk budget yang sudah dimasukkan
  static List<DateTime> TanggalBuat = []; --> List tanggal untuk budget yang sudah dimasukkan
```
10.  Membuat _method_ ```build``` untuk membangun halaman _data_. _Method_ ini akan mengembalikan sebuah Scaffold yang berisi appBar, drawer, dan body. Body dari Scaffold akan berisi kumpulan _card_ yang berisi data budget yang sudah dimasukkan pengguna di halaman _form_. Drawer akan berisi sebuah _drawer menu_ untuk berpindah halaman. AppBar akan berisi sebuah _navigation bar_ yang menyimpan judul halaman dan _drawer menu_.
11. Membuat _file_ ```drawer.dart``` yang berisi fungsi yang mengembalikan _drawer menu_ untuk navigasi halaman pada halaman Program Counter, Form Budget, dan Data Budget. 
12. Menambahkan baris ```intl: "^0.17.0"``` ke dalam ```dev_dependencies``` di ```pubspec.yaml``` untuk menggunakan _library_ ```intl```.
13. Menambahkan _drawer_ ke dalam Scaffold yang di-_return_ oleh _method_ ```build``` dari _class_ ```_MyHomePageState```.

# Tugas 9

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, kita bisa mengambil data JSON manual tanpa membuat objek terlebih dahulu. Akan tetapi, hal tersebut tidak baik karena kegunaan model itu untuk membuat representasi objek dari suatu data JSON yang akan dibuat menjadi _list of objects_ sehingga saat kita tidak menggunakan model, maka kita harus membuat satu _list_ untuk setiap atribut untuk menyimpan nilai-nilai dari atribut tersebut.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
- FutureBuilder --> Membangun _widget_ berdasarkan _snapshot_ terbaru
- AsyncSnapshot --> Membuat _snapshot_ secara asinkronus
- CircularProgressIndicator --> Membuat _progress indicator_ berbentuk lingkaran
- Center --> Menyusun komponen supaya beradar di tengah halaman
- Column --> Menyusun _widget_ secara vertikal
- Text --> Menampilkan teks
- TextStyle --> Melakukan _styling_ pada Text
- SizedBox --> Membuat komponen _box_ yang ukurannya tergantung _parent_-nya
- ListView --> Membuat _list_ dari _widget_
- InkWell --> Membuat _widget_ dapat melakukan _event-handling_
- Container --> Mennyimpan _widget_
- BoxDecoration --> Membuat dekorasi
- Border --> Membuat _border_
- BoxShadow --> membuat supaya _container_ memiliki _shadow_
- Padding --> Mengatur _widget_ supaya ada jarak antar-_widget_
- Row --> Menyusun _widget_ secara horizontal
- Align --> Mengatur letak setiap _widget_ yang menjadi anaknya
- Checkbox --> Membuat _checkbox_
- Colors --> memberikan warna untuk beberapa _widgets_
- Navigator --> berpindah halaman
- MaterialPageRoute --> mengganti _screen_ menjadi halaman/_screen_ yang baru
- Scaffold --> Menyimpan setiap komponen di dalamnya dan memenuhi seluruh halaman

### Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
Pengambilan data pada Flutter dimulai dengan membuat _http request_ ke _web service_ menggunakan _dependency_ ```http```. Setelah itu, _http request_ akan menghasilkan sebuah _response_ dengan _body_ yang berisi data yang kita mau ambil dari web. Data tersebut lalu dikonversi ke model yang dibuat untuk data yang kita ambil dari web. Lalu, data tersebut ditampilkan dengan _widget_ ```FutureBuilder```.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat _file_ ```mywatchlist.dart``` yang akan menyimpan model yang digunakan untuk menyimpan data _mywatchlist_.
2. Membuat _file_ ```mywatchlistPage.dart``` yang berisi dua buah halaman. Halaman ```MyWatchListPage``` digunakan untuk menampilkan _list_ dari _watch list_. Halaman ```DetailPage``` digunakan untuk menampilkan detail dari setiap _watch list_.
3. Membuat _file_ ```createWatchList.dart``` untuk mengambil data _watch lists_ dari halaman web Heroku dan menkonversinya ke sebuah _list_ dari objek ```Mywatchlist```. Isi fungsi ```fetchWatchList()``` yang digunakan untuk mengambil data dari web adalah sebagai berikut:
```
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
```
5. Mengonstruksi halaman ```MyWatchListPage``` yang akan mempunyai ```body``` berupa FutureBuilder. FutureBuilder itu akan menampilkan sebuah _list_ dari data _watch list_ yang sudah diambil dari web Heroku. Setiap _watch list_ memiliki warna dan _checkbox_ masing-masing tergantung dari status _watched_ masing-masing _watch list_. Setiap _watch list_ juga dapat diklik. Saat diklik, halaman akan berpindah ke halaman detail dari film yang judulnya diklik pada halaman _watch list_.
6. Mengonstruksi halaman ```DetailPage``` yang akan mempunyai ```body``` berupa sebuah Column yang berisi kumpulan teks yang berupa detail dari setiap film yang ada di _watch list_. Halaman ```DetailPage``` menerima sebuah _instance_ dari ```Mywatchlist``` pada saat inisiasi halaman. Pada bagian bawah halaman ini terdapat sebuah tombol yang berguna untuk kembali ke halaman _watch list_.
7. Menambahkan ListTile baru pada _file_ ```drawer.dart``` untuk navigasi ke halaman _watch list_.
