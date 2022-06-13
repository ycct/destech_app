import 'package:destech_app/utils/extensions.dart';
import 'package:destech_app/views/components/components.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;

  const CustomErrorWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title),
      body: Center(
        child: Text(
          title,
          style: context.headline6,
        ),
      ),
    );
  }
}
