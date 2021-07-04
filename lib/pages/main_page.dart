import 'package:flutter/material.dart';
import 'package:tarjous_app/util/drawer.dart';
import 'package:tarjous_app/util/menus.dart';

class TarjousAle extends StatefulWidget {
  //TarjousAle({this.auth, this.onSignedOut,})

  //final AuthImplementation auth;
  //final VoidCallback onSignedOut;

  @override
  _TarjousAleState createState() => _TarjousAleState();
}

class _TarjousAleState extends State<TarjousAle>
    with SingleTickerProviderStateMixin {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("TARJOUSHAUKKA!!!"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      drawer: MyDrawer(),
      body: Menus(), // _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        iconSize: 30.0,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            // ignore: deprecated_member_use
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // ignore: deprecated_member_use
            title: Text('Profile'),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
