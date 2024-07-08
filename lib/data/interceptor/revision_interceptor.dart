import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RevisionInterceptor extends Interceptor {
  final String revisionKey;

  RevisionInterceptor({required this.revisionKey});

  Future<int> getCurrentRevision() async {
    final prefs = await SharedPreferences.getInstance();
    final revision = prefs.getInt(revisionKey);
    return revision ?? 1;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCurrentRevision().then((revision) {
      options.headers['X-Last-Known-Revision'] = revision.toString();
      super.onRequest(options, handler);
    });
  }
}
