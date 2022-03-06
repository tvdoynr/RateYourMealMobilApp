import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/start_screen.dart';


class StartScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children:<Widget> [
                Text('Düzenlenecek Bölge'
                ),

                SizedBox(height: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget> [
                    FlatButton(
                      onPressed: () {},
                      child: Text('Hadi Başlayalım', style: TextStyle( fontSize: 18, color: Colors.white)
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
  }
}