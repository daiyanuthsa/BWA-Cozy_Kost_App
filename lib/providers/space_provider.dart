import 'dart:convert';

import 'package:bwa_cozy_kost/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bwa_cozy_kost/config/app_constant.dart';
import 'package:d_method/d_method.dart';

class SpaceProvider extends ChangeNotifier {
  getRecomendedSpaces() async {
    Uri url = Uri.parse('${AppConstant.baseUrl}/recommended-spaces');
    var response = await http.get(url);

    DMethod.printBasic(response.statusCode.toString());

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    }
    else{
      return <Space>[];
    }
    
  }
}
