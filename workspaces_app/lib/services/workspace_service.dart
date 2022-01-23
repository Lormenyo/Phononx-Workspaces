import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

class WorkspaceService {
  static getWorkspaces() async {
    var url = Uri.parse('https://api.carbonvoice.app/challenge/workspaces');
    final retryOptions = RetryOptions(maxAttempts: 5);
    final response = await retryOptions.retry(
      // Make a GET request
      () => http.get(url).timeout(Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    if (response.statusCode == 200) {
      var workspaceData = jsonDecode(response.body);
      return workspaceData["workspaces"];
    } else {
      throw Exception('Failed to load post');
    }
  }
}
