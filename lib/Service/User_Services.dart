import 'package:dio/dio.dart';
import 'package:http_request/models/User_Model.dart';

class UserServices{
  String url ='https://jsonplaceholder.typicode.com/users';
  final dio = Dio();

  getUser() async {
    List <UserModel> userList =[];
    final response = await dio.get(url);
    var data =response.data;
    data.forEach((element){
      UserModel user = UserModel.fromJson(element);
      userList.add(user);
    });
    return userList;
  }
}