import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  Widget textfield({@required hintText}) {
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
          mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 60)),
          Card(
        child: 
        ListTile(
          tileColor: Colors.black,
          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading:Container(
                  
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.white)),
                  child: Icon(
                    Icons.person_outline_outlined,
                    color: Colors.white,
                  ),
                ),
                
          title: Text('Maulana Ahmad Rodhi Alfian', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")
                    )
          , 
                    ),
      ),
      Card(
        child: 
        ListTile(
          tileColor: Colors.black,
          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading:Container(
                  
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.black)),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.white,
                  ),
                ),
                
          title: Text('maulahmaddd40@gmail.com', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")
                    )
          , 
                    ),
      ),
      Card(
        child: 
        ListTile(
          tileColor: Colors.black,
          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading:Container(
                  
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2, color: Colors.white)),
                  child: Icon(
                    Icons.call_outlined,
                    color: Colors.white,
                  ),
                ),
                
          title: Text('087838325911', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white,fontFamily: "Montserrat-Regular")
                    )
          , 
                    ),
      ),
      
          
        ]
        ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://avatarfiles.alphacoders.com/280/thumb-280960.png"),
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}