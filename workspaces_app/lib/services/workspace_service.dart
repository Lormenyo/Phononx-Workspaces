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

    // var data =
    //     '{"success": true, "workspaces": [{"id": 1,"name": "Daily Standup","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/og-images/fVsLWBn1NrOwEwhr.jpeg"},{"id": 2,"name": "Company X","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/qTodSPDtNWzq/logo-1635785199308.png"}, {"id": 3,"name": "Daily Standup","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/og-images/fVsLWBn1NrOwEwhr.jpeg"},{"id": 4,"name": "Company X","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/qTodSPDtNWzq/logo-1635785199308.png"}, {"id": 5,"name": "Daily Standup","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/og-images/fVsLWBn1NrOwEwhr.jpeg"},{"id": 6,"name": "Company X","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/qTodSPDtNWzq/logo-1635785199308.png"}, {"id": 7,"name": "Daily Standup","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/og-images/fVsLWBn1NrOwEwhr.jpeg"},{"id": 8,"name": "Company X","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspac/qTodSPDtNWzq/logo-1635785199308.png"}, {"id": 9,"name": "Daily Standup","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/og-images/fVsLWBn1NrOwEwhr.jpeg"},{"id": 10,"name": "Company X Teranium Plates Executives Mining Exhilarate Profusely at the edge of the world","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/qTodSPDtNWzq/logo-1635785199308.png"}, {"id": 11,"name": "Daily Standup","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/og-images/fVsLWBn1NrOwEwhr.jpeg"},{"id": 12,"name": "Company X","image_url": "https://pxmessages.s3.us-east-2.amazonaws.com/workspace/qTodSPDtNWzq/logo-1635785199308.png"}]}';

    // var workspaceData = jsonDecode(data);
    // return workspaceData["workspaces"];
  }
}
