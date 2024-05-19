
import 'package:dio/dio.dart';
import 'package:market/components/constants/api_endpoints.dart';

class CategoryService {

  Future<List<String>> getAllCategories() async{
    final dio = Dio();
    final String endPoint = ApiEndpoints().allCategoriesUrl;

    var response = await dio.get(endPoint);

    if(response.statusCode == 200){
      List<dynamic> data = response.data;
    List<String> categories = data.map((e) => e.toString()).toList();
    return categories;


    }else{
      throw Exception('Failed to load API data');
    }
  }
  
}