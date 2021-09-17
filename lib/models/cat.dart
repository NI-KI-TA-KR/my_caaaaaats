abstract class Cat{

  String? get name;
  String? get origin;
  String? get urlImage;
  String? get wikipediaUrl;

  factory Cat.fromJson(Map<String, dynamic> json) => CatImpl.fromJson(json);
}

class CatImpl implements Cat{
  CatImpl({this.name, this.origin, this.urlImage, this.wikipediaUrl});

  final String? name;
  final String? origin;
  final String? urlImage;
  final String? wikipediaUrl;

  factory CatImpl.fromJson(Map<String, dynamic> json){
    try{
    return CatImpl(
      name: json['name'],
      origin: json['origin'],
      urlImage:  json.containsKey('image') ? json['image']['url'] : null,
      wikipediaUrl: json['wikipedia_url']
    );
    } catch(_){
      throw Exception(_);
    }
  }
}