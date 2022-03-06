import 'package:flutter/material.dart';
import 'dart:async';


void main(){
  runApp(MyApp(),);
}


//void main() => runApp(MyApp());

class MyApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slide Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: StartScreen(),
    );
    throw UnimplementedError();
  }
}

/*
class MyApplication extends StatelessWidget{
  const MyApplication({Key? key}) : super(key: key);

  Widget build(BuildContext context){
    return Column(
      children: <Widget>[

      ],
    );
  }
}
*/

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}


class _StartScreenState extends State<StartScreen> {
  int _currentPage = 0;

  final PageController _pageController = PageController(
      initialPage: 0
  );

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Expanded(
            child: Column(
              children:<Widget> [
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,

                    children: <Widget> [
                      PageView.builder(
                        itemBuilder: (ctx, i) => SlideItem(i),
                        itemCount: slideList.length,
                        scrollDirection: Axis.vertical,
                        controller: _pageController,
                        onPageChanged: _onPageChanged,

                      ),
                      Stack(
                        children: <Widget> [
                          Container(
                            margin: const EdgeInsets.only(bottom: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget> [
                                for (int i = 0 ; i < slideList.length; i++)
                                  if (i == _currentPage)
                                    SlideDots(true)
                                  else
                                    SlideDots(false)

                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),




                SizedBox(height: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget> [
                    FlatButton(
                      onPressed: () {},
                      child: Text('zaa', style: TextStyle( fontSize: 18, color: Colors.white)
                        ,),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.all(15),

                    )
                  ],
                ),
              ],
            ),
          ),
        )

    );

    throw UnimplementedError();
  }
}


class SlideDots extends StatelessWidget{
  bool isActive;
  SlideDots(this.isActive);

  Widget build(BuildContext context){
    return AnimatedContainer(
      duration: Duration(
          milliseconds:  150),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: isActive ? 12:8,
      width: isActive ? 12:8,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}

class SlideItem extends StatelessWidget{

  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.limeAccent,
          leading: BackButton(
            color: Colors.pinkAccent,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: (){

              },
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.blueGrey,
              ),
              onPressed: (){

              },
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            width: 800,
            height: 400,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage( slideList[index].imageUrl ),
              fit: BoxFit.cover),
              borderRadius: BorderRadiusDirectional.circular(16.0),
              color: Colors.limeAccent,
            ),
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(26.0),
            //child: Image.asset('images/bbm201_important_for_final.png'),
          ),
        ),
      ),
    );
  }
}

class Slide{
  String imageUrl;
  String title;
  String description;

  Slide(
  {
    required this.imageUrl,
    required this.title,
    required this.description
}
      );
}

final slideList = [
  Slide(
      imageUrl: 'images/apple.png',
      title: 'lorem',
      description: 'lorem ipsum'),
  Slide(imageUrl: 'images/orange.png', title: 'ipsum', description: 'kdsflsdf')


];


/*
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffe00909),
        appBar: AppBar(
          leading: BackButton(
              color: Colors.pinkAccent
          ),

          title: Text("lorem ipsum"),
          centerTitle: true,
        ),
        body: Center(
          child: Image.asset('images/bbm201_important_for_final.png'),
        ),
      ),
    ),
  );
}
*/










/*
void main(){
  runApp(MyApplication(),
  );
}


class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: SafeArea(
          child: Container(
            width: 200,
            height: 100,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.yellow,
            ),
            padding: EdgeInsets.all(26.0),
            margin: EdgeInsets.all(16.0),
            //color: Colors.white,
            child: Transform(
              child: Text(
                'ZaAzZA'
              ),
              transform: Matrix4.rotationZ(-0.2),
              alignment: FractionalOffset.center,
            ),
          ),
        ),
      ),
    );
  }
}
*/





/*

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffd8e0ff),
        appBar: AppBar(
          title: Center(child: Text('My Favourite Picture')),
          backgroundColor: Colors.blueGrey[700],
        ),
        body: Center(
          child: Image.asset('images/bbm201_important_for_final.png'),
        ),
      ),
    ),
  );
}
*/
/*

void main() {
  runApp(const MyApp());
}

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xffe55f48, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffce5641 ),//10%
      100: const Color(0xffb74c3a),//20%
      200: const Color(0xffa04332),//30%
      300: const Color(0xff89392b),//40%
      400: const Color(0xff733024),//50%
      500: const Color(0xff5c261d),//60%
      600: const Color(0xff451c16),//70%
      700: const Color(0xff2e130e),//80%
      800: const Color(0xff170907),//90%
      900: const Color(0xff000000),//100%
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Palette.kToDark
        //primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ahmete tokat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Butona her basis ahmete $_counter tokat',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.thumb_up),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
