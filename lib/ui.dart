import 'package:assignment1/constants.dart' as prefix0;
import 'package:assignment1/search_Bar/search_bar_result.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: prefix0.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: AppBar(
            title: Text(
              "treva",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: "Poppins"),
            ),
            centerTitle: true,
            elevation: 7.0,
            leading: Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    showSearch(context: context, delegate: SearchBarResult());
                  },
                ),
              )
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0XFF3581f6), Color(0XFF54c6fc)])),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ListView.builder(
            itemCount: planetsNames.length,
            itemBuilder: (context, int i) {
              return planetCard(index: i);
            },
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class planetCard extends StatelessWidget {
  final index;
  planetCard({this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Container(
              padding: EdgeInsets.only(left: 80, top: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        planetsNames[index],
                        style: TextStyle(
                            fontSize: 27,
                            color: prefix0.planetNameTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                      IconButton(
                          icon: Icon(
                        Icons.more_vert,
                        color: planetDescriptionTextColor,
                      ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        galaxyName,
                        style: TextStyle(
                            fontSize: 15,
                            color: prefix0.planetDescriptionTextColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 3,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0XFF2a93fb)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: prefix0.planetDescriptionTextColor,
                                  size: 11,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Icon(
                                    Icons.location_on,
                                    color: prefix0.planetDescriptionTextColor,
                                    size: 13,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              planetDistance[index],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: prefix0.planetDescriptionTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_downward,
                                  color: planetDescriptionTextColor,
                                  size: 11,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 6.0, top: 1),
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: prefix0.planetDescriptionTextColor,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              planetGravity[index],
                              style: TextStyle(
                                  fontSize: 12,
                                  color: prefix0.planetDescriptionTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width - 100,
              height: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: prefix0.planetCardColor,
                      blurRadius: 45,
                      spreadRadius: 1)
                ],
                borderRadius: BorderRadius.circular(10),
                color: Color(0XFF444273),
              ),
            ),
          ),
          CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage(planetsImages[index]),
          )
        ],
      ),
    );
  }
}
