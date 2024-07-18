import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RevisionInterceptor extends Interceptor {
  final String revisionKey;

  const RevisionInterceptor({required this.revisionKey});

  Future<int> _getCurrentRevision() async {
    final prefs = await SharedPreferences.getInstance();
    final revision = prefs.getInt(revisionKey);
    return revision ?? 1;
  }

  Future<void> _setRevision(int revision) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(revisionKey, revision);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _getCurrentRevision().then((revision) {
      options.headers['X-Last-Known-Revision'] = revision.toString();
      super.onRequest(options, handler);
    });
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    final revision = int.tryParse(
          (response.data as Map<String, dynamic>)['revision'].toString(),
        ) ??
        1;
    _setRevision(revision);
  }
}
