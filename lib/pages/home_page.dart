import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/post.dart';
import '../pages/post_details.dart';
import '../util/strings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  final String title = "K-MARKET";

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isRequestSent = false;
  bool _isRequestFailed = false;
  List<Post> postList = [];

  @override
  Widget build(BuildContext context) {
    if (!_isRequestSent) {
      sendRequest();
    }
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: new Text(widget.title),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: !_isRequestSent
            ? new CircularProgressIndicator()
            : _isRequestFailed
                ? _showRetryUI()
                : new Container(
                    child: new ListView.builder(
                        itemCount: postList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return _getPostWidgets(index);
                        }),
                  ),
      ),
    );
  }

  void sendRequest() async {
    String url =
        "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=${Strings.apiKey}";
    try {
      http.Response response = await http.get(url);
      // Did request succeeded?
      if (response.statusCode == HttpStatus.OK) {
        // We're expecting a Json object as the result
        Map decode = json.decode(response.body);
        parseResponse(decode);
      } else {
        print(response.statusCode);
        handleRequestError();
      }
    } catch (e) {
      print(e);
      handleRequestError();
    }
  }

  Widget _getPostWidgets(int index) {
    var post = postList[index];
    return new GestureDetector(
      onTap: () {
        openDetailsUI(post);
      },
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: new Card(
          elevation: 3.0,
          child: new Row(
            children: <Widget>[
              new Container(
                width: 150.0,
                child: new CachedNetworkImage(
                  imageUrl: post.thumbUrl,
                  fit: BoxFit.cover,
                ),
              ),
              new Expanded(
                  child: new Container(
                margin: new EdgeInsets.all(10.0),
                child: new Text(
                  post.title,
                  style: new TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  void parseResponse(Map response) {
    List results = response["results"];
    for (var jsonObject in results) {
      var post = Post.getPostFrmJSONPost(jsonObject);
      postList.add(post);
      print(post);
    }
    setState(() => _isRequestSent = true);
  }

  void handleRequestError() {
    setState(() {
      _isRequestSent = true;
      _isRequestFailed = true;
    });
  }

  Widget _showRetryUI() {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            Strings.requestFailed,
            style: new TextStyle(fontSize: 16.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 10.0),
            child: new RaisedButton(
              onPressed: retryRequest,
              child: new Text(
                Strings.retry,
                style: new TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              splashColor: Colors.deepOrangeAccent,
            ),
          )
        ],
      ),
    );
  }

  void retryRequest() {
    setState(() {
      // Let's just reset the fields.
      _isRequestSent = false;
      _isRequestFailed = false;
    });
  }

  openDetailsUI(Post post) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new PostDetails(post)));
  }
}
