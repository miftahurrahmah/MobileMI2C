import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/LatihanProjek/screen_page/page_bottom_menu_projek.dart';
import 'package:untitled/LatihanProjek/screen_page/page_login_projek.dart';
import 'package:untitled/LatihanProjek/screen_page/page_profile_user.dart';
import 'package:untitled/LatihanProjek/screen_page/page_splash_screen.dart';
import 'package:untitled/PagePraktek/screen_page/page_column.dart';
import 'package:untitled/PagePraktek/screen_page/page_list_users.dart';
import 'package:untitled/PagePraktek/screen_page/page_passing_data.dart';
import 'package:untitled/SimulasiUTS/page/berita.dart';
import 'package:untitled/SimulasiUTS/page/splash_screen.dart';


void main() {
  //runApp(const MyApp());
  runApp(MyApp());
}

//stateless untuk widget statis
//stateful untuk widget dinamis
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyApp(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Gunakan SplashScreen sebagai home
      home: PageSplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//untuk membuat class --> ketuk st

// class PageUtama extends StatelessWidget {
//   const PageUtama({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('Project MI2C'),
//       ),
//       body: Center(
//         child: Text('Ini adalah Project Pertama'),
//       ),
//     );
//   }
// }

//contoh hirarki multiple
//appBar: Properti
//AppBar: class atau widget
