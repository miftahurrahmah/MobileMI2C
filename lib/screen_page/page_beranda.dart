import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/screen_page/page_bottom_navigation.dart';
import 'package:untitled/screen_page/page_list_berita.dart';
import 'package:untitled/screen_page/page_list_users.dart';
import 'package:untitled/screen_page/page_navigation_bar.dart';
import 'package:untitled/screen_page/page_register_api.dart';

class PageBeranda extends StatelessWidget {
  const PageBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Projek MI 2C'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('gambar/gambar2.jpg',
              fit: BoxFit.contain,
              height: 150,
              width: 150,
              ),
              SizedBox(height: 8,),
              // const Image(
              //   image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              //   fit: BoxFit.contain,
              //   height: 150,
              //   width: 150,
              // ),
              Text('Program Studi: Manajemen Informatika'),
              Text('Kampus Politeknik Negeri Padang'),
              SizedBox(height: 10,),
              MaterialButton(onPressed: (){
                showToast('Pindah Ke Page Navigation Drawer',
                  context: context,
                  axis: Axis.horizontal,
                  alignment: Alignment.center,
                  position: StyledToastPosition.bottom,
                  toastHorizontalMargin: 20,
                  fullWidth: true,
                );
                //code untuk pindah page
                Navigator.push(context, MaterialPageRoute(builder: (context)
                    => PageNavigationBar()
                ));
              },
                child: Text('Page Navigation Utama',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),
              SizedBox(height: 8,),
              MaterialButton(onPressed: (){
                showToast(
                  'This is normal',
                  context: context,
                  axis: Axis.horizontal,
                  alignment: Alignment.center,
                  position: StyledToastPosition.bottom,
                  toastHorizontalMargin: 20,
                  fullWidth: true,
                );
              },
                child: Text('Explore Here',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),

              SizedBox(height: 8,),
              MaterialButton(onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:  Text('ini adalah pesan snackbar'),
                    backgroundColor: Colors.deepOrange,
                  ),

                );
              },
                child: Text('SnackBar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),
              SizedBox(height: 8,),
              MaterialButton(onPressed: (){

                //code untuk pindah page
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => PageBottomNavigationBar()
                ));
              },
                child: Text('Page Bottom Navigation Bar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),

              SizedBox(height: 8,),
              MaterialButton(onPressed: (){

                //code untuk pindah page
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => PageListUsers()
                ));
              },
                child: Text('Page List User',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),

              SizedBox(height: 8,),
              MaterialButton(onPressed: (){

                //code untuk pindah page
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => PageListBerita()
                ));
              },
                child: Text('Page List berita',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),

              SizedBox(height: 8,),
              MaterialButton(onPressed: (){

                //code untuk pindah page
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => PageRegisterApi()
                ));
              },
                child: Text('Page Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.green,
                textColor: Colors.white,
              ),
            ],
          ),
        ) ,
      ),
    );
  }
}


