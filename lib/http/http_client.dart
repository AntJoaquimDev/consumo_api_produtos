import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
}

class HttpClient implements IHttpClient {
  final response = http.Client();
  @override
  Future get({required String url}) async {
    return await http.get(Uri.parse(url));
  }
}
