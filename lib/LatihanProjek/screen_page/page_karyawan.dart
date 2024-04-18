import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model_projek/projek_karyawan.dart';

class PageKaryawan extends StatelessWidget {
  bool isCari = true;
  List<String> filterDevice = [];
  TextEditingController txtCari = TextEditingController();

  Future<List<Datum>> getBerita() async {
    try {
      final response = await http.get(
          Uri.parse("http://192.168.1.25/edukasi_server/getPegawai.php"));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['isSuccess'] == true) {
          return List<Datum>.from(
              jsonResponse['data'].map((x) => Datum.fromJson(x)));
        } else {
          throw Exception(
              'Failed to load data: ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  List<Datum> filterPegawai(List<Datum> pegawaiList, String keyword) {
    if (keyword.isEmpty) {
      return pegawaiList;
    } else {
      return pegawaiList.where((pegawai) =>
          pegawai.nama.toLowerCase().contains(keyword.toLowerCase())).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Data Karyawan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: txtCari,
                decoration: InputDecoration(
                  hintText: 'Cari karyawan...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (_) {
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: getBerita(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Datum>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.data!.isEmpty) {
                    return Center(
                        child: Text('Tidak ada data yang ditemukan'));
                  } else {
                    return ListView(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Nama',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'Nama',
                              ),
                              DataColumn(
                                label: Text(
                                  'No BP',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'No BP',
                              ),
                              DataColumn(
                                label: Text(
                                  'Email',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'Email',
                              ),
                              DataColumn(
                                label: Text(
                                  'No. HP',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'No. HP',
                              ),
                              DataColumn(
                                label: Text(
                                  'Tanggal Daftar',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'Tanggal Daftar',
                              ),
                              DataColumn(
                                label: Text(
                                  'Aksi',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                                tooltip: 'Aksi',
                              ),
                            ],
                            rows: filterPegawai(snapshot.data!, txtCari.text)
                                .map((pegawai) {
                              return DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(pegawai.nama)),
                                  DataCell(Text(pegawai.nobp)),
                                  DataCell(Text(pegawai.email)),
                                  DataCell(Text(pegawai.nohp)),
                                  DataCell(
                                    Text(
                                      pegawai.tanggalInput != null
                                          ? pegawai.tanggalInput.toString()
                                          : '',
                                    ),
                                  ),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            // Tambahkan logika untuk menghapus data di sini
                                          },
                                          icon: Icon(Icons.delete),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            // Tambahkan logika untuk mengedit data di sini
                                          },
                                          icon: Icon(Icons.edit),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageTambahKaraywan()),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}



class PageTambahKaraywan extends StatefulWidget {
  const PageTambahKaraywan({Key? key});

  @override
  State<PageTambahKaraywan> createState() => _PageTambahKaraywanState();
}

class _PageTambahKaraywanState extends State<PageTambahKaraywan> {

  //Untuk mendapatkan value dari text field
  TextEditingController txtNamaLengkap = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtNoBP = TextEditingController();
  TextEditingController txtNoHP = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Karyawan"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtNamaLengkap,
                  decoration: InputDecoration(
                    hintText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtNoBP,
                  decoration: InputDecoration(
                    hintText: 'No BP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtEmail,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  //validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtNoHP,
                  decoration: InputDecoration(
                    hintText: 'No HP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (keyForm.currentState?.validate() == true) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Data Register"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Nama Lengkap :${txtNamaLengkap.text}"),
                                Text("No BP :${txtNoBP.text}"),
                                Text("Email : ${txtEmail.text}"),
                                Text("No HP : ${txtNoHP.text}"),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Dismiss"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text("SIMPAN"),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
