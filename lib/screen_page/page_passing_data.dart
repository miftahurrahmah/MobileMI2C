import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/screen_page/page_halaman.dart';

class PagePassingData extends StatelessWidget {
  const PagePassingData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Passing Data'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
            title: Text('Judul Berita ke ${index}'),
            subtitle: Text('Ini sub Berita ke ${index}'),
            onTap: (){
            //isi berita
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageGetData(index)));
          },
          ),
          );
        }
      ),
    );
  }
}

class PageGetData extends StatelessWidget {
  final int index;
  const PageGetData(this.index,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Get Data'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Ini adalah judul berita ke ${index}'),
            Text('Ini adalah judul berita ke ${index}'),
          ],
        ),
      ),
    );
  }
}

class PageLoginState extends StatefulWidget {
  const PageLoginState({super.key});

  @override
  State<PageLoginState> createState() => _PageLoginStateState();
}

class _PageLoginStateState extends State<PageLoginState> {
  //untuk mendapatkan value dekaralasi
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Page Login'),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 8,),
            TextFormField(
              controller: txtUsername,
              decoration: InputDecoration(
                hintText: 'Input Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
            SizedBox(height: 8,),

            TextFormField(
              controller: txtPassword,
              obscureText: true ,
              decoration: InputDecoration(
                  hintText: 'Input Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
              ),
            ),
            SizedBox(height: 15,),
            MaterialButton(onPressed: (){
              setState(() {
                String username = txtUsername.text;
                String password = txtPassword.text;

                if (username == 'Admin' && password == '123456') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PageLogin()),
                  );
                }else{
                  showToast('Username atau Password salah',
                      context: context,
                      backgroundColor: Colors.grey,
                      textStyle: TextStyle(color: Colors.white),
                      textPadding: EdgeInsets.all(16),
                      duration: Duration(seconds: 2));
                }
              });

            },
            child: Text('Login'),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}




