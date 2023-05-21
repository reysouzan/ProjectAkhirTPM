import 'package:flutter/material.dart';
import 'package:tpm_projekakhir_123200021/apipage.dart';
import 'package:tpm_projekakhir_123200021/konversi_uang.dart';
import 'package:tpm_projekakhir_123200021/konversi_waktu.dart';
import 'package:tpm_projekakhir_123200021/profil.dart';

class BottomNavPage extends StatefulWidget {
  final VoidCallback signOut;
  const BottomNavPage({Key? key, required this.signOut}) : super(key: key);
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {

  int _selectedTabIndex = 0;

  signOut() {
    setState(() {
      widget.signOut();
    });
  }


  void _onNavbarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _listPage = [

      AlcoholPage(),
      ProfilDetail(),
      KonversiUangPage(),
      Calendar(),

    ];
    final _bottomNavBarItems = <BottomNavigationBarItem>[

      const BottomNavigationBarItem(
        icon: Icon(Icons.no_drinks),
        label: 'Alcohol',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.calendar_view_month),
        label: "Profil",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.calculate),
        label: 'Konversi Uang',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.timelapse),
        label: 'Konversi Waktu',
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: _onNavbarTapped,
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {signOut();}, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: _listPage[_selectedTabIndex],
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
