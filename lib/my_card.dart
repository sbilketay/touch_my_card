import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  var _offset = Offset(0.2, 0.6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xffC3DBFF),
        child: Center(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(0.01 * _offset.dy)
              ..rotateY(-0.01 * _offset.dx),
            alignment: FractionalOffset.center,
            child: GestureDetector(
              onPanUpdate: (details){
                setState(()=> _offset += details.delta);
              },
              onPanEnd: (details) {
                 setState(()=> _offset = const Offset(0.2, 0.6));
              },
              child: const Card(),
            ),
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 225,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff4E66BC).withOpacity(1.0),
            spreadRadius: 1,
            blurRadius: 29,
            offset: const Offset(-4, 15),
          ),
        ],
      ),
    );
  }
}
