import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Uri _buildUri({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    String? overrideBaseUrl,
  }) {
    final uri = Uri.parse("$overrideBaseUrl$endpoint");
    debugPrint("API URL: $uri");
    return queryParams != null
        ? uri.replace(queryParameters: queryParams)
        : uri;
  }

  static Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    return {..._defaultHeaders, ...?headers};
  }

  static dynamic _parseResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      final error = _parseError(response.body);
      throw Exception('Error ${response.statusCode}: $error');
    }
  }

  static String _parseError(String body) {
    try {
      final decoded = jsonDecode(body);
      return decoded['message'] ?? decoded['error'] ?? 'Unknown error';
    } catch (_) {
      return body;
    }
  }

  // --------------------
  // BASIC REQUESTS
  // --------------------

  static Future<void> getRequest(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    String? baseUrl,
    int retries = 0,
    Function(dynamic data)? onSuccess,
    Function(String error)? onFail,
  }) async {
    try {
      await _withRetry(
        () async {
          final uri = _buildUri(
            endpoint: endpoint,
            queryParams: queryParams,
            overrideBaseUrl: baseUrl,
          );
          debugPrint("API URL: $uri");
          final res = await http.get(uri, headers: _mergeHeaders(headers));
          debugPrint("API Response: ${res.body}");
          final data = _parseResponse(res);

          await onSuccess?.call(data);
        },
        retries,
        onFail,
      );
    } catch (e) {
      debugPrint("API Error: $e");
      onFail?.call("Unexpected error: $e");
    }
  }

  static Future<void> postRequest(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    String? baseUrl,
    int retries = 0,
    Function(dynamic data)? onSuccess,
    Function(String error)? onFail,
  }) async {
    try {
      await _withRetry(
        () async {
          final uri = _buildUri(
            endpoint: endpoint,
            queryParams: queryParams,
            overrideBaseUrl: baseUrl,
          );
          final res = await http.post(
            uri,
            headers: _mergeHeaders(headers),
            body: jsonEncode(body),
          );
          final data = _parseResponse(res);
          onSuccess?.call(data);
        },
        retries,
        onFail,
      );
    } catch (e) {
      onFail?.call("Unexpected error: $e");
    }
  }

  static Future<void> putRequest(
    String endpoint, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    String? baseUrl,
    int retries = 0,
    Function(dynamic data)? onSuccess,
    Function(String error)? onFail,
  }) async {
    try {
      await _withRetry(
        () async {
          final uri = _buildUri(
            endpoint: endpoint,
            queryParams: queryParams,
            overrideBaseUrl: baseUrl,
          );
          final res = await http.put(
            uri,
            headers: _mergeHeaders(headers),
            body: jsonEncode(body),
          );
          final data = _parseResponse(res);
          onSuccess?.call(data);
        },
        retries,
        onFail,
      );
    } catch (e) {
      onFail?.call("Unexpected error: $e");
    }
  }

  static Future<void> deleteRequest(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    String? baseUrl,
    int retries = 0,
    Function(dynamic data)? onSuccess,
    Function(String error)? onFail,
  }) async {
    try {
      await _withRetry(
        () async {
          final uri = _buildUri(
            endpoint: endpoint,
            queryParams: queryParams,
            overrideBaseUrl: baseUrl,
          );
          final res = await http.delete(uri, headers: _mergeHeaders(headers));
          final data = _parseResponse(res);
          onSuccess?.call(data);
        },
        retries,
        onFail,
      );
    } catch (e) {
      onFail?.call("Unexpected error: $e");
    }
  }

  // --------------------
  // MULTIPART FILE UPLOAD
  // --------------------

  static Future<void> uploadFile(
    String endpoint, {
    required File file,
    String fileField = 'file',
    Map<String, String>? fields,
    Map<String, String>? headers,
    String? baseUrl,
    Function(dynamic data)? onSuccess,
    Function(String error)? onFail,
  }) async {
    try {
      final uri = _buildUri(endpoint: endpoint, overrideBaseUrl: baseUrl);
      final mergedHeaders = _mergeHeaders(headers);
      final request = http.MultipartRequest("POST", uri)
        ..headers.addAll(mergedHeaders)
        ..files.add(await http.MultipartFile.fromPath(fileField, file.path));

      fields?.forEach((key, value) {
        request.fields[key] = value;
      });

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final data = _parseResponse(response);
      onSuccess?.call(data);
    } catch (e) {
      onFail?.call("Upload error: $e");
    }
  }

  static Future<void> uploadFilesHttp({
    required String url,
    required File sourceFile,
    File? targetFile,
    String? targetUrl,
    required Function(Map<String, dynamic>) onSuccess,
    required Function(String) onError,
  }) async {
    try {
      debugPrint('Uploading files to: $url');

      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add files
      request.files.add(
        await http.MultipartFile.fromPath('source', sourceFile.path),
      );
      if (targetFile != null && targetFile.path.isNotEmpty) {
        request.files.add(
          await http.MultipartFile.fromPath('target', targetFile.path),
        );
      } else if (targetUrl != null && targetUrl.isNotEmpty) {
        request.fields['network_url'] = targetUrl;
      }
      debugPrint('Files added to request');
      debugPrint('Source: ${sourceFile.path}');
      debugPrint('Target: ${targetFile?.path}');
      debugPrint('TargetUrl: $targetUrl');

      // Send request
      http.StreamedResponse response = await request.send();

      debugPrint('Response status: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        String responseBody = await response.stream.bytesToString();
        debugPrint('Response body: $responseBody');

        Map<String, dynamic> responseData = json.decode(responseBody);
        await onSuccess({"response": responseData});
      } else {
        String errorBody = await response.stream.bytesToString();
        Map<String, dynamic> errorData = json.decode(errorBody);

        debugPrint('Error response: $errorBody');
        await onError('${errorData['error'] ?? 'Unknown error'}');
      }
    } catch (e) {
      debugPrint('Please Try Again');
      onError('Please Try Again');
    }
  }

  // --------------------
  // RETRY LOGIC + ERROR HANDLING
  // --------------------

  static Future<void> _withRetry(
    Future<void> Function() requestFn,
    int retries,
    Function(String error)? onFail,
  ) async {
    int attempt = 0;
    while (true) {
      try {
        await requestFn();
        return;
      } catch (e) {


        if (attempt >= retries) {
          onFail?.call("Request failed after $retries retries: $e");
          return;
        }
        attempt++;
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }
}