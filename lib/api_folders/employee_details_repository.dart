import 'dart:convert' as convert;

import 'package:employee_directory/api_folders/employee_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeDetailsRepository {
  List<EmployeeDetailsModel?> employeeList = [];

  /// API call for getting the employee details.
  Future<List<EmployeeDetailsModel?>?>? getEmployeeDetails() async {
    var response = await http
        .get(Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'));
    if (response.statusCode == 200) {
      var responseBody = convert.jsonDecode(response.body);
      responseBody.forEach((e) {
        employeeList.add(EmployeeDetailsModel.fromJson(e));
      });
      return employeeList;
    } else {
      debugPrint('Request failed with status: ${response.statusCode}.');
    }
  }
}
