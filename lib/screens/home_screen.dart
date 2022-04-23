
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_your_meal/screens/second_screen.dart';

class RYM extends StatelessWidget {
  const RYM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rate Your Meal",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Comfortaa',
      ),
      home: const HomePage(
          title: Text(
            'Rate Your Meal',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 29.0,
            ),
          )),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final Text title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: widget.title,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return MyApp();
                  }));
                }, icon:Image.asset('assets/images/atatepe.jpg')),
                Container(width: 200,
                height: 200,
                color: Colors.red,
                ),
                SizedBox(width: 12,),
                IconButton(onPressed: (){
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation,_){
                        return MyApp();
                      }));
                }, icon: Image.asset('assets/images/atatepe.jpg')),
                /*GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return MyApp();
                  }));
                },
                ),*/
                Container(width: 200,
                  height: 200,
                  color: Colors.red,
                ),
                SizedBox(width: 12,),
                Container(width: 200,
                  height: 200,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Padding(
                      child: Image.asset('assets/images/atatepe.jpg'),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    decoration: BoxDecoration(border: Border.all()),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      child: Image.asset('assets/images/parlar.jpg'),
                      padding: const EdgeInsets.all(10.0),
                    ),
                    decoration: BoxDecoration(border: Border.all()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Anasayfa"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profil"),
          ),
        ],
      ),
    );
  }
}