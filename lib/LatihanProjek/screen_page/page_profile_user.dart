import 'package:flutter/material.dart';

class PageUser extends StatefulWidget {
  const PageUser({Key? key}) : super(key: key); // Tambahkan Key? key

  @override
  State<PageUser> createState() => _PageUserState();
}

class _PageUserState extends State<PageUser> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profil User',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
      ),
    ); // Tambahkan kurung kurawal penutup untuk MaterialApp
  }
}

