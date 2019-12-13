import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/products.dart';
import '../pages/products_details.dart';
import '../util/strings.dart';

class ProductPage extends StatefulWidget {
  ProductPage() : super();

  final String title = "S-MARKET";

  @override
  _ProductPageState createState() => new _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool _isRequestSent = false;
  bool _isRequestFailed = false;
  List<Products> productsList = [];

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
                        itemCount: productsList.length,
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
        "https://my-json-server.typicode.com/esirioneyibo/my-json-server/products";
    try {
      http.Response response = await http.get(url);
      // Did request succeeded?
      if (response.statusCode == HttpStatus.OK) {
        // We're expecting a Json object as the result
        List decode = json.decode(response.body);

        parseResponse(decode);
      } else {
        handleRequestError();
      }
    } catch (e) {
      print(e);
      handleRequestError();
    }
  }

  Widget _getPostWidgets(int index) {
    var products = productsList[index];
    return new GestureDetector(
      onTap: () {
        openDetailsUI(products);
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
                  imageUrl: products.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              new Expanded(
                  child: new Container(
                margin: new EdgeInsets.all(10.0),
                child: new Text(
                  products.title,
                  style: new TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  void parseResponse(List result) {
    for (var jsonObject in result) {
      var products = Products.getPostFrmJSONPost(jsonObject);
      productsList.add(products);
      print(products);
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

  openDetailsUI(Products products) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) => new ProductsDetails(products)));
  }
}

