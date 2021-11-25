import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/home.dart';
import 'package:tugas_akhir/model.dart';
import 'package:http/http.dart' as http;

import 'fetch_api.dart';

class DetailPage extends StatefulWidget {
  final String item;
  final String title;
  final String image;
  const DetailPage({Key? key, required this.item, required this.title, required this.image})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<List<UserDetail>> characterDetail;

  @override
  void initState() {
    super.initState();
    characterDetail = fetchDetailCharacter(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(widget.title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")
      ),
      backgroundColor: Colors.black,),
      body: Column(
          children: <Widget> [
            Container(
            
              child: FutureBuilder(
              builder: (context, AsyncSnapshot<List<UserDetail>> snapshot2) {
            if (snapshot2.hasData) {
              return Expanded(
                child: ListView.builder(
                  
                  itemCount: snapshot2.data!.length,
                  itemBuilder: (BuildContext context, int index) => 
                  Column(
                    children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: 400,
                                      height: 300,
                                      decoration: BoxDecoration(
                                      color: ColorBackgroundDetail(snapshot2.data![index].attribute),
                                
                                      border: Border.all(
                                      color: Colors.black,
                                      width: 5,
                                        ),
                                      ),
                                      child: CachedNetworkImage(
                                        
                                      imageUrl: widget.image,
                                      progressIndicatorBuilder: (context, url, downloadProgress) => 
                                              CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) => Icon(Icons.error_outline_sharp),
                                      fit: BoxFit.fill,
                                      
                                    ),
                                    ),
                                    ),
                  SizedBox(height: 10,),
                  Text("Name : "+snapshot2.data![index].name, 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular"),
                  ),
                  SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(10)),
                            Text("Attribute : " ,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),
                            Image.network(UrlAttributeImage(snapshot2.data![index].attribute), 
                            scale: 3/2,
                            ),
                            Text(" ("+snapshot2.data![index].attribute + ")", 
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(4)),
                            Text("Role : " ,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),
                            Image.network(UrlRoleImage(snapshot2.data![index].role), 
                            scale: 3/2,
                            ),
                            Text(" ("+snapshot2.data![index].role+")",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")
                            ),
                            
                          ],
                        ),
                        
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Text("Rarity : " ,
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")
                                ),
                                Image.network(UrlRarityImage(snapshot2.data![index].rarity), 
                                scale: 3/2,
                                ),
                                Text(" ("+snapshot2.data![index].rarity.toString()+")",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")
                                ),
                                
                              ],
                            ),
                            Row(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Text("Zodiac : ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),
                                Image.network(UrlZodiacImage(snapshot2.data![index].zodiac), 
                                scale: 3/2,
                                ),
                                Text(snapshot2.data![index].zodiac, 
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular"))
                                
                                
                              ],
                            ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(10),
                        child: Text("Description & Story" , style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),),

                    Container(
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(
                          width: 3,
                          color: Colors.grey,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Column(
                      children: [
                        Padding(padding: EdgeInsets.all(20),
                        child: Text("Description : "+snapshot2.data![index].description,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")),),
                        Padding(padding: EdgeInsets.all(20),
                        child: Text("Story : "+snapshot2.data![index].story,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")),),
                        
                      ],
                    ),
                    ),
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.all(10),
                        child: Text("Skills",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")
                        ),
                        ),
                    Container(
                      
                      width: 400,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                            leading: CachedNetworkImage(
                              imageUrl: snapshot2.data![index].skills[0].assets.icon,
                               progressIndicatorBuilder: (context, url, downloadProgress) => 
                                              CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) => Icon(Icons.error_outline_sharp),
                                      fit: BoxFit.fill,
                              ),
                            title: Text(snapshot2.data![index].skills[0].name,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")
                            ),
                            subtitle: Text(snapshot2.data![index].skills[0].description,
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey,fontFamily: "Montserrat-Regular")
                          )
                          ),
                          SizedBox(height: 20,),
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                            leading: CachedNetworkImage(
                              imageUrl: snapshot2.data![index].skills[1].assets.icon,
                               progressIndicatorBuilder: (context, url, downloadProgress) => 
                                              CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) => Icon(Icons.error_outline_sharp),
                                      fit: BoxFit.fill,
                              ),
                            title: Text(snapshot2.data![index].skills[1].name,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")
                            ),
                            subtitle: Text(snapshot2.data![index].skills[1].description,
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey,fontFamily: "Montserrat-Regular")
                          )
                          ),
                          SizedBox(height: 20,),
                          ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                            leading: CachedNetworkImage(
                              imageUrl: snapshot2.data![index].skills[2].assets.icon,
                               progressIndicatorBuilder: (context, url, downloadProgress) => 
                                              CircularProgressIndicator(value: downloadProgress.progress),
                                      errorWidget: (context, url, error) => Icon(Icons.error_outline_sharp),
                                      fit: BoxFit.fill,
                              ),
                            title: Text(snapshot2.data![index].skills[2].name,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")
                            ),
                            subtitle: Text(snapshot2.data![index].skills[2].description,
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey,fontFamily: "Montserrat-Regular")
                          )
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        border: Border.all(
                          width: 3,
                          color: Colors.grey,
                          style: BorderStyle.solid,
                        ),
                      ),
                    )
                  ],
                  )
                ),
              );
            } else if (snapshot2.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          },
          future: characterDetail
        ),
            ),
          ],
      ),
    );
  }
}

