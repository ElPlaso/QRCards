import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../data/business_card.dart';
import 'card_view.dart';
import '../providers/card_provider.dart';

class Carousel extends StatefulWidget {
  @override
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
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
        ),
        items: context.watch<Cards>().cards.map(
          (card) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Center(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: CardView(card: card),
                  )),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: CardView(
        card: BusinessCard(
            id: "testID",
            name: "TestName",
            company: "TestCompany",
            position: "TestPosition",
            companyaddress: 'aa',
            companyphone: '123 456 7890',
            email: 'test@testing.com',
            website: 'www.testtesting.net',
            cellphone: '098 765 4321'),
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: CardView(
        card: BusinessCard(
          id: "testID2",
          name: "John",
        ),
      ),
    );
  }
}
