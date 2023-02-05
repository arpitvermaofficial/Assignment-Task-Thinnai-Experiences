import 'package:flutter/material.dart';

import '../Screens/screen2.dart';


Color color1 = Color(0xff9e9b9c);
Color categorycard2clr = Colors.white;

class categorycard extends StatelessWidget {
  const categorycard({Key? key, required this.imagename, required this.text})
      : super(key: key);
  final String imagename;
  final String text;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xffd9d9d9)),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Image.asset('assets/$imagename'), Text("$text")],
      ),
    );
  }
}

class Categorycard2 extends StatelessWidget {
  const Categorycard2(
      {Key? key,
      required this.place,
      required this.location,
      required this.rating,
      required this.image,
      required this.price})
      : super(key: key);
  final String place;
  final String location;
  final double rating;
  final String image;
  final int price;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => screen2(
                        place: place,
                        location: location,
                        image: image,
                        rating: rating,
                        price: price)));
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("assets/$image")),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            width: size.width * 0.37,
            height: size.height * 0.2,
          ),
        ),
        Positioned(
          top: 5,
          left: 70,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(categorycard2clr),
              shape: MaterialStateProperty.all(CircleBorder()),
            ),
            onPressed: () {},
            child: Icon(
              size: 19,
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ),
        Positioned(
            left: 10,
            bottom: 50,
            child: Text(
              "$place",
              style: TextStyle(
                  color: categorycard2clr, fontWeight: FontWeight.bold),
            )),
        Positioned(
          left: 7,
          bottom: 30,
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                size: 15,
                color: Colors.white,
              ),
              Text(
                "$location",
                style: TextStyle(
                  fontSize: 10,
                  color: categorycard2clr,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 10,
            left: 10,
            child: Ratingstar(
              rating: rating,
              ratingcolor: categorycard2clr,
              ratingsize: 12.0,
            ))
      ],
    );
  }
}

class Ratingstar extends StatelessWidget {
  const Ratingstar(
      {Key? key,
      required this.rating,
      required this.ratingcolor,
      required this.ratingsize})
      : super(key: key);
  final double rating;
  final Color ratingcolor;
  final double ratingsize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          size: ratingsize,
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          size: ratingsize,
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          size: ratingsize,
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          size: ratingsize,
          Icons.star,
          color: Colors.yellow,
        ),
        Icon(
          size: ratingsize,
          Icons.star,
          color: Colors.grey.shade100,
        ),
        Text(
          " $rating",
          style: TextStyle(
              fontSize: ratingsize - 4,
              fontWeight: FontWeight.bold,
              color: ratingcolor),
        )
      ],
    );
  }
}

class Packagecard extends StatelessWidget {
  const Packagecard(
      {Key? key,
      required this.rating,
      required this.image,
      required this.place,
      required this.price})
      : super(key: key);
  final String image;
  final int price;
  final double rating;
  final String place;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.16,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: color1.withOpacity(1)),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage("assets/$image")),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$place",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                    Icon(Icons.favorite_border)
                  ],
                ),
                Text(
                  "₹$price",
                  style: TextStyle(fontSize: 13, color: Colors.red),
                ),
                Ratingstar(
                  rating: rating,
                  ratingcolor: Colors.black,
                  ratingsize: 18,
                ),
                Text(
                  "A resort is a place used for vacation, relaxation or as a day...",
                  style: TextStyle(
                    color: color1.withOpacity(1),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
