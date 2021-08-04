

import 'package:flutter/material.dart';
import 'package:login/services/auth.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'movies.dart';
import 'secondScreen.dart';


class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final AuthService _auth= AuthService();
  bool _isLoading=true;
  final List<Movie> _movies= <Movie> [];
  void initState() {
    super.initState();
    _getMovies();
  }
  Future <void> _getMovies() async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'yts.mx',
      pathSegments: <String>['api', 'v2', 'list_movies.json'],
    );
    final Response response = await get(url);
    final Map<String, dynamic> body = jsonDecode(response.body) as Map<
        String,
        dynamic>;
    final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
    final List<dynamic> movies = data['movies'] as List<dynamic>;

    setState(() {
      for (int i = 0; i < movies.length; i++) {
        final Map <String, dynamic> movie = movies[i] as Map<String, dynamic>;
        _movies.add(Movie(movie));
      }
      _isLoading = false;
    });
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Cinema box'),
        centerTitle: false,
        actions: <Widget> [
          TextButton.icon(
              onPressed: () async{
                await _auth.signOut();

              },
              icon: Icon(Icons.person, color: Colors.black),
              label: Text(
                  "Sign out",
                style: TextStyle(
                    color: Colors.black
                ),))
        ],
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.69,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,

        ),

        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index){

          final Movie movie = _movies[index];
          return GestureDetector(
            onTap: () {
              Navigator.push
                (context, MaterialPageRoute(
                builder: (context) => SecondScreen(
                  movie:movie,
                ),
              ));
            },
            child: new GridTile(
              child: Image.network(
                movie.image,
                fit:BoxFit.cover,
              ),
              footer:GridTileBar(
                backgroundColor:Colors.black38,

                title:Text(movie.title),
                subtitle:Text(movie.summary),
              ),

            ),
          );
        },
      ),


    );

  }
  }
