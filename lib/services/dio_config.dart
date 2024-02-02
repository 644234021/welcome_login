import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:welcome_login/utils/constants.dart';

class DioConfig {
  static late String _token;

  // Get token
  static _getToken() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    _token = prefs.getString('token')!;
  }

  // Create Dio instance
  static final Dio _dio = Dio()
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers['Accept'] = 'application/json';
      options.headers['Content-Type'] = 'application/json';
      options.baseUrl = baseURLAPI;
      return handler.next(options);
    }, onResponse: (response, handler) async {
      return handler.next(response);
    }, onError: (DioException e, handler) async {
      switch (e.response?.statusCode) {
        case 400:
          if (kDebugMode) {
            print('Bad Request');
          }
          break;
        case 401:
          if (kDebugMode) {
            print('Unauthorized');
          }
          break;
        case 403:
          if (kDebugMode) {
            print('Forbidden');
          }
          break;
        case 404:
          if (kDebugMode) {
            print('Not Found');
          }
          break;
        case 500:
          if (kDebugMode) {
            print('Internal Server Error');
          }
          break;
        default:
          if (kDebugMode) {
            print('Something went wrong');
          }
          break;
      }
      return handler.next(e);
    }));

  // Create Dio Instance with Auth
  static final Dio _dioWithAuth = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          await _getToken();
          options.headers['Authorization'] = 'Bearer $_token';
          options.headers['Accept'] = 'application/json';
          options.headers['Content-Type'] = 'application/json';
          options.baseUrl = baseURLAPI;
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          switch (e.response?.statusCode) {
            case 400:
              if (kDebugMode) {
                print('Bad Request');
              }
              break;
            case 401:
              if (kDebugMode) {
                print('Unauthorized');
              }
              break;
            case 403:
              if (kDebugMode) {
                print('Forbidden');
              }
              break;
            case 404:
              if (kDebugMode) {
                print('Not Found');
              }
              break;
            case 500:
              if (kDebugMode) {
                print('Internal Server Error');
              }
              break;
            default:
              if (kDebugMode) {
                print('Something went wrong');
              }
              break;
          }
          return handler.next(e);
        },
      ),
    );

  static Dio get dio => _dio;
  static Dio get dioWithAuth => _dioWithAuth;
}
