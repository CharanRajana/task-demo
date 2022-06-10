import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({Key? key, required this.id, required this.title})
      : super(key: key);
  final int id;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Card(
      margin: const EdgeInsets.only(left: 10, right: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.black,
      elevation: 5,
      child: SizedBox(
        width: w * 0.7,
        height: h * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 50),
              child: Text(
                '$title'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
