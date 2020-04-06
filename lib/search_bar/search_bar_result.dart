import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'search_bar_data.dart';

class SearchBarResult extends SearchDelegate {

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          //showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    if (query.length == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Center(child: Text("ENTER SOMETHING"))
        ],
      );
    }

    return FutureBuilder<Post>(
      future: fetchPost(query),
      builder: (context,snapshot){
        if(snapshot.hasData)
          return Stack(
            children: <Widget>[
              Container(

                child: Image(
                  image: NetworkImage(snapshot.data.Poster),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
              ),


              BackdropFilter(
                filter: prefix0.ImageFilter.blur(
                    sigmaY: 30,
                    sigmaX: 30
                ),
                child: Container(color: Colors.black45.withOpacity(0),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: 300,

                  child: Center(
                    child: FadeInImage.assetNetwork(
                      fadeInCurve: Curves.easeIn,
                        placeholder: 'assest/loading.gif',
                        fadeInDuration: Duration(seconds: 4),
                        image: snapshot.data.Poster,
                        fit: BoxFit.fill,
                      height: 300,
                      width: MediaQuery.of(context).size.width-40,


                    ),
                  ),
                ),
              ),
             Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width-60,

                  height: MediaQuery.of(context).size.height-420,
                  decoration: BoxDecoration(

                    gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black87,
                      Colors.grey.shade700
                    ]
                    ),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
                    boxShadow: [BoxShadow(
                      color: Colors.grey,


                    )]
                  ),
                  child: ListView(
                    children: <Widget>[
                      Text(snapshot.data.Title,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(snapshot.data.Runtime,style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
                              Text('Duration',style: TextStyle(color: Colors.yellowAccent,fontSize: 9)),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(snapshot.data.Released,style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
                              Text('Released',style: TextStyle(color: Colors.yellowAccent,fontSize: 9)),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(snapshot.data.imdbRating,style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
                              Text('Rating',style: TextStyle(color: Colors.yellowAccent,fontSize: 9)),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(snapshot.data.Type,style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold)),
                              Text('Type',style: TextStyle(color: Colors.yellowAccent,fontSize: 9)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 7,),
                      Text("Genere : "+ snapshot.data.Genre ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                      SizedBox(height: 7,),

                      Text("Language : "+ snapshot.data.Language ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                      SizedBox(height: 7,),
                      Text("Director : "+ snapshot.data.Director ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                      SizedBox(height: 7,),
                      Text("Writer : "+ snapshot.data.Writer ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                      SizedBox(height: 7,),
                      Text("Actors : "+ snapshot.data.Actors ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                      SizedBox(height: 7,),
                      Text("Plot : "+ snapshot.data.Plot ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),


                    ],
                  ),

                ),
              ),
            ],
          );
        else if(snapshot.hasError)
          return Text("error");
        return Center(child: CircularProgressIndicator());

      },

    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
  }
}



