import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:sampleapi1/model/modelclass.dart';

class Dioservice extends GetConnect {
  final String url = "https://ajcjewel.com:4000/api/global-gallery/list";
  final String authkey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcyNjkxMjA1OCwiZXhwIjoxNzU4NDQ4MDU4fQ.2DIEnBnB0Xgc1USz5zmCMRoq0V55Wap_haKYxUs9hwA";

  Future<List<itemslist>> getItems() async {
    final Dio dio = Dio();
    final headers = {
      'Authorization': authkey,
    };
    final bodydata = {
      "statusArray": [1],
      "screenType": [],
      "responseFormat": [],
      "globalGalleryIds": [],
      "categoryIds": [],
      "docTypes": [],
      "types": [],
      "limit": 10,
      "skip": 0,
      "searchingText": ""
    };
    try {
      final response = await post(url, bodydata, headers: headers);
      if (response.statusCode == 200) {
        final List<dynamic> list = response.body['data']['list'];
        return list.map((json) => itemslist.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load gallery items');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load');
    }
  }
}
