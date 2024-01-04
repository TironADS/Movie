import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  final String title;
  final String img;
  final String gen;
  final String overview;
  final String date;
  final String post;

  const Page1(
      {Key? key,
      required this.title,
      required this.img,
      required this.gen,
      required this.overview,
      required this.date,
      required this.post})
      : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000153),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  child: Image.network(
                    widget.img.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 100,
                    child:
                    Image.network(widget.post.toString()),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.title.toString(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffce1a),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Genrs :',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(
                    width: 175,
                    child: Text(
                      widget.gen.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'published in :  ',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    widget.date.toString(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),


              SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: Text(
                  widget.overview.toString(),
                  style: TextStyle(fontSize: 13, color: Colors.grey[400]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
