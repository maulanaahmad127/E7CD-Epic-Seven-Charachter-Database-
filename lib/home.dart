import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/model.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

import 'detail.dart';
import 'fetch_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<UserList>> shows;
  late Future<List<UserList>> shows2;
  late Future<List<UserList>> shows3;
  late Future<List<UserList>> shows4;
  late Future<List<UserList>> shows5;

  

   @override
  void initState() {
    super.initState();
    shows = fetchShows("ice",);
    shows2 = fetchShows("fire");
    shows3 = fetchShows("wind");
    shows4 = fetchShows("light");
    shows5 = fetchShows("dark");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: new AppBar(
        centerTitle: true,
        title: Text("E7CD" , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),
        backgroundColor : Colors.black
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(
            child: Expanded(
              child: ListView(
                children: [
                  Padding(padding: EdgeInsets.all(10),
                        child: Text("List Ice Heroes" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),),
                    Container(
            height: 200,
            
              child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<UserList>> snapshot2) {
            if (snapshot2.hasData) {
              return Container(
                child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => SizedBox(width: 12),
                  itemCount: snapshot2.data!.length,
                  
                  itemBuilder: (BuildContext context, int index) => _display(context, index, snapshot2)
                ),
              );
            } else if (snapshot2.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          },
          future: shows
        ),
            ),
            Padding(padding: EdgeInsets.all(10),
                        child: Text("List Fire Heroes" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),),
                    Container(
            height: 200,
            
              child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<UserList>> snapshot2) {
            if (snapshot2.hasData) {
              return Container(
                child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => SizedBox(width: 12),
                  itemCount: snapshot2.data!.length,
                  
                  itemBuilder: (BuildContext context, int index) => _display(context, index, snapshot2)
                ),
              );
            } else if (snapshot2.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          },
          future: shows2
        ),
            ),
            Padding(padding: EdgeInsets.all(10),
                        child: Text("List Wind Heroes" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),),
                    Container(
            height: 200,
            
              child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<UserList>> snapshot2) {
            if (snapshot2.hasData) {
              return Container(
                child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => SizedBox(width: 12),
                  itemCount: snapshot2.data!.length,
                  
                  itemBuilder: (BuildContext context, int index) => _display(context, index, snapshot2)
                ),
              );
            } else if (snapshot2.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          },
          future: shows3
        ),
            ),
            Padding(padding: EdgeInsets.all(10),
                        child: Text("List Light Heroes" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),),
                    Container(
            height: 200,
            
              child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<UserList>> snapshot2) {
            if (snapshot2.hasData) {
              return Container(
                child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => SizedBox(width: 12),
                  itemCount: snapshot2.data!.length,
                  
                  itemBuilder: (BuildContext context, int index) => _display(context, index, snapshot2)
                ),
              );
            } else if (snapshot2.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          },
          future: shows4
        ),
            ),
            Padding(padding: EdgeInsets.all(10),
                        child: Text("List Dark Heroes" , style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),),
                    Container(
            height: 200,
            
              child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<UserList>> snapshot2) {
            if (snapshot2.hasData) {
              return Container(
                child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, _) => SizedBox(width: 12),
                  itemCount: snapshot2.data!.length,
                  
                  itemBuilder: (BuildContext context, int index) => _display(context, index, snapshot2)
                ),
              );
            } else if (snapshot2.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          },
          future: shows5
        ),
            ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
  
}

String UrlAttributeImage(String attribute){
  switch (attribute) {
  case 'ice':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Ice.png";
  case 'fire':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Fire.png";
  case 'wind':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Earth.png";
  case 'dark':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Dark.png";
  case 'light':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Light.png";
  default:
     return "";
}
}

MaterialColor ColorBackgroundDetail(String attribute){
  switch (attribute) {
  case 'ice':
    return Colors.blue;
  case 'fire':
    return Colors.red;
  case 'wind':
    return Colors.green;
  case 'dark':
    return Colors.purple;
  case 'light':
    return Colors.yellow;
  default:
     return Colors.yellow;
}
}

String UrlRoleImage(String role){
  switch (role) {
  case 'ranger':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Ranger.png";
  case 'warrior':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Warrior.png";
  case 'assassin':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Thief.png";
  case 'knight':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Knight.png";
  case 'mage':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Mage.png";
  case 'manauser':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Soul%20Weaver.png";
  default:
     return "";
}
}

String UrlZodiacImage(String zodiac){
  switch (zodiac) {
  case 'waterbearer':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Aquarius.png";
  case 'ram':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Aries.png";
  case 'crab':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Cancer.png";
  case 'goat':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Capricorn.png";
  case 'twins':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Gemini.png";
  case 'lion':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Leo.png";
    case 'scales':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Libra.png";
    case 'fish':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Pisces.png";
    case 'archer':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Sagittarius.png";
    case 'scorpion':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Scorpio.png";
    case 'bull':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Taurus.png";
    case 'maiden':
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/Virgo.png";
  default:
     return "";
}
}

String UrlRarityImage(int rarity){
  switch (rarity) {
  case 5:
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/5-star.png";
  case 4:
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/4-star.png";
  case 3:
    return "https://epic7x.com/wp-content/themes/epic7x/assets/img/3-star.png";
  default:
     return "";
}
}


Widget _display(BuildContext context, int index,AsyncSnapshot<List<UserList>> snapshot2 ) {
  String attribute = snapshot2.data![index].attribute;
  String role = snapshot2.data![index].role;
  int rarity = snapshot2.data![index].rarity;

    return InkWell(
      onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  item: snapshot2.data![index].id,
                                  title: snapshot2.data![index].name,
                                  image: snapshot2.data![index].assets.image,
                                  
                                  ),
                                  
                            ),
                          );
                        },
      child: Container(
        width: 150,
                    padding: EdgeInsets.all(10),
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: <Widget> [
                              AspectRatio(
                            aspectRatio: 4/3,
                            child: CircleAvatar(
                              
                              radius: 100,
                              backgroundColor: Colors.black.withOpacity(0.7),
                              
                                  child:ClipOval(
                                    
                                      child: CachedNetworkImage(
                                      imageUrl: snapshot2.data![index].assets.icon,
                                      progressIndicatorBuilder: (context, url, downloadProgress) => 
                                              CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) => Icon(Icons.error_outline_sharp),
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                    ),
                             
                              )
                              
                            )
                            
                            ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      padding: EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        borderRadius:BorderRadius.circular(100)
                                      ),
                                      child: Image.network(UrlRoleImage(role), scale: 4/3,)
                                    ),
                                    )
                            ],
                          ),
                          
                        ),
                        
                        Text(snapshot2.data![index].name, 
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")),
                        SizedBox(height: 5,),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Image.network(UrlAttributeImage(attribute), scale: 6/5,),
                            Image.network(UrlRarityImage(rarity))
                          ],
                        )
                      ],
                    ),
      )
                    
                  );
  }

