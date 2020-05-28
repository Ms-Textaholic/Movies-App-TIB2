//MovieListPage => ListPage

import 'package:flutter/material.dart';
import 'package:movies_app/view%20models/movie_list_view_model.dart';
import 'package:movies_app/widgets/movie_list.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override 
  _MovieListPageState createState() => _MovieListPageState(); 
}

class _MovieListPageState extends State<MovieListPage> {

  final TextEditingController _controller = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    // you can uncomment this to get all batman movies when the page is loaded
    //Provider.of<MovieListViewModel>(context, listen: false).fetchMovies("batman");
  }

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<MovieListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.purple,
        ),
        title: Text(
          'The Idiot Box',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                if(value.isNotEmpty) {
                  vm.fetchMovies(value);
                  _controller.clear();
                }
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none
              ),

            ),
          ),
          Expanded(
            child: MovieList(movies: vm.movies))
        ])
      )
   
    );
  }
}