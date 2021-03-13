import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/models/property.dart';
import 'package:real_estate_app/utilities/constants.dart';
import 'package:real_estate_app/views/components/icon_text_horizontal.dart';

Widget propertiesListItem(
  Property property,
) //Include Property object as parameter
{
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(
        left: kMainScreenPadding,
        right: kMainScreenPadding,
        bottom: 10,
        top: 10,
      ),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.realestatebd.com/images/pic8.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  left: kMainScreenPadding,
                  right: kMainScreenPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Clinton Villa",
                      style: kCardLargeTextStyle,
                    ),
                    Text(
                      "\$3,500.00",
                      style: kCardLargeTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: kMainScreenPadding,
                  right: kMainScreenPadding,
                  bottom: 15.0,
                ),
                child: Row(
                  children: [
                    IconText(
                      title: 'Los Angeles',
                      icon: Icons.location_on_outlined,
                    ),
                    Spacer(),
                    IconText(
                      title: '4.4 Reviews',
                      icon: Icons.star_rate,
                      iconColor: Color(0xFFFDC125),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
