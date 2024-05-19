
import 'package:dio/dio.dart';
import 'package:market/components/constants/api_endpoints.dart';
import 'package:market/models/product_model.dart';

class ProductService{

 Future<List<ProductModel>> getAllProducts() async{
  final dio = Dio();
  final String endpoint = ApiEndpoints().allProductsUrl;

  var response = await dio.get(endpoint);

  if(response.statusCode == 200){
       final List result = response.data;
      return result.map((e) => ProductModel.fromJson((e))).toList();
    }
    else{
      throw Exception('Failed to load API data');
    }
 }


}