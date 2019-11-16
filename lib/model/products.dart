class Products {

  int id;
  String title;
  String description;
  String imageUrl;
  double price;
  double sale;
  String url;


  Products(this.id, this.title,this.description, this.imageUrl, this.price, this.sale, this.url);

  static Products getPostFrmJSONPost(dynamic jsonObject) {
    int id = jsonObject['id'];
    String title = jsonObject['title'];
    String description = jsonObject['description'];
    double price = jsonObject['price'];
    double sale = jsonObject['sale'];
    List multiMediaList = jsonObject['multimedia'];
    String url = jsonObject['url'];
    // We want an average-quality image or nothing
    String imageUrl = multiMediaList.length > 4? multiMediaList[3]['url'] : "";
   

    return new Products(id, title, description, imageUrl, price, sale, url);
  }

  @override
  String toString() {
    return "title = $title; description = $description; imageUrl = $imageUrl; "
        "price = $price; sale = $sale; url = $url";
  }
}
