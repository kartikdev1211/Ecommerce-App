class CategoryModel {
  String? id;
  String? title;
  String? description;
  String? createdOn;
  int? v;

  CategoryModel(
      {this.id, this.title, this.description, this.createdOn, this.v});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["createdOn"] is String) {
      createdOn = json["createdOn"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["createdOn"] = createdOn;
    data["__v"] = v;
    return data;
  }
}
