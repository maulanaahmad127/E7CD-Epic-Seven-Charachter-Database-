import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'detail.dart';
import 'fetch_api.dart';
import 'filter.dart';
import 'home.dart';
import 'model.dart';

class SearchPage extends StatefulWidget {
  
  

  const SearchPage({ Key? key, }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<List<UserList>> shows;
  late String EnteredText;
  var _controller = TextEditingController();
 late Map<String, String> myMap;
  
  
  
  @override
  void initState() {
    super.initState();
    EnteredText = "";
    
    myMap = {
      "rarity" : "",
      "attribute" : "",
      "role" : ""

    };
    
    
    shows = fetchShows2(EnteredText, myMap["rarity"].toString(), myMap["attribute"].toString(), myMap["role"].toString());
    
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        title: Text("Search"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Padding(padding: EdgeInsets.all(10), child: Row(
            children: [
              _searchBox(),
              
              _sortButton(),
            ],
          )
          ),
          Expanded(
            
            child: FutureBuilder(
          builder: (context, AsyncSnapshot<List<UserList>> snapshot2) {
            if (snapshot2.hasData) {
              return Center(
                child: ListView.builder(
                  itemCount: snapshot2.data!.length,
                  itemBuilder: (BuildContext context, int index) => _display(context, index, snapshot2)
                ),
              );
            } else if (snapshot2.hasError) {
              return const Center(child: Text('Something went wrong :('));
            }
            return const CircularProgressIndicator();
          },
          future: shows,
        ),
          ),
         
        ],
      ),
    );
  }
  Widget _searchBox(){
    
  
    return Expanded(
      child: 
    TextField(
      controller: _controller,
      onChanged: (newText){
        
        setState(() {
          EnteredText=newText;
          shows = fetchShows2(EnteredText, myMap["rarity"].toString(), myMap["attribute"].toString(), myMap["role"].toString());
        });
       
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
      onPressed: _controller.clear,
      icon: Icon(Icons.clear),
    ),
        hintText: "Search",
        prefixIcon: Icon(Icons.search, size: 30),
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding: EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.grey.shade200
        )
        )
      ),
      
    ));
  }

  Widget _sortButton(){
    return InkWell(
      onTap: () async {
        
                        var data = await  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilterPage(
                                  
                                  
                                  ),
                                  
                            ),
                          );
                          setState(() {
                            myMap["rarity"] = data["rarity"];
                            myMap["attribute"] = data["attribute"];
                            myMap["role"] = data["role"];
                            
                            shows = fetchShows2(EnteredText, myMap["rarity"].toString(), myMap["attribute"].toString(), myMap["role"].toString());
                          });
                          
                        },
     child : Container(
      
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white
        )
      ),
      child: RotatedBox(
        quarterTurns: 45,
        child: Icon(Icons.tune_outlined, color: Colors.white , size: 30,),
        
      ),
    )
    );
    
  }
  
}




Widget _display(BuildContext context, int index,AsyncSnapshot<List<UserList>> snapshot2 ) {
  String attribute = snapshot2.data![index].attribute;
  String role = snapshot2.data![index].role;
  int rarity = snapshot2.data![index].rarity;

  return Card(
    shadowColor: Colors.white,
                      margin: EdgeInsets.all(10),
                      color: Colors.white,
                      child: ListTile(
                        tileColor: Colors.black,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(snapshot2.data![index].assets.icon),
                          onBackgroundImageError: (url, error) => ErrorWidget(Icon(Icons.error_outline_sharp)),
                          child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      
                                      padding: EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        borderRadius:BorderRadius.circular(100),
                                        
                                      ),
                                      child: Image.network(UrlRoleImage(role), scale: 7/3,)
                                    ),
                                    )
                           
                           
                          
                         
                        ),
                        title: Text(snapshot2.data![index].name
                        ,style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),
                        subtitle: Row(
                          
                          children: [
                            
                            Image.network(UrlAttributeImage(attribute), scale: 3/2, ),
                            Image.network(UrlRarityImage(rarity), scale: 3/2,)
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                  item: snapshot2.data![index].id,
                                  title: snapshot2.data![index].name,
                                  image: snapshot2.data![index].assets.image,
                            ),
                          ));
                        }
                      ),
                    );

}


  
  

