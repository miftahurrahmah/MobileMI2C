import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/PagePraktek/screen_page/page_list_berita.dart';
import 'package:untitled/PagePraktek/screen_page/page_register_api.dart';
import 'package:untitled/utils/session_manager.dart';
import '../model/model_login.dart';

class PageLoginApi extends StatefulWidget {
  const PageLoginApi({Key? key});

  @override
  State<PageLoginApi> createState() => _PageLoginApiState();
}

class _PageLoginApiState extends State<PageLoginApi> {
  // Untuk mendapatkan nilai dari text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  // Validasi form
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLoading = false;
  Future<ModelLogin?> loginAccount() async {
    // Handle error
    try {
      setState(() {
        isLoading = true;
      });

      http.Response response = await http.post(
        Uri.parse('http://10.126.57.154/beritaDb/login.php'),
        body: {
          "username": txtUsername.text,
          "password": txtPassword.text,
        },
      );

      ModelLogin data = modelLoginFromJson(response.body);

      // Cek kondisi
      if (data.value == 1) {
        // Kondisi ketika berhasil register
        setState(() {
          isLoading = false;
          session.saveSession(data.value ?? 0, data.id ?? "", data.username ?? "");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}'),
          ));

          // Pindah ke halaman PageListBerita
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PageListBerita()),
          );
        });
      } else if (data.value == 2) {
        // Kondisi akun sudah ada
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${data.message}'),
          ));
        });
      } else {
        // Gagal
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${data.message}'),
          ));
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Form  Login'),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  // Validasi kosong
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtUsername,
                  decoration: InputDecoration(
                    hintText: 'Input Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (val) {
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtPassword,
                  obscureText: true, // Agar password tidak kelihatan
                  decoration: InputDecoration(
                    hintText: 'Input Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : MaterialButton(
                    onPressed: () async {
                      // Cek validasi form apakah ada yang kosong atau tidak
                      if (keyForm.currentState?.validate() == true) {
                        await loginAccount();
                      }
                    },
                    child: Text('Login'),
                    color: Colors.green,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(width: 1, color: Colors.green),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageRegisterApi()),
            );
          },
          child: Text('Anda belum punya account? Silakan Register'),
        ),
      ),
    );
  }
}
