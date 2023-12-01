import 'dart:convert';
import 'package:pertemuan10/model.dart';
import 'package:http/http.dart' as http;

class Repository {
  final _baseUrl = 'https://65695714de53105b0dd6ec16.mockapi.io';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + '/mobil'));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future postData(String merek, String tipe) async {
    try {
      final response = await http.post(Uri.parse(_baseUrl + '/mobil'),
          body: {"merek": merek, "tipe": tipe});

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future putData(int? id, String? merek, String? tipe) async {
    try {
      final response = await http.put(
          Uri.parse(
            _baseUrl + '/mobil/' + id.toString(),
          ),
          body: {'merek': merek, 'tipe': tipe});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future deleteData(String id) async {
    try {
      final response = await http.delete(
        Uri.parse(
          _baseUrl + '/mobil/' + id,
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}