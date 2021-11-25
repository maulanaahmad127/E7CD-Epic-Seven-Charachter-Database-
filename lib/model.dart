import 'package:flutter/widgets.dart';

class UserList{
  final String id;
  final String name;
  final String attribute;
  final String role;
  final int rarity;
  final Assets assets;
  
  UserList({
    required this.id,
    required this.name,
    required this.attribute,
    required this.role,
    required this.rarity,
    required this.assets

  });

 


  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      id: json['id'],
      name: json['name'],
      attribute: json['attribute'],
      role: json['role'],
      rarity: json['rarity'],
      assets: Assets.fromJson(json['assets'])
    );
  
}

}

class Assets{
  final String icon;
  final String image;
  final String thumbnail;

  Assets({
    required this.icon,
    required this.image,
    required this.thumbnail,
  });

factory Assets.fromJson(Map<String, dynamic> json) {
    return Assets(
      icon: json['icon'] ,
      image: json['image'],
      thumbnail: json['thumbnail']
    );
  
}

}

class UserDetail{
  final String id;
  final String name;
  final String attribute;
  final String role;
  final int rarity;
  final String zodiac;
  final String description;
  final String story;
  final List<Skills> skills;
  
  
  

  UserDetail({
    required this.id,
    required this.name,
    required this.attribute,
    required this.role,
    required this.description,
    required this.rarity,
    required this.zodiac,
    required this.story,
    required this.skills
    

  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      id: json['id'],
      name: json['name'],
      attribute: json['attribute'],
      role: json['role'],
      description: json['description'],
      rarity: json['rarity'],
      story: json['story'],
      zodiac: json['zodiac'],
      skills: (json['skills'] as List).map((e) => Skills.fromJson(e)).toList()
      
      );
      
   
  
}


}

class Skills{
  final String name;
  final String description;
  final AssetsSkills assets;

  Skills({
    required this.name,
    required this.description,
    required this.assets
  });

factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      name: json['name'] ,
      description: json['description'],
      assets: AssetsSkills.fromJson(json['assets'])
    );
  
}

}

class AssetsSkills{
  final String icon;
  AssetsSkills({
    required this.icon,
  });
  factory AssetsSkills.fromJson(Map<String, dynamic> json) {
    return AssetsSkills(
      icon: json['icon']
    );
  
}
}

