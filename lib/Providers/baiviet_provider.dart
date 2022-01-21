import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/baiviet_object.dart';
import 'package:vietnam_travel_app/Providers/user_provider.dart';

class BaiVietProvider {
  static List<BaiVietChiaSeObject> parseBaiViet(String reponseBody) {
    final pased = jsonDecode(reponseBody)["data"].cast<Map<String, dynamic>>();
    return pased
        .map<BaiVietChiaSeObject>((e) => BaiVietChiaSeObject.fromJson(e))
        .toList();
  }

  static Future<List<BaiVietChiaSeObject>> getAllBaiViet() async {
    var token = await UserProvider.getToken();
    final response = await http.get(Uri.parse(urlAPI + 'baiviet'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return parseBaiViet(response.body);
  }

  static Future<List<BaiVietChiaSeObject>> getAllBaiVietNoiBat() async {
    var token = await UserProvider.getToken();
    final response =
        await http.get(Uri.parse(urlAPI + 'baiviet/noibat'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return parseBaiViet(response.body);
  }

  static Future<List<BaiVietChiaSeObject>> getAllBaiVietUser(int idUser) async {
    var token = await UserProvider.getToken();
    final response =
        await http.get(Uri.parse(urlAPI + 'user/$idUser/baiviet'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    return parseBaiViet(response.body);
  }

  static Future<bool> createPost(
      File _image, String idDiaDanh, String idUser, String noiDung) async {
    var token = await UserProvider.getToken();
    var stream = http.ByteStream(_image.openRead());
    stream.cast();
    var length = await _image.length();
    Map<String, String> headers = {"Authorization": "Bearer $token"};

    var uri = Uri.parse(urlAPI + "baiviet/create");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    request.fields["idDiaDanh"] = idDiaDanh;
    request.fields["idUser"] = idUser;
    request.fields["noiDung"] = noiDung;

    var multiport =
        http.MultipartFile("hinhAnh", stream, length, filename: _image.path);

    request.files.add(multiport);
    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
