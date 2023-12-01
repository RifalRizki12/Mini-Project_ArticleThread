import 'dart:convert';
import 'package:mini_project/provider/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../session.dart';

class ThreadProvider extends ChangeNotifier {
  Future<dynamic> getlistthreads(
      int page, String filterBy, String keyword) async {
    try {
      final url =
          Uri.parse('${Config.endPoint}/web-forum-service/threads/list');
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                "Bearer ${await Session.get(Session.tokenSessionKey)}"
          },
          body: jsonEncode({
            'page': page,
            'filterBy': filterBy,
            'keyword': keyword,
          }));

      final result = json.decode(response.body);

      if (response.statusCode == 200) {
        return result;
      } else {
        return result;
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
      return null; // Mengembalikan null jika terjadi kesalahan
    }
  }

  Future<dynamic> createthread(String title, String content) async {
    try {
      final url =
          Uri.parse('${Config.endPoint}/web-forum-service/threads/create');
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                "Bearer ${await Session.get(Session.tokenSessionKey)}"
          },
          body: jsonEncode({
            'title': title,
            'content': content,
          }));

      print('${url} ${response.body}');

      final result = json.decode(response.body);

      if (response.statusCode == 200) {
        return result;
      } else {
        print(result);
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
      return null; // Mengembalikan null jika terjadi kesalahan
    }
  }

  Future<dynamic> getthreaddetail(String id) async {
    try {
      final url =
          Uri.parse('${Config.endPoint}/web-forum-service/threads?id=$id');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              "Bearer ${await Session.get(Session.tokenSessionKey)}"
        },
      );

      final result = json.decode(response.body);

      if (response.statusCode == 200) {
        return result;
      } else {
        return result;
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
      return null; // Mengembalikan null jika terjadi kesalahan
    }
  }

  Future<dynamic> createpost(String idThreads, String content) async {
    try {
      final url =
          Uri.parse('${Config.endPoint}/web-forum-service/threads/comment');
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                "Bearer ${await Session.get(Session.tokenSessionKey)}"
          },
          body: jsonEncode({
            'idThreads': idThreads,
            'content': content,
          }));

      print('${url} ${response.body}');

      final result = json.decode(response.body);

      if (response.statusCode == 200) {
        return result;
      } else {
        print(result);
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
      return null; // Mengembalikan null jika terjadi kesalahan
    }
  }

  Future<dynamic> getlistpost(String threadsId, int page) async {
    try {
      final url = Uri.parse(
          '${Config.endPoint}/web-forum-service/threads/comment?threadsId=$threadsId&page=$page');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              "Bearer ${await Session.get(Session.tokenSessionKey)}"
        },
      );
      final result = json.decode(response.body);

      if (response.statusCode == 200) {
        return result;
      } else {
        return result;
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
      return null; // Mengembalikan null jika terjadi kesalahan
    }
  }
}
