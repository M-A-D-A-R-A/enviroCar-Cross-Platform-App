import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../providers/authProvider.dart';
import '../models/userStats.dart';
import '../providers/userStatsProvider.dart';
import '../models/envirocarStats.dart';

class StatsServices {
  final baseUri = 'https://envirocar.org/api/stable';

  // Fetches user stats
  Future<void> getUserStats({
    @required AuthProvider authProvider,
    @required UserStatsProvider userStatsProvider,
  }) async {
    final Uri uri = Uri.parse(baseUri +
        '/users' +
        '/' +
        authProvider.getUser.getUsername +
        '/userStatistic');

    http.Response response = await http.get(
      uri,
      headers: {
        'X-User': authProvider.getUser.getUsername,
        'X-Token': authProvider.getUser.getPassword,
      },
    );

    userStatsProvider.setUserStats =
        UserStats.fromJson(jsonDecode(response.body));
  }

  // Fetches general enviroCar stats
  Future<EnvirocarStats> getEnvirocarStats() async {
    final Uri uri = Uri.parse(baseUri);

    http.Response response = await http.get(
      uri,
    );

    dynamic responseBody = jsonDecode(response.body)['counts'];

    int users = responseBody['users'];
    int tracks = responseBody['tracks'];
    int measurements = responseBody['measurements'];

    return EnvirocarStats(
      users: users,
      tracks: tracks,
      measurements: measurements,
    );
  }
}
