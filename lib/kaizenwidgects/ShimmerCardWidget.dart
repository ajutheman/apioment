import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade500,
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          children: <Widget>[
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return Card(
      color: Colors.cyan,
      child: Row(
        children: [
          Container(
            height: 80,
            child: Row(
              children: <Widget>[],
            ),
          ),
        ],
      ),
    );
  }
}
