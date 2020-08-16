import 'package:flutter/material.dart';

class HeadlineCard extends StatelessWidget {
  const HeadlineCard({
    Key key,
    @required this.headlines,
    @required this.index,
  }) : super(key: key);

  final List headlines;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffEEEEEE),
          ),
        ),
      ),
      child: Row(
        children: [
          Hero(
            tag: headlines[index]['id'],
            child: Image.network(
              headlines[index]['image'],
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            margin: const EdgeInsets.only(left: 14.0),
            child: Text(
              headlines[index]['headline'],
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
