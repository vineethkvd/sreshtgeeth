class BaseService {
  int? id;
  String? image;
  String? name;
  String? discription;

  BaseService({this.id, this.image, this.name, this.discription});

  factory BaseService.fromJson(Map<String, dynamic> parsedJson) {
    return BaseService(
        id: parsedJson['id'],
        image: parsedJson["image"],
        name: parsedJson["name"],
        discription: parsedJson["discription"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "image": image, "name": name, "discription": discription};
  }
}
