class BaseProperty {
  int? id;
  String? image;
  String? name;
  String? discription;

  BaseProperty({this.id, this.image, this.name, this.discription});

  factory BaseProperty.fromJson(Map<String, dynamic> parsedJson) {
    return BaseProperty(
        id: parsedJson['id'],
        image: parsedJson["image"],
        name: parsedJson["name"],
        discription: parsedJson["discription"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "image": image, "name": name, "discription": discription};
  }
}
