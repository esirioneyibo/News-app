import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/products.dart';
import '../util/strings.dart';

class ProductsDetails extends StatefulWidget {
  ProductsDetails(this.products);
  final Products products;

  @override
  State<StatefulWidget> createState() => new _ProductsDetailsState(products);
}

class _ProductsDetailsState extends State<ProductsDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Products products;

  _ProductsDetailsState(this.products);

  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.amber,
          title: new Text(
            products.title,
            style: new TextStyle(fontSize: 16.0),
            overflow: TextOverflow.fade,
          ),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {
                  _scaffoldKey.currentState
                      .showSnackBar(const SnackBar(content: const Text('')));
                  shareNotice(context, products);
                }),
          ],
        ),
        body: new Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: _productsCardView(),
          ),
        ),
      );

  Widget _productsCardView() {
    return Card(
      color: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: new Container(
        margin: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new Text(
              products.title,
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            new Padding(
              padding: new EdgeInsets.symmetric(vertical: 10.0),
              child: new Divider(
                height: 1.0,
                color: Colors.black,
              ),
            ),
            /* new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.access_time,
                  color: Colors.grey,
                ),
                new Padding(
                  padding: new EdgeInsets.symmetric(horizontal: 10.0),
                  child: new Text(getFormattedTime()),
                )
              ],
            ), */
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: new Container(
                width: double.infinity,
                height: 150.0,
                margin: new EdgeInsets.all(15.0),
                child: new CachedNetworkImage(
                  imageUrl: products.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: new EdgeInsets.all(15.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  products.description,
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            new ButtonTheme(
              // make buttons use the appropriate styles for cards
              child: new ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new FlatButton(
                    child: new Text(Strings.readMore),
                    onPressed: _launchUrl,
                  ),
                  new FlatButton(
                    child: new Text(Strings.share),
                    onPressed: () {
                      shareNotice(context, products);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

/*   String getFormattedTime() {
    var timeStamp = new DateTime.fromMillisecondsSinceEpoch(products.timeStamp);
    var formatter = new DateFormat('dd MMM, yyyy. HH:mm');
    return formatter.format(timeStamp);
  } */

  void _launchUrl() async {
    String url = products.url;
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text('Cannot launch "$url"')));
    }
  }
}

Future shareNotice(BuildContext context, Products products) async {
  final RenderBox box = context.findRenderObject();
  final String text = "${products.title} - ${products.url}";

  await Share.share(
    text,
    subject: products.description,
    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
  );
}
