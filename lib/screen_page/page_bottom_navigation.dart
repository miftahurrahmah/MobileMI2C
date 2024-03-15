import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:untitled/screen_page/page_bottom_navigation.dart';
import 'package:untitled/screen_page/page_column.dart';
import 'package:untitled/screen_page/page_detail_grid.dart';
import 'package:untitled/screen_page/page_form_register.dart';
import 'package:untitled/screen_page/page_navigation_bar.dart';
import 'package:untitled/screen_page/page_passing_data.dart';

class PageBottomNavigationBar extends StatefulWidget {
  const PageBottomNavigationBar({super.key});

  @override
  State<PageBottomNavigationBar> createState() => _PageBottomNavigationBarState();
}

class _PageBottomNavigationBarState extends State<PageBottomNavigationBar>
    with SingleTickerProviderStateMixin{

  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: TabBarView(
        controller: tabController,
        children: const [
          PageFormRegister(),
          CustomeGrid(),
          PageColumnRow()
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          controller: tabController,
          tabs: const [
            Tab(
              text: "Form Registrasi",
              icon: Icon(Icons.input),
            ),
            Tab(
              text: "Costum Grid",
              icon: Icon(Icons.grid_3x3),
            ),
            Tab(
              text: "Search List",
              icon: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}