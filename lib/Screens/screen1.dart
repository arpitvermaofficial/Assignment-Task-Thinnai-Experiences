import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen2.dart';

import '../components/constants.dart';
import '../components/widgets.dart';

class screen1 extends StatelessWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: SafeArea(
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.all(18),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: color.withOpacity(1),
                          ),
                          SizedBox(width: size.width * 0.03),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Hello, Vineetha",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset("assets/bell.png"),
                          )
                        ],
                      ),
                      Text(
                        "Where do you want to explore today?",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: color.withOpacity(0.3),
                            ),
                            filled: true,
                            fillColor: color.withOpacity(0.1),
                            focusedBorder: textfieldborder,
                            enabledBorder: textfieldborder),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Choose Category",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(color: color, fontSize: 13),
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          categorycard(imagename: "Beach.png", text: "Beach"),
                          categorycard(
                              imagename: "mountain.png", text: "Mountain"),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 5),
                        height: size.height * 0.2,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            width: 12,
                          ),
                          itemBuilder: (BuildContext context, int index) =>
                              Categorycard2(
                                  price: price[index],
                                  place: place[index],
                                  location: location[index],
                                  rating: rating[index],
                                  image: image[index]),
                          itemCount: place.length,
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular Package",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(color: color, fontSize: 13),
                            )
                          ]),
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        height: size.height * 0.35,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 12,
                          ),
                          itemBuilder: (BuildContext context, int index) =>
                              Packagecard(
                                  price: price[index],
                                  place: place[index],
                                  rating: rating[index],
                                  image: image[index]),
                          itemCount: place.length,
                        ),
                      ),
                    ]),
              ),
            )));
  }
}
