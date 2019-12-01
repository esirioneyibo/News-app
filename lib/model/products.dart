class Products {
  int id;
  String title;
  String description;
  String imageUrl;
  double price;
  double sale;
  String url;

  Products(this.id, this.title, this.description, this.imageUrl, this.price,
      this.sale, this.url);

  static Products getPostFrmJSONPost(dynamic jsonObject) {
    final multimedia = jsonObject['multimedia'];

    int id = jsonObject['id'];
    String title = jsonObject['title'];
    String description = jsonObject['description'];
    double price = jsonObject['price'];
    double sale = jsonObject['sale'];

    String imageUrl =
        multimedia == null ? jsonObject['imageUrl'] : getImageUrl(multimedia);
    String url = jsonObject['url'];
    // We want an average-quality image or nothing

    return new Products(id, title, description, imageUrl, price, sale, url);
  }

  static String getImageUrl(List multiMedia) =>
      multiMedia.length > 4 ? multiMedia[3]['url'] : "";

  @override
  String toString() {
    return "title = $title; description = $description; imageUrl = $imageUrl; "
        "price = $price; sale = $sale; url = $url";
  }
}
