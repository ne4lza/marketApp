import 'package:dio/dio.dart';
import 'package:market/components/constants/api_endpoints.dart';
import 'package:market/models/user_model.dart';

class AuthService {

  Future<UserModel> authUser(String userName,String password) async{
    final dio = Dio();
    String endpoint = ApiEndpoints().loginUrl;
    Map<String,String> data = {
      'username': userName,
      'password': password
    };
    var response = await dio.post(
      endpoint,
      data: data,
      options: Options(
        headers: {
        'Content-Type': 'application/json',
      },
      )
    );

    if(response.statusCode == 200){
      var result = UserModel.fromJson(response.data);
      return result;
    }
    else if(response.statusCode == 400){
      throw Exception('Kullanıcı adı veya şifre hatalı');
    }
    else{
      throw Exception('Failed to load API data');
    }
    

  }
  
}