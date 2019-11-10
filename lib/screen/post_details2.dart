import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../model/post2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tarjous_app/util/strings.dart';

class PostDetails2 extends StatelessWidget {
  final Articles newsArticle;
  PostDetails2({this.newsArticle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(newsArticle.title),
        centerTitle: true,
      ),
      body: bodyWidget(context),
    );
  }

  bodyWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    child: Image.network(
                      newsArticle.urlToImage == null
                          ? " "
                          : newsArticle.urlToImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        newsArticle.title,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        newsArticle.description,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: new Container(
                    child: new Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 30.0),
                          child: new RaisedButton(
                            onPressed: _launchUrl,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text(
                                Strings.readMore,
                                style: new TextStyle(color: Colors.white),
                              ),
                            ),
                            color: Theme.of(context).accentColor,
                            splashColor: Colors.deepOrangeAccent,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 110.0),
                          child: new RaisedButton(
                            onPressed: null,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text(
                                Strings.share,
                                style: new TextStyle(color: Colors.white),
                              ),
                            ),
                            color: Theme.of(context).accentColor,
                            splashColor: Colors.deepOrangeAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      );

  void _launchUrl() async {
    if (await canLaunch(newsArticle.url)) {
      launch(newsArticle.url);
    }
  }
}

Future shareNotice(BuildContext context, Articles articles) async {
  final RenderBox box = context.findRenderObject();
  final String text = "${articles.title} - ${articles.url}";

  await Share.share(
    text,
    subject: articles.description,
    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
  );
}
