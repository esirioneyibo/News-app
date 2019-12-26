import 'package:flutter/material.dart';
import 'package:tarjous_app/account/favorite.dart';
import 'package:tarjous_app/account/login_page.dart';
import 'package:tarjous_app/pages/home_page.dart';
import 'package:tarjous_app/pages/home_page2.dart';
import 'package:tarjous_app/pages/products_page.dart';

import 'myMenu.dart';

class Menus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          MyMenu(
            title: "K-Market",
            imageUrl: 'assets/images/k-market.png',
            shape: Colors.brown,
            page: MyHomePage(),
          ),
          MyMenu(
            title: "K-CityMarket",
            imageUrl: 'assets/images/k-citymarket.png',
            shape: Colors.grey,
            page: HomePage2(),
          ),
          MyMenu(
            title: "S-Market",
            imageUrl: 'assets/images/s-market.png',
            shape: Colors.indigo,
            page: ProductPage(),
          ),
          MyMenu(
            title: "Gigantti",
            imageUrl: 'assets/images/gigantti.png',
            shape: Colors.orange,
            page: LoginPage(),
          ),
          MyMenu(
            title: "H&M",
            imageUrl: 'assets/images/h&m.png',
            shape: Colors.red,
            page: FavoritesScreen(),
          ),
          MyMenu(
            title: "Mototnet",
            imageUrl: 'assets/images/motonet.png',
            shape: Colors.deepOrange,
            page: FavoritesScreen(),
          ),
          MyMenu(
            title: "K-Rauta",
            imageUrl: 'assets/images/k-rauta.png',
            shape: Colors.lightGreen,
            page: FavoritesScreen(),
          ),
          MyMenu(
            title: "Lindex",
            imageUrl: 'assets/images/lindex.png',
            shape: Colors.lightBlue,
            page: FavoritesScreen(),
          ),
          MyMenu(
            title: "Sportia",
            imageUrl: 'assets/images/sportia.png',
            shape: Colors.deepPurple,
            page: FavoritesScreen(),
          ),
          MyMenu(
            title: "XXL",
            imageUrl: 'assets/images/xxl.png',
            shape: Colors.teal,
            page: FavoritesScreen(),
          ),
        ],
      ),
    );
  }
}
