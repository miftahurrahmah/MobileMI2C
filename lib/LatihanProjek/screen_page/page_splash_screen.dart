import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/LatihanProjek/screen_page/page_bottom_menu_projek.dart';
import 'package:untitled/LatihanProjek/screen_page/page_login_projek.dart';
import 'package:untitled/LatihanProjek/screen_page/page_register_projek.dart';


class PageSplashScreen extends StatelessWidget {
  const PageSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Projek Latihan'),
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              MaterialButton(onPressed: (){
                //code untuk pindah page
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => PageLoginApi()
                ));
              },
                child: Text('Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.blue,
                textColor: Colors.white,
              ),

              SizedBox(height: 8),
              MaterialButton(onPressed: (){
                //code untuk pindah page
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => PageFormRegister()
                ));
              },
                child: Text('Register',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.blue,
                textColor: Colors.white,
              ),

              SizedBox(height: 8),
              MaterialButton(onPressed: (){
                //code untuk pindah page
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => PageBottomNavigationBar()
                ));
              },
                child: Text('Menu Utama',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  ),
                ),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
