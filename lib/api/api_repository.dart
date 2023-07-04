
import 'package:dio/dio.dart';
import 'package:unit_one/helper/toast.dart';

class ApiRepository {
  final String? url;
  final Map<String,dynamic>? payload;

  ApiRepository({ this.url,  this.payload});

  final Dio _dio = Dio();

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    _dio.get(url!, queryParameters:payload).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        showToast("Error","There is a problem, please try again", ToastType.WARNING);
        onError(error);
      }
    });
  }
}
