import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model_projek/projek_karyawan.dart';

class PageKaryawan extends StatefulWidget {
  @override
  State<PageKaryawan> createState() => _PageKaryawanState();
}

class _PageKaryawanState extends State<PageKaryawan> {
  List<Datum> pegawaiList = [];
  List<Datum> filteredPegawaiList = [];
  TextEditingController txtCari = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse("http://10.126.46.149/edukasi_server/getPegawai.php"));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['isSuccess'] == true) {
          setState(() {
            pegawaiList = List<Datum>.from(
                jsonResponse['data'].map((x) => Datum.fromJson(x)));
            filteredPegawaiList = List<Datum>.from(pegawaiList);
          });
        } else {
          throw Exception('Failed to load data: ${jsonResponse['message']}');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  void filterPegawaiList(String keyword) {
    setState(() {
      filteredPegawaiList = pegawaiList
          .where((pegawai) =>
      pegawai.nama.toLowerCase().contains(keyword.toLowerCase()) ||
          pegawai.nobp.toLowerCase().contains(keyword.toLowerCase()) ||
          pegawai.email.toLowerCase().contains(keyword.toLowerCase()) ||
          pegawai.nohp.toLowerCase().contains(keyword.toLowerCase()) ||
          (pegawai.tanggalInput != null &&
              pegawai.tanggalInput.toString().toLowerCase().contains(keyword.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onChanged: (value) {
                filterPegawaiList(value);
              },
            ),
          ),
          Expanded(
            child: filteredPegawaiList.isEmpty
                ? Center(
              child: Text('Data tidak ditemukan'),
            )
                : SingleChildScrollView(
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
                rows: filteredPegawaiList
                    .asMap()
                    .entries
                    .map(
                      (entry) => DataRow(
                    cells: [
                      DataCell(Text(entry.value.nama)),
                      DataCell(Text(entry.value.nobp)),
                      DataCell(Text(entry.value.email)),
                      DataCell(Text(entry.value.nohp)),
                      DataCell(
                        Text(
                          entry.value.tanggalInput != null
                              ? entry.value.tanggalInput.toString()
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
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PageEditKaryawan(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                    .toList(),
              ),
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
    );
  }
}



class PageTambahKaraywan extends StatefulWidget {
  const PageTambahKaraywan({Key? key});

  @override
  State<PageTambahKaraywan> createState() => _PageTambahKaraywanState();
}

class _PageTambahKaraywanState extends State<PageTambahKaraywan> {
  TextEditingController txtNamaLengkap = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtNoBP = TextEditingController();
  TextEditingController txtNoHP = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Tambah Data Karyawan'),
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

class PageEditKaryawan extends StatefulWidget {
  const PageEditKaryawan({Key? key});

  @override
  State<PageEditKaryawan> createState() => _PageEditKaryawanState();
}

class _PageEditKaryawanState extends State<PageEditKaryawan> {
  TextEditingController txtNamaLengkap = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtNoBP = TextEditingController();
  TextEditingController txtNoHP = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Edit Data Karyawan'),
        centerTitle: true,
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
                            title: const Text("Data Edit"),
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

