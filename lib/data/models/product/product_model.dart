
class ProductModel {
  String? id;
  String? category;
  String? title;
  String? description;
  int? price;
  List<String>? images;
  String? createdOn;
  int? v;

  ProductModel({this.id, this.category, this.title, this.description, this.price, this.images, this.createdOn, this.v});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["category"] is String) {
      category = json["category"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if(json["createdOn"] is String) {
      createdOn = json["createdOn"];
    }
    if(json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["category"] = category;
    _data["title"] = title;
    _data["description"] = description;
    _data["price"] = price;
    if(images != null) {
      _data["images"] = images;
    }
    _data["createdOn"] = createdOn;
    _data["__v"] = v;
    return _data;
  }
}