import 'package:flutter/material.dart';
import 'package:tugas_akhir/search.dart';

class FilterPage extends StatefulWidget {
  
  const FilterPage({ Key? key  }) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
     String? rarity;
     String? attribute;
     String? role;
     late Map<String, String> myMap;
  
  void initState() {
    super.initState();
     
     
    rarity = "";
    attribute = "";
    role = "";

    myMap = {
      "rarity" : this.rarity.toString(),
      "attribute" : this.attribute.toString(),
      "role" : this.role.toString()

    };
    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
     child: new Scaffold(
       backgroundColor: Colors.black,
      appBar: new AppBar(
        title: Text("Filter"),
        leading: IconButton(
          onPressed: () {
                          Navigator.pop(
                            context, myMap
                          );
                        },
          icon: Icon(Icons.close),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget> [
          SizedBox(height: 10),
          
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              
              Text("Rarity :", style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                child: Theme(
                data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
            backgroundColor: Colors.blue,
            selectedRowColor: Colors.blue,
          ),
          child: DropdownButton<dynamic>(
        
        hint: Text("Pick", ),
        value: rarity,
        style: TextStyle(),
        items: <String?>["3", "4", "5",  ""].map((String? value) {
          return new DropdownMenuItem<String?>(
            
            value: value,
            child: Text(value ?? ""),
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            
            this.rarity = newVal;
            myMap["rarity"] = this.rarity.toString();
          });
          
        }
        
        ),
                )
              
              )
            ],

          ),
            SizedBox(height: 10),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Text("Attribute :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")),

              Container(
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                child: Theme(
                data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
            backgroundColor: Colors.blue,
            selectedRowColor: Colors.blue,
          ),
                child: DropdownButton<dynamic>(
                
                
                
        hint: Text("Pick"),
        style: TextStyle(),
        value: attribute,
        items: <String?>["fire", "ice", "wind", "dark", "light",  ""].map((String? value) {
          return new DropdownMenuItem<String?>(
            value: value,
            child: Text(value ?? ""),
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            
            this.attribute = newVal;
            myMap["attribute"] = this.attribute.toString();
            
          });
            
        }
        
        )
                ),
              ),

              
              
        
            ],

          ),
          SizedBox(height: 10),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Text("role :", 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,fontFamily: "Montserrat-Regular")),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
            backgroundColor: Colors.blue,
            selectedRowColor: Colors.blue,
          ),
                 child: DropdownButton<dynamic>(
        hint: Text("Pick"),
        value: role,
        style: TextStyle(),
        items: <String?>["warrior", "knight", "assassin", "ranger", "mage", "manauser" , ""].map((String? value) {
          return new DropdownMenuItem<String?>(
            value: value,
            child: Text(value ?? ""),
          
          );
        }).toList(),
        onChanged: (newVal) {
          setState(() {
            
            this.role = newVal;
            myMap["role"] = this.role.toString();
          });
          
        }
        
        )),
              )
              
        
            ],

          ),
          
        ],
      ),
    )
    );
    
    
  }
  
  
}





