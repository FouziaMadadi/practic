import 'package:demo/constants.dart';
import 'package:demo/custom_functions.dart';
import 'package:demo/customs/borderBox.dart';
import 'package:demo/customs/optionButton.dart';
import 'package:demo/widget_functions.dart';
import 'package:flutter/material.dart';

import '../sample_data.dart';

class Landingscreen extends StatelessWidget {
  get listView => null;

  //var listView;
 Landingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final double paddingup = 55;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(paddingup),
            Padding(
              padding: sidePadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Borderbox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.menu, color:COLOR_BLACK),
                  ),
                  Borderbox(
                    height: 50,
                    width: 50,
                    child: Icon(Icons.settings, color:COLOR_BLACK),
                  ),
                ],
              ),
            ),
            addVerticalSpace(padding),
            Padding(
              padding: sidePadding,
              child: Text(
                'City',
              style: themeData.textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: sidePadding,
              child: Text(
                'San Francisco',
                style: themeData.textTheme.headlineLarge,
              ),
            ),
            Padding(
              padding: sidePadding,
              child: Divider(
                height: padding,
                color: COLOR_GRAY,
              )
            ),
            addVerticalSpace(10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  "<\$220.000", 'For Sale', '3-4 Beds', '>1000 sqft']
                    .map((filter) => ChoiceOption(text: filter)).toList(),
              ),
            ),
            addVerticalSpace(10),
            Expanded(
              child: Padding(
                padding: sidePadding,
                child: listView.builder(
                  physics: BouncingScrollPhysics(),
                    itemCount: RE_DATA.length,
                    itemBuilder: (context, index){
                      return RealEstateItem(itemData: RE_DATA[index]);
                    }
                ),
              ),

            ),
            
          ],
        ),
      ),
    );
  }
}
class ChoiceOption extends StatelessWidget {
  final String text;


   ChoiceOption({required this.text});

  //static BuildContext? get context => null;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: COLOR_GRAY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 25),
      child: Text(text,
        style: themeData.textTheme.headlineSmall,
      ),
    );
  }
}
class RealEstateItem extends StatelessWidget {
  final dynamic itemData;
  RealEstateItem({required this.itemData});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    var size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.asset(itemData['image'])),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Borderbox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.favorite_border, color: COLOR_BLACK),
                    ),
                  ),
                ],
              ),
              addVerticalSpace(15),
              Row(
                children: [
                  Text('${formatCurrency(itemData['amount'])}', style: themeData.textTheme.headlineLarge),
                  addHorizontalSpace(10),
                  Text(
                    '${itemData['address']}',
                    style: themeData.textTheme.bodyMedium,
                  ),
                ],
              ),
              addVerticalSpace(10),
              Text(
                '${itemData['bedrooms']} bedrooms/ ${itemData['bathrooms']} bathrooms / ${itemData['area']} sqft',
                style: themeData.textTheme.headlineSmall,
              )
            ],
          ),
          Positioned(
            bottom: 20,
            width: size.width,
            child: Center(
              child: OptionButton(
              icon: Icons.map_rounded,
              text: 'Map View',
              width: size.width*0.35,
                        ),
            ),
          ),
        ],
      ),
    );
  }
}


