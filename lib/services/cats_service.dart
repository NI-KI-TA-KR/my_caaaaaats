import 'package:cat_app/models/cat.dart';
import 'package:dio/dio.dart';

abstract class CatsService{
  Future<List<Cat>> getCats();
}

class CatsServiceImpl extends CatsService{
  Future<List<Cat>> getCats() async{
    try{
      final response = await Dio().get("https://api.thecatapi.com/v1/breeds");

      if(response.statusCode == 200){
        final data = response.data;
        final List<Cat> maped = data.map<Cat>((json) => Cat.fromJson(json)).toList();
        return maped;
      }
      return [];

    } catch(_){
        return [];
    }
  }
}