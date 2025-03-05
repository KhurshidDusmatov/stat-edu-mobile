import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:rttrm_task_app/data/server/auth_interceptor.dart';
import 'package:rttrm_task_app/domain/entities/login/login_request.dart';
import 'package:rttrm_task_app/domain/entities/login/login_response.dart';

import 'api_constant.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(AuthInterceptor authInterceptor) {
    var options = BaseOptions(
        connectTimeout: Duration(milliseconds: ApiConst.CONNECTION_TIME),
        sendTimeout:Duration(milliseconds:ApiConst.SEND_TIME_OUT),
        baseUrl: ApiConst.Base_URl,
        headers: ApiConst.HEADERS);
    Dio dio = Dio(options);
    dio.interceptors
      ..add(authInterceptor)
      ..add(LogInterceptor(requestBody: true, responseBody: true));

    return _ApiService(dio);
  }

  // auth
  @POST(ApiConst.LOGIN)
  Stream<LoginResponse> login(@Body() LoginRequest request,  @Header('Accept-Language') String lang);

}
