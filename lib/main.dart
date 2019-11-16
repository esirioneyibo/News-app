import 'package:flutter/material.dart';
import 'package:tarjous_app/screen/account.dart';
import 'package:tarjous_app/screen/help_screen.dart';
import 'package:tarjous_app/screen/login_page.dart';
import 'package:tarjous_app/screen/products_page.dart';
import 'package:tarjous_app/screen/setting_screen.dart';
import 'pages/home_page.dart';
import 'pages/home_page2.dart';
import 'screen/favorite.dart';

void main(List<String> args) {
  runApp(
    new MaterialApp(
      home: TarjousAle(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class TarjousAle extends StatefulWidget {
  @override
  _TarjousAleState createState() => _TarjousAleState();
}

class _TarjousAleState extends State<TarjousAle>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("TARJOUSHAUKKA!!!"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new Card(
              child: UserAccountsDrawerHeader(
                accountName: new Text("Naomi A. Schultz"),
                accountEmail: new Text("NaomiASchultz@armyspy.com"),
                decoration: new BoxDecoration(
                  backgroundBlendMode: BlendMode.difference,
                  color: Colors.white30,

                  /* image: new DecorationImage(
               //   image: new ExactAssetImage('assets/images/lake.jpeg'),
                  fit: BoxFit.cover,
                ),*/
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://www.fakenamegenerator.com/images/sil-male.png")),
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.favorite),
                      title: new Text("Profile"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountScreen()));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.history),
                      title: new Text("Favorite "),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FavoritesScreen(
                                      toolbarname: 'Favorite',
                                    )));
                      }),
                ],
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new Column(
                children: <Widget>[
                  new ListTile(
                      leading: Icon(Icons.settings),
                      title: new Text("Setting"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingScreen(
                                      toolbarname: 'Setting',
                                    )));
                      }),
                  new Divider(),
                  new ListTile(
                      leading: Icon(Icons.help),
                      title: new Text("Help"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpScreen(
                                      toolbarname: 'Help',
                                    )));
                      }),
                ],
              ),
            ),
            new Card(
              elevation: 4.0,
              child: new ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: new Text(
                    "Logout",
                    style:
                        new TextStyle(color: Colors.redAccent, fontSize: 17.0),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }),
            )
          ],
        ),
      ),
      body: Container(
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        iconSize: 30.0,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      //body: currentPage,
    );
  }
}

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
