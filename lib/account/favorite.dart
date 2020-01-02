import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0.0,
        title: Text('My Favorite'),
      ),
      body: Center(
        child: Container(
          child: Text('My Favorite Items'),
        ),
      ),
    );
  }
}
