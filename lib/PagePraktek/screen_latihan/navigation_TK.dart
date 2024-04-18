import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class PageTK extends StatelessWidget {
  const PageTK({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Teknik Komputer',),
        centerTitle: true,
      ),
      body: Center(
        child: Column(

          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Deskripsi Profil',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Program Studi D3 Teknik Komputer didirikan pada tahun 2005, dan terakreditasi dengan peringkat B berdasarkan Surat Keputusan Badan Akreditasi nasional Perguruan Tinggi (BAN-PT) Departemen Pendidikan dan kebudayaan republik Indonesia Surat Keputusan Nomor :1196/SK/BAN- PT/Akred/Dpl-III/XII/2015 dengan nilai akreditasi 338. Arah kajian keilmuan dari program studi ini mencakup disiplin, proses, teknik dan alat bantu yang dibutuhkan dalam rekayasa perangkat lunak yang meliputi tahap perencanaan, pembangunan dan implementasi. Program studi D3 Manajemen Informatika yang merupakan kesatuan rencana belajar yang mengkaji, menerapkan, dan mengembangkan ilmu manajemen informatika yang melandasi rancang bangun sebuah sistem maupun aplikasi yang berdasarkan sistem informasi.",

              ),
            ),
            SizedBox(height: 30,),
            MaterialButton(
              onPressed: (){
                //kembali ke page utama
                Navigator.pop(context);
              },
              child: Text('Back'),
              color: Colors.deepOrange,
              textColor: Colors.white,

            ),
          ],
        ),


      ),
    );
  }
}
