import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../../models/product.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    Key? key,
    required this.products,
  }) : super(key: key);

  final Product products;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Color"),
              Row(
                children: const [
                  ColorDot(
                    colors: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(colors: Color.fromARGB(255, 148, 91, 17)),
                  ColorDot(
                    colors: Color.fromARGB(255, 107, 83, 83),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
              text: TextSpan(style: TextStyle(color: kTextcolor), children: [
            TextSpan(text: "size\n"),
            TextSpan(
                text: "${products.size} cm",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(fontWeight: FontWeight.bold))
          ])),
        )
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color colors;
  final bool isSelected;
  const ColorDot({
    Key? key,
    required this.colors,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin:
              EdgeInsets.only(top: kDefaultPadding / 4, right: kDefaultPadding),
          child: Padding(
            padding: const EdgeInsets.all(2.3),
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isSelected ? colors : Colors.transparent)),
              child: DecoratedBox(
                  decoration:
                      BoxDecoration(color: colors, shape: BoxShape.circle)),
            ),
          ),
        )
      ],
    );
  }
}
