import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/details/components/colors_and_price.dart';
import 'package:shop_app/screens/details/components/counterbtn_favbtn.dart';
import 'package:shop_app/screens/details/components/product_desc.dart';
import 'package:shop_app/screens/details/components/product_title_with_image.dart';

import 'add_buybtns.dart';
import 'cart_counter.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.products});
  final Product products;
  @override
  Widget build(BuildContext context) {
    // IT provides us the total height and total width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            //helps to take full height of screen
            height: size.height,
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.4),
                padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding),
                // height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColorAndSize(products: products),
                    SizedBox(height: kDefaultPadding / 2),
                    product_desc(products: products),
                    SizedBox(height: kDefaultPadding / 2),
                    CounterbtnAndFavbtn(),
                    SizedBox(height: kDefaultPadding / 2),
                    Add_Buynowbtns(products: products)
                  ],
                ),
              ),
              ProductTitleWithImage(products: products)
            ]),
          )
        ],
      ),
    );
  }
}
