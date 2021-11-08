
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/member_login_model.dart';

class APIService {
  Future<MemberLoginResponseModel> login(MemberLoginRequestModel requestModel) async {
    const baseUrl  = "http://bdtunes.com.bd/test/api/login";
    

    final response = await http.post(Uri.parse(baseUrl), body: requestModel.toJson());
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      return MemberLoginResponseModel.fromJson(
        json.decode(response.body),
      );
    }
    else {
      throw Exception('Failed to load data!');
    }
  }

  Future<MemberRegisterResponseModel> register(MemberRegisterRequestModel requestModel) async {
    const baseUrl = "http://bdtunes.com.bd/test/api/register";

    final response = await http.post(Uri.parse(baseUrl), body: requestModel.toJson());
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400 || response.statusCode == 500) {
      return MemberRegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    }
    
    else {
      return MemberRegisterResponseModel.fromJson(
        json.decode(jsonEncode({"error": response.body.toString(),"token": null})),
      );
    }
  }
}
