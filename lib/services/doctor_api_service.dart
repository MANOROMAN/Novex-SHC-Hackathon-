import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorApiService {
  // TODO: Move token to remote config/secure storage if needed
  static const String _base =
      'https://us-central1-smile-hair-clinic-app.cloudfunctions.net';
  static const String _token = 'set-a-strong-token';

  Future<List<Map<String, dynamic>>> listUsers({int limit = 500}) async {
    final uri = Uri.parse('$_base/listUsersPublic?token=$_token&limit=$limit');
    final res = await http.get(uri);
    if (res.statusCode >= 200 && res.statusCode < 300) {
      final json = jsonDecode(res.body) as Map<String, dynamic>;
      final items = (json['items'] as List).cast<Map>().map((e) => Map<String, dynamic>.from(e)).toList();
      return items;
    }
    return [];
  }
  Future<bool> approveAnalysis(String userId, String analysisId) async {
    final uri = Uri.parse('$_base/approveAnalysis?token=$_token');
    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId, 'analysisId': analysisId}),
    );
    return res.statusCode >= 200 && res.statusCode < 300;
  }

  Future<bool> rejectAnalysis(String userId, String analysisId) async {
    final uri = Uri.parse('$_base/rejectAnalysis?token=$_token');
    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'userId': userId, 'analysisId': analysisId}),
    );
    return res.statusCode >= 200 && res.statusCode < 300;
  }
}


