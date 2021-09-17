import 'package:cat_app/models/cat.dart';
import 'package:dio/dio.dart';

abstract class CatsService{
  Future<CatsResponse> getCats();
}

class CatsServiceImpl extends CatsService{

  final Dio _dio = Dio();

  Future<CatsResponse> getCats() async{
    try{
      final response = await _dio.get("https://api.thecatapi.com/v1/breeds");

      if(response.statusCode == 200){
        final data = response.data;
        final List<Cat> maped = data.map<Cat>((json) => Cat.fromJson(json)).toList();
        return CatsResponse(isSuccessful: true, cats: maped);
      }
      return CatsResponse(isSuccessful: true, cats: []);

    } catch(error){
        return CatsResponse(isSuccessful: false, errorMessage: "${error.toString()}");
    }
  }
}

class CatsResponse{
  CatsResponse({required this.isSuccessful, this.errorMessage, this.cats});

  final bool isSuccessful;
  final String? errorMessage;
  final List<Cat>? cats;
}