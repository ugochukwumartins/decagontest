import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  List country;
  List colors;
  CardItem({this.country, this.colors});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: country.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              country[index],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: colors.length,
              itemBuilder: (context, index) => ListTile(
                subtitle: Row(
                  children: [
                    Row(
                      children: [
                        Text(colors[index]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
