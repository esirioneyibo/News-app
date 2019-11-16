import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../pages/post_details2.dart';
import '../model/post2.dart';
import '../util/strings.dart';


class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> { 
  var url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=${Strings.apiKey2}";

  newsClass news;
  
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async{
    var res = await get(url);
    var decodedJson = jsonDecode(res.body);
    news = newsClass.fromJson(decodedJson);
    print(res.body);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Colors.red,
        title: Text("Daily News"),
        centerTitle: true,
      ),
      body: news== null ? Center(child: 
      CircularProgressIndicator()):
      GridView.count(
       crossAxisCount: 1,
       children: news.articles.map((n) =>
        InkWell(
          onTap: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=> PostDetails2(
              newsArticle: n,
            )));
          },
          child: Hero(
            tag: n.title,
            child: Card(
               semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    n.urlToImage == null ? "https://www.aljazeera.com/mritems/Images/2019/10/15/3f1fccd4b0e54adea1ce9669903cad42_18.jpg":n.urlToImage,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Wrap(children: <Widget>[
                      Text(n.title,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,)),
                    ],
                     
                    ),
                  ),
                 
                ],
              ),
              
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              
            ),
          ),
        ),
       ).toList(),
       ),
    );
  }
}
