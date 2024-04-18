import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:intl/intl.dart';


class PageFormRegister extends StatefulWidget {
  const PageFormRegister({super.key});

  @override
  State<PageFormRegister> createState() => _PageFormRegisterState();
}

class _PageFormRegisterState extends State<PageFormRegister> {
  //Untuk mendapatkan value dari text field
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtTglLahir = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  String? valAgama, valJk;

  //validasi form
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  //Untuk Datepicker
  Future selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        txtTglLahir.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Form Register'),
      ),

      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtFullName,
                  decoration: InputDecoration(
                      hintText: 'Fullname',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtUsername,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtEmail,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  onTap: (){
                    selectDate();
                  },
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtTglLahir,
                  decoration: InputDecoration(
                      hintText: 'Tanggal Lahir',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  //validasi kosong
                  validator: (val){
                    return val!.isEmpty ? "Tidak boleh kosong" : null;
                  },
                  controller: txtPassword,
                  obscureText: true, //biar password tidak kelihatan
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.center,
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.black
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: valAgama,
                    underline: Container(),
                    isExpanded: true,
                    hint: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Pilih Agama'),
                    ),
                    items: [
                      "Islam",
                      "Kristen",
                      "Protestan",
                      "Buddha"
                    ].map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valAgama = val;
                        print('hasil Agama :  ${valAgama}');
                      });
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: RadioListTile(
                        value: "Laki-laki",
                        groupValue: valJk,
                        onChanged: (val){
                          setState(() {
                            valJk = val;
                          });
                        },
                        activeColor: Colors.green,
                        title: Text(
                            'Laki-laki'
                        ),
                      ),
                    ),

                    Flexible(
                      child: RadioListTile(
                        value: "Perempuan",
                        groupValue: valJk,
                        onChanged: (val){
                          setState(() {
                            valJk = val;
                          });
                        },
                        activeColor: Colors.green,
                        title: Text(
                            'Perempuan'
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(height: 15,),
                MaterialButton(
                  color: Colors.green,
                  minWidth: 200,
                  height: 45,
                  onPressed: () {
                    if (keyForm.currentState?.validate() == true) {
                      if (valJk != null && valAgama != null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Data Register"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Fullname :${txtFullName.text}"),
                                    Text("Username :${txtUsername.text}"),
                                    Text("Email : ${txtEmail.text}"),
                                    Text("Password :${txtPassword.text}"),
                                    Text("Agama : $valAgama"),
                                    Text("Jenis Kelamin : $valJk"),
                                    Text("Tanggal Lahir :${txtTglLahir.text}")
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Dismiss"))
                                ],
                              );
                            });
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Pilih agama dan jenis kelamin"),
                          backgroundColor: Colors.green,
                        ));
                      }
                    }
                  },
                  child: const Text("SIMPAN"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
