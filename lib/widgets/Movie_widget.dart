import 'package:flutter/material.dart';
import 'package:flutter_day2_demo/models/Movies.dart';

Widget MovieItem(Function f,
    {String image,
    String titel,
    String releaseYear,
    String voderate,
    List genre}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Card(
      child: Row(
        children: [
          Hero(
            tag: image,
            child: Container(
              padding: EdgeInsets.all(10),
              width: 50,
              height: 110,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
              child: Container(
            width: 300,
            height: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(titel),
                  subtitle: Text(" Vote Average : " + voderate),
                ),
                Text(releaseYear.toString()),
              ],
            ),
          )),
          IconButton(icon: Icon(Icons.favorite), onPressed: f)
        ],
      ),
    ),
  );
}
