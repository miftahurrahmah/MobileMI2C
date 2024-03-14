import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/screen_latihan/navigation_MI.dart';
import 'package:untitled/screen_latihan/navigation_TK.dart';

class PageLatihan extends StatelessWidget {
  const PageLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Image.asset('gambar/pnp.jpg',
               fit: BoxFit.contain,
               height: 200,
               width: 200,
             ),
             SizedBox(height: 20,),
             Text('Selamat Datang di Politeknik Negeri Padang',
               style: TextStyle(
                 color: Colors.deepOrange,
                 fontSize: 17,
                 fontWeight: FontWeight.bold,
               ),
             ),
             Text('Limau Manih, Padang, Sumbar',
             style: TextStyle(
                 fontWeight: FontWeight.bold
             ),
             ),
             SizedBox(height: 40,),
             MaterialButton(onPressed: (){
               showToast(
                 'Prodi Manajemen Informatika',
                 context: context,
                 axis: Axis.horizontal,
                 alignment: Alignment.center,
                 position: StyledToastPosition.bottom,
                 toastHorizontalMargin: 20,
                 fullWidth: true,
               );
               Navigator.push(context, MaterialPageRoute(builder: (context)
               => PageMI()
               ));
             },
               child: Text('Manajemen Informatika',
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 12
                 ),
               ),
               color: Colors.deepOrange,
               textColor: Colors.white,
             ),
             SizedBox(height: 8,),
             MaterialButton(onPressed: (){
               showToast(
                 'Prodi Teknik Komputer',
                 context: context,
                 axis: Axis.horizontal,
                 alignment: Alignment.center,
                 position: StyledToastPosition.bottom,
                 toastHorizontalMargin: 20,
                 fullWidth: true,
               );
               Navigator.push(context, MaterialPageRoute(builder: (context)
               => PageTK()
               ));
             },
               child: Text('Teknik Komputer',
                 style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 12
                 ),
               ),
               color: Colors.deepOrange,
               textColor: Colors.white,
             ),
           ],
         ),

        ),
      ),
    );
  }
}
