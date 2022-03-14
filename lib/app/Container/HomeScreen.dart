import 'package:flutter/material.dart';
import 'package:flutter_demo/app/navigation/MainDrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imageList = ["https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'];

class HomeScreen extends StatelessWidget {

  // final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: MyStatefulWidget()
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Comming Soon !',
      style: optionStyle,
    ),
    Text(
      'Comming Soon !',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'My Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: Text('Flutter Demo'),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search for something',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.camera_alt)),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.all(15),
            child:new Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Container(
                  margin : EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text('Trading Images',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                        new Text('See all',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue
                            )),
                      ]
                  )
                ),
                new Container(
                    margin : EdgeInsets.only(bottom: 30.0),
                  child: CarouselSlider.builder(
                    itemCount: imageList.length,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: 300,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4),
                      reverse: false,
                      aspectRatio: 5.0,
                    ),
                    itemBuilder: (context, i, id){
                      //for onTap to redirect to another screen
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.white,)
                          ),
                          //ClipRRect for image border radius
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              imageList[i],
                              width: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: (){
                          var url = imageList[i];
                          print(url.toString());
                        },
                      );
                    },
                  ),
                ),
                new Container(
                    margin : EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text('Category',
                              style: TextStyle(
                                fontSize: 20,
                              )),
                          new Text('See all',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blue
                              )),
                        ]
                    )
                ),
                new Container(
                  margin : EdgeInsets.only(bottom: 30.0),
                  child: CarouselSlider.builder(
                    itemCount: imageList.length,
                    options: CarouselOptions(
                      enlargeCenterPage: false,
                      height: 130,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      reverse: false,
                      // aspectRatio: 1.0,
                      viewportFraction: 0.4,
                      initialPage: 0,
                    ),
                    itemBuilder: (context, i, id){
                      //for onTap to redirect to another screen
                      return GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.white,)
                          ),
                          //ClipRRect for image border radius
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              imageList[i],
                              width: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: (){
                          var url = imageList[i];
                          print(url.toString());
                        },
                      );
                    },
                  ),
                ),
                // new Container(
                //     margin : EdgeInsets.only(top: 10.0),
                //     child: new Column(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           new Text('Demo Text',
                //               style: TextStyle(
                //                 fontSize: 20,
                //               )),
                //           new Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                //               style: TextStyle(
                //                   fontSize: 14,
                //                   color: Colors.black
                //               )),
                //         ]
                //     )
                // ),
              ],
            )

              ),
              // Container(
              //   height: 1000,
              //   color: Colors.pink,
              // ),
            ]),
          ),
        ],
      ),
    );
  }
}