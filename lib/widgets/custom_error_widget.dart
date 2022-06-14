import 'package:destech_app/utils/extensions.dart';
import 'package:destech_app/views/components/components.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;
  final Future<void> Function()  onRefresh;

  const CustomErrorWidget({
    Key? key,
    required this.title, required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title),
      body: RefreshIndicator(
        color: context.primaryColor,
        onRefresh: onRefresh,
        child: ListView(
          children: [
            context.sizedBoxHeightDefault,
            Center(
              child: Text(
                title,style: context.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
