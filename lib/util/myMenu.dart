import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.icon, this.shape, this.page, this.imageUrl = ''}) {
    if (icon != null) {
      assert(imageUrl == null || imageUrl.isEmpty);
    } else if (imageUrl != null && imageUrl.isEmpty) {
      assert(icon == null);
    }
  }

  final page;
  final String title;
  final IconData icon;
  final String imageUrl;
  final MaterialColor shape;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(9.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
        splashColor: Colors.amberAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                visible: icon != null && imageUrl.isEmpty,
                child: Icon(
                  icon,
                  size: 80.0,
                  color: shape,
                ),
                replacement: Image.asset(
                  imageUrl,
                  width: 80,
                  height: 80,
                ),
              ),
              Text(title, style: new TextStyle(fontSize: 18.0))
            ],
          ),
        ),
      ),
    );
  }
}
