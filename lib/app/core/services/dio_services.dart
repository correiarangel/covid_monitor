
import '../interface/client_http_interface.dart';
import 'package:dio/dio.dart';

class DioServices implements IClientHttp {
  Dio _dio;
  String baseUrl = "https://corona.lmao.ninja/v2";
                    
  DioServices() {
    initDio();
  }

  initDio() {
    if (_dio == null) {
      var options = BaseOptions(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
        },
        //receiveDataWhenStatusError: true,
        baseUrl: baseUrl,
        receiveTimeout: 3000,
        connectTimeout: 10000, // tempo limite de conexão
      );
      _dio = Dio(options);
    }
  }

  @override
  Future getNation({String nation}) async {
    Response response;
    try {
      
      response = await _dio.get('/countries/$nation');
      return response;
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future getWord() async {
    Response response;
    try {
      response = await _dio.get('/all');
      return response;
    } on Exception {
      throw Exception();
    }
  }
}
