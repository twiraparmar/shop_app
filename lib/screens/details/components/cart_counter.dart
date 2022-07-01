import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartController extends StatefulWidget {
  const CartController({super.key});

  @override
  State<CartController> createState() => _CartControllerState();
}

class _CartControllerState extends State<CartController> {
  int numOfItems = 01;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlinebtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                if (numOfItems > 1) {
                  numOfItems--;
                }
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
          child: Text(
            //if out item is less than 10 than it will add 0 at start
            "$numOfItems".toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlinebtn(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            })
      ],
    );
  }
}

SizedBox buildOutlinebtn(
    {required IconData icon, required VoidCallback press}) {
  return SizedBox(
    width: 40,
    height: 32,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      onPressed: press,
      child: Icon(icon),
    ),
  );
}
