import 'package:flutter/material.dart';
import 'dart:async';

import 'package:rate_your_meal/screens/home_screen.dart';

/*
void main(){
  runApp(MyApp(),);
}
*/

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
                      onPressed: () {
                        setState(() {
                          if(_currentPage < 1){
                            _currentPage++;
                          }
                          else{
                            _currentPage = 0;
                          }
                          _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                        });
                      },
                      child: Text('', style: TextStyle( fontSize: 18, color: Colors.white)
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
      margin: const EdgeInsets.symmetric(horizontal: 5),
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
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return RYM();
              }));
            },
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
      imageUrl: 'assets/images/apple.png',
      title: 'lorem',
      description: 'lorem ipsum'),
  Slide(
      imageUrl: 'assets/images/orange.png',
      title: 'ipsum',
      description: 'kdsflsdf')


];



