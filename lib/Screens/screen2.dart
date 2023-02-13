import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';

import '../components/widgets.dart';

const Color colorscr2 = Colors.white;

class screen2 extends StatefulWidget {
  const screen2(
      {Key? key,
      required this.place,
      required this.location,
      required this.image,
      required this.rating,
      required this.price})
      : super(key: key);
  final String place;
  final String location;
  final double rating;
  final String image;
  final int price;

  @override
  State<screen2> createState() => _screen2State();
}

bool selectedcard2 = false;

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/${widget.image}",
                  ),
                  fit: BoxFit.fill)),
        ),
        AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    selectedcard2 = !selectedcard2;
                  });
                },
                icon: Icon(
                  Icons.favorite_border,
                  color: selectedcard2 ? Colors.red : Colors.white,
                ))
          ],
          backgroundColor: Colors.transparent,
        ),
        Positioned(
          bottom: 1,
          child: Container(
            padding: EdgeInsets.all(20),
            width: size.width,
            height: size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.place}",
                      style: TextStyle(
                          fontSize: 20,
                          color: colorscr2,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: colorscr2,
                        ),
                        Text(
                          "${widget.location}",
                          style: TextStyle(fontSize: 15, color: colorscr2),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  "One of the most happening beaches in Goa, Baga Beach is where you will find "
                  "water sports,fine dining restaurants, bars, and clubs. Situated in North Goa, "
                  "Baga Beach is bordered by Calangute and Anjuna Beaches.",
                  style: TextStyle(
                    fontSize: 15,
                    color: colorscr2,
                  ),
                ),
                Ratingstar(
                    ratingcolor: Colors.yellow,
                    rating: widget.rating,
                    ratingsize: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${widget.price}/person",
                      style: TextStyle(
                          fontSize: 15,
                          color: colorscr2,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xfffcd240),
                            )),
                        onPressed: () {},
                        child: Text(
                          "Book Now",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ))
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
