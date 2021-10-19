import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:gradient_text/gradient_text.dart';
import 'package:musio/API/saavn.dart';
import 'package:musio/widgets/album.dart';
import 'package:musio/widgets/search_bar.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<dynamic>>? fututrecall;
  @override
  void initState() {
    super.initState();
    fututrecall = topSongs();
  }

  bool isplaying = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 110,
                    bottom: 15,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GradientText(
                        'Musio.',
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                        gradientType: GradientType.radial,
                        radius: 2.5,
                        colors: [
                          Colors.cyan,
                          Colors.teal,
                        ],
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Theme.of(context).primaryColor,
                          ))
                    ],
                  ),
                ),
              ),
              SearchBar(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 15),
                child: GradientText(
                  'Weekly top songs',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  gradientType: GradientType.radial,
                  radius: 2.5,
                  colors: [
                    Colors.cyan,
                    Colors.teal,
                  ],
                ),
              ),
              FutureBuilder<dynamic>(
                future: fututrecall,
                builder: (ctx, snap) =>
                    snap.connectionState == ConnectionState.waiting
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.all(30),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height - 225,
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                              padding: EdgeInsets.all(0),
                              shrinkWrap: true,
                              itemCount: snap.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: .8,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (ctx, i) => Album(
                                image: snap.data![i]["image"],
                                subtitile: snap.data[i]["more_info"]
                                    ["artistMap"]["primary_artists"][0]["name"],
                                title: snap.data[i]["title"],
                              ),
                            )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
