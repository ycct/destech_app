import 'package:destech_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'custom_card.dart';

class CategoryListView extends StatelessWidget {
  final double width;
  final String image;
  final double height;
  final String title;
  final VoidCallback onTap;

  const CategoryListView({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap:onTap,
          child: Column(
            children: [
              SizedBox(
                width: width,
                height: height,
                child: CustomCard(
                  radius: AppConstants.extraSmallRadius,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                title,
                style: context.bodyText1,
              )
            ],
          ),
        );
      },
    );
  }
}
