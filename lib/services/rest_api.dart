import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:welcome_login/services/dio_config.dart';
import 'package:welcome_login/utils/utility.dart';

//import '../models/book_model.dart';

class BookShopAPI {
  // สร้าง Dio Instance
  final Dio _dio = DioConfig.dio;
  final Dio _dioWithAuth = DioConfig.dioWithAuth;

  // Register API
  register(data) async {
    // Check Network Connection
    if (await Utility.checkNetwork() == '') {
      return jsonEncode({'message': 'No Network Connection'});
    } else {
      try {
        final response = await _dio.post('users/auth/register', data: data);
        if (kDebugMode) {
          print(response.data);
        }
        return jsonEncode(response.data);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  // Login API -----------------------------------------------------------------
  login(data) async {
    // Check Network Connection
    if (await Utility.checkNetwork() == '') {
      return jsonEncode({'message': 'No Network Connection'});
    } else {
      try {
        final response = await _dio.post('users/auth/signin', data: data);
        if (kDebugMode) {
          print(response.data);
        }
        return jsonEncode(response.data);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
  // ---------------------------------------------------------------------------

}
