
import 'package:flutter/material.dart';
import 'movies.dart';

class SecondScreen extends StatelessWidget
{

  @override
  Movie movie;
  SecondScreen({this.movie});

  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset : false,
      appBar:AppBar(
        title:Text(
            'Cinema box office',
            style: TextStyle(fontSize: 15)),
        centerTitle: true,

      ),
      body:

      Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: 400
                  ),
                  child: Card(
                    elevation: 20,
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)
                    ),
                    child: new Container(
                      color: Colors.green[200],
                      height: 800.0,
                      alignment: Alignment.center,


                      child: new Column(
                        // mainAxisSize: MainAxisSize.min,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Text(
                                movie.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:20,

                                )
                            ),
                          ),
                          new Image.network(
                            movie.image,
                            height:250,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: new Text(
                              movie.summary,

                            ),
                          ),
                        ],


                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),







    );

  }




}