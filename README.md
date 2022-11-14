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
- Scaffold --> Menyediakan banyak widget yang digunakan
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
- SingleChildScrollView --> 
- AppBar --> 
- OutlineInputBorder -->
- TextFormField --> 
- DropdownButton --> 
- DropdownMenuItem --> 
- ElevatedButton --> 
- ButtonStyle --> 
- TextStyle --> 

### Sebutkan jenis-jenis _event_ yang ada pada Flutter (contoh: ```onPressed```).
- onPressed
- onSaved
- onChanged
- onTap

### Jelaskan bagaimana cara kerja ```Navigator``` dalam "mengganti" halaman dari aplikasi Flutter.


### Jelaskan bagaimana cara kamu mengimplementasikan _checklist_ di atas.
1. 
