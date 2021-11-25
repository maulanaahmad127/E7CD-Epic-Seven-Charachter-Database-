import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

Future<List<UserList>> fetchShows(String attribute) async {
  final response =
      await http.get(Uri.parse('https://api.epicsevendb.com/hero'));

  if (response.statusCode == 200) {
    return filter(response, attribute);
  } else {
    throw Exception('Failed to load shows');
  }
}

Future<List<UserList>> fetchShows2(String attribute, String rarityLower, String attributeFilter, String roleFilter) async {
  final response =
      await http.get(Uri.parse('https://api.epicsevendb.com/hero'));

  if (response.statusCode == 200) {
    return filterName(response, attribute , rarityLower, attributeFilter, roleFilter);
  } else {
    throw Exception('Failed to load shows');
  }
}

Future<List<UserDetail>> fetchDetailCharacter(id) async {
  final response = await http
      .get(Uri.parse('https://api.epicsevendb.com/hero/$id'));

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["results"];
    return data.map((show) => UserDetail.fromJson(show)).toList();
  } else {
    throw Exception('Failed to load episodes');
  }
}

List<UserList> filter(var response, String attribute){
   Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["results"];
    return data.map((show) => UserList.fromJson(show)).where((user) {
        final attributeLower = user.attribute.toLowerCase();
        

        return attributeLower.contains(attribute);
      }).toList();
}

List<UserList> filterName(var response, String query, String rarityFilter, String attributeFilter, String roleFilter){
   Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["results"];
    return data.map((show) => UserList.fromJson(show)).where((user) {
        final searchQuery = query.toLowerCase();
        final nameLower = user.name.toLowerCase();
        final rarityLower = user.rarity.toString().toLowerCase();
        final attributeLower = user.attribute.toLowerCase();
        final roleLower = user.role.toLowerCase();

        return nameLower.contains(searchQuery) && rarityLower.contains(rarityFilter) && attributeLower.contains(attributeFilter) && roleLower.contains(roleFilter);
      }).toList();
}
