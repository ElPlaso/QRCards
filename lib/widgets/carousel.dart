import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../data/business_card.dart';
import 'card_view.dart';

class Carousel extends StatefulWidget {
  @override
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  int _currentIndex = 0;

  List cardList = [Item1(), Item2()];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) => CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          onPageChanged: (index, reason) {
            setState(
              () {
                _currentIndex = index;
              },
            );
          },
        ),
        items: cardList.map(
          (card) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Center(child: card),
                );
              },
            );
          },
        ).toList(),
      );
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      card: BusinessCard(
        id: "testID1",
        name: "Bob",
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardView(
      card: BusinessCard(
        id: "testID2",
        name: "John",
      ),
    );
  }
}
