import 'package:flutter/material.dart';
import 'package:flutter_demo/app/Container/HomeScreen.dart';


class  MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.black,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child:Container(
                    // width: 100,
                    height: 80,
                    margin: EdgeInsets.only(
                        top:20,
                        bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png'
                        )
                      )
                    ),
                  ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child:  Text(
                      'Flutter UI',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child:  Text(
                      'Developed By : Be Passionate',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child:  Text(
                      'Version 1.0.0',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                ],
              ),
            ),
          // ListTile(
          //   title: Text('Privacy Policy'),
          //   onTap: (){
          //     Navigator.push(context, new MaterialPageRoute(
          //         builder: (context) => PrivacyPolicyScreen()
          //     ));
          //   },
          // ),
          ListTile(
            title: Text('Rate and Review'),
            onTap: (){
              // Navigator.push(context, new MaterialPageRoute(
              //     builder: (context) => ContactScreen()
              // ));
            },
          ),
          // ListTile(
          //   title: Text('Version 1.0.0'),
          //   onTap: (){
          //     // Navigator.push(context, new MaterialPageRoute(
          //     //     builder: (context) => ContactScreen()
          //     // ));
          //   },
          // ),
        ],
      )
    );
}
}